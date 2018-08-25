package com.ppcxy.cyfm.shop.goods.service;

import com.ppcxy.common.entity.search.Searchable;
import com.ppcxy.common.extend.service.BaseTreeableService;
import com.ppcxy.cyfm.shop.goods.entity.GoodsType;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Set;

/**
 * 树型结构支持，为了满足事物要求需要实现
 */
@Service
@Transactional
public class GoodsTypeService extends BaseTreeableService<GoodsType, Long> {
    
    protected GoodsTypeService() {
        super();
    }
    
    @Override
    public GoodsType save(GoodsType goodsType) {
        return super.save(goodsType);
    }
    
    @Override
    public void deleteSelfAndChild(GoodsType goodsType) {
        super.deleteSelfAndChild(goodsType);
    }
    
    @Override
    public void deleteSelfAndChild(List<GoodsType> goodsTypes) {
        super.deleteSelfAndChild(goodsTypes);
    }
    
    @Override
    public void appendChild(GoodsType parent, GoodsType child) {
        super.appendChild(parent, child);
    }
    
    @Override
    public int nextWeight(Long aLong) {
        return super.nextWeight(aLong);
    }
    
    @Override
    public void move(GoodsType source, GoodsType target, String moveType) {
        super.move(source, target, moveType);
    }
    
    @Override
    public void updateSelftAndChild(GoodsType source, Long newParentId, String newParentIds, int newWeight) {
        super.updateSelftAndChild(source, newParentId, newParentIds, newWeight);
    }
    
    @Override
    protected List<GoodsType> findSelfAndNextSiblings(String parentIds, int currentWeight) {
        return super.findSelfAndNextSiblings(parentIds, currentWeight);
    }
    
    @Override
    public Set<String> findNames(Searchable searchable, String name, Long excludeId) {
        return super.findNames(searchable, name, excludeId);
    }
    
    @Override
    public List<GoodsType> findChildren(List<GoodsType> parents, Searchable searchable) {
        return super.findChildren(parents, searchable);
    }
    
    @Override
    public List<GoodsType> findAllByName(Searchable searchable, GoodsType excludeM) {
        return super.findAllByName(searchable, excludeM);
    }
    
    @Override
    public List<GoodsType> findRootAndChild(Searchable searchable) {
        return super.findRootAndChild(searchable);
    }
    
    @Override
    public Set<Long> findAncestorIds(Iterable<Long> currentIds) {
        return super.findAncestorIds(currentIds);
    }
    
    @Override
    public Set<Long> findAncestorIds(Long currentId) {
        return super.findAncestorIds(currentId);
    }
    
    @Override
    public List<GoodsType> findAncestor(String parentIds) {
        return super.findAncestor(parentIds);
    }
    
    @Override
    public void addExcludeSearchFilter(Searchable searchable, GoodsType excludeM) {
        super.addExcludeSearchFilter(searchable, excludeM);
    }
}
