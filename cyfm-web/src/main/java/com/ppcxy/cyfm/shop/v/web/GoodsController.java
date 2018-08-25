package com.ppcxy.cyfm.shop.v.web;

import com.google.common.collect.Maps;
import com.ppcxy.common.entity.search.SearchOperator;
import com.ppcxy.common.entity.search.Searchable;
import com.ppcxy.common.exception.BaseException;
import com.ppcxy.cyfm.filestore.upload.entity.StoreFiles;
import com.ppcxy.cyfm.filestore.upload.service.StoreFilesService;
import com.ppcxy.cyfm.filestore.upload.support.utils.DownloadUtils;
import com.ppcxy.cyfm.shop.goods.entity.GoodsBaseInfo;
import com.ppcxy.cyfm.shop.goods.entity.GoodsSpec;
import com.ppcxy.cyfm.shop.goods.service.GoodsBaseInfoService;
import com.ppcxy.cyfm.shop.goods.service.GoodsBrandService;
import com.ppcxy.cyfm.shop.goods.service.GoodsSpecService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springside.modules.mapper.JsonMapper;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

/**
 * 前端商品相关web层控制器
 */
@Controller
@RequestMapping(value = "/shop/v")
public class GoodsController {
    
    @Autowired
    private GoodsBaseInfoService goodsBaseInfoService;
    @Autowired
    private GoodsSpecService goodsSpecService;
    @Autowired
    private GoodsBrandService brandService;
    
    /**
     * 前端商品列表，支持分页筛选排序等操作
     *
     * @param typeId
     * @param brandId
     * @param searchParam
     * @param pn
     * @param sort
     * @param model
     * @return
     */
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String list(Long typeId, Long brandId, String searchParam, Integer pn, @RequestParam(value = "sort", defaultValue = "") String sort, Model model) {
        //构造查询参数
        Searchable searchable = Searchable.newSearchable();
        if (typeId != null) {
            searchable.addSearchFilter("goodsType.id", SearchOperator.eq, typeId);
        }
        if (StringUtils.isNotBlank(searchParam)) {
            searchable.addSearchFilter("title", SearchOperator.like, searchParam);
        }
        if (brandId != null) {
            searchable.addSearchFilter("goodsBrand.id", SearchOperator.eq, brandId);
        }
        //如果没有页参数默认第一页
        if (pn == null) {
            pn = 0;
        }
        //构造排序参数
        switch (sort) {
            case "xl":
                searchable.addSort(Sort.Direction.DESC, "suggest");
                break;
            case "price":
                searchable.addSort(Sort.Direction.ASC, "basePrice");
                break;
            case "suggest":
                searchable.addSort(Sort.Direction.DESC, "suggest");
                break;
            case "date":
                searchable.addSort(Sort.Direction.DESC, "createDate");
                break;
            default:
                break;
        }
        //设置每页显示条数
        searchable.setPage(pn, 50);
        //进行查询讲返回结果设置到请求中，供页面显示
        Page<GoodsBaseInfo> page = goodsBaseInfoService.findAll(searchable);
        //顺便查询品牌列表
        model.addAttribute("brands", brandService.findAll());
        model.addAttribute("page", page);
        return "/shop/v/goods_list";
    }
    
    /**
     * 进入商品详情页面
     * @param goodsBaseInfo
     * @param model
     * @return
     */
    @RequestMapping(value = "/detail/{goodsId}", method = RequestMethod.GET)
    public String detail(@PathVariable(value = "goodsId") GoodsBaseInfo goodsBaseInfo, Model model) {
        model.addAttribute("typeId", goodsBaseInfo.getGoodsType().getId());
        
        return "/shop/v/goods_detail";
    }
    
    /**
     * 商品详情信息ajax获取，在页面用js绑定数据
     * @param goodsId
     * @return
     */
    @RequestMapping(value = "/detail/{goodsId}", method = RequestMethod.POST)
    @ResponseBody
    public String detailInfo(@PathVariable(value = "goodsId") Long goodsId) {
        
        GoodsBaseInfo baseInfo = goodsBaseInfoService.findOne(goodsId);
        
        List<GoodsSpec> goodsSpecs = goodsSpecService.findByGoodsId(goodsId);
        
        Map<String, Object> results = Maps.newHashMap();
        
        results.put("info", baseInfo);
        results.put("specs", goodsSpecs);
        
        return new JsonMapper().toJson(results);
    }
    
    @Autowired
    private StoreFilesService storeFilesService;
    
    /**
     * 前端用户的图片加载方法（在未登录状态下查看图片）
     * @param fileId
     * @param request
     * @param response
     */
    @RequestMapping(value = "pic", method = RequestMethod.GET)
    @ResponseBody
    public void downloadLocal(@RequestParam(value = "fileIds", required = false) String fileId, HttpServletRequest request, HttpServletResponse response) {
        //解决中文乱码问题
        String filename = null;
        File downloadFile = null;
        
        
        StoreFiles sf = storeFilesService.findOne(fileId);
        downloadFile = new File(sf.getLocation());
        
        try {
            DownloadUtils.download(request, response, downloadFile, filename);
        } catch (IOException e) {
            throw new BaseException("文件下载失败,未找到要下载的文件.", e);
        }
        
    }
    
}
