package com.ppcxy.cyfm.shop.order.web;

import com.ppcxy.common.Constants;
import com.ppcxy.common.exception.BaseException;
import com.ppcxy.common.web.controller.BaseCRUDController;
import com.ppcxy.cyfm.shop.order.entity.ShoppingOrder;
import com.ppcxy.cyfm.shop.order.service.ShoppingOrderService;
import com.ppcxy.cyfm.shop.user.service.UserDetailService;
import com.ppcxy.cyfm.shop.utils.PaymentUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.net.URLEncoder;
import java.util.ResourceBundle;

@Controller
@RequestMapping("/shop/order")
public class ShoppingOrderController extends BaseCRUDController<ShoppingOrder, Long> {
    @Autowired
    private ShoppingOrderService shoppingOrderService;
    @Autowired
    private UserDetailService userDetailService;
    
    public ShoppingOrderController() {
        setResourceIdentity("shop:order");
        setModelName("shopOrder");
    }
    
    @RequestMapping("deliver")
    @ResponseBody
    public String deliver(String orderNum, String trackNum) {
        return shoppingOrderService.deliver(orderNum, trackNum).toString();
    }
    
    
    @Override
    public void afterUpdateForm(ShoppingOrder entity, Model model) {
        model.addAttribute("shopUser", userDetailService.findByUserId(entity.getUserId()));
        super.afterUpdateForm(entity, model);
    }
    
    
    @RequestMapping(value = "close/{id}", method = RequestMethod.GET)
    public String close(
            @PathVariable("id") Long id,
            @RequestParam(value = Constants.BACK_URL, required = false) String backURL,
            RedirectAttributes redirectAttributes) {
        
        shoppingOrderService.close(id);
        
        redirectAttributes.addFlashAttribute(Constants.MESSAGE, "关闭订单成功");
        return redirectToUrl(backURL);
    }
    
    @RequestMapping(value = "goPay", method = RequestMethod.GET)
    public String goPay(String orderNum, Model model) {
        model.addAttribute("order", shoppingOrderService.findByOrderNum(orderNum));
        return "/shop/order/shopOrder_pay";
    }
    
    @RequestMapping(value = "pay", method = RequestMethod.POST)
    public String pay(String orderNum, HttpServletRequest request) throws Exception {
        
        ShoppingOrder order = shoppingOrderService.findByOrderNum(orderNum);
        if (order == null || (!"0".equalsIgnoreCase(order.getOrderState()) || !"0".equalsIgnoreCase(order.getOrderReturnState()))) {
            throw new BaseException("订单已支付，或已关闭，请刷新订单列表。");
        }
        // 支付渠道id
        String pd_FrpId = request.getParameter("pd_FrpId");
        String p0_Cmd = "Buy";
        //商户id
        String p1_MerId = ResourceBundle.getBundle("merchantInfo").getString("p1_MerId");
        //设置订单号
        String p2_Order = order.getOrderNum();
        String p3_Amt = "0.01";
        String p4_Cur = "CNY";
        String p5_Pid = order.getTitle();
        String p6_Pcat = "";
        String p7_Pdesc = "";
        // 支付成功回调地址 ---- 第三方支付公司会访问、用户访问
        // 第三方支付可以访问网址
        String p8_Url = ResourceBundle.getBundle("merchantInfo").getString("responseURL");
        String p9_SAF = "";
        String pa_MP = "";
        String pr_NeedResponse = "1";
        // 加密hmac 需要密钥
        String keyValue = ResourceBundle.getBundle("merchantInfo").getString("keyValue");
        String hmac = PaymentUtil.buildHmac(p0_Cmd, p1_MerId, p2_Order, p3_Amt,
                p4_Cur, p5_Pid, p6_Pcat, p7_Pdesc, p8_Url, p9_SAF, pa_MP,
                pd_FrpId, pr_NeedResponse, keyValue);
        
        
        //发送给第三方
        StringBuffer sb = new StringBuffer("https://www.yeepay.com/app-merchant-proxy/node?");
        sb.append("p0_Cmd=").append(p0_Cmd).append("&");
        sb.append("p1_MerId=").append(p1_MerId).append("&");
        sb.append("p2_Order=").append(p2_Order).append("&");
        sb.append("p3_Amt=").append(p3_Amt).append("&");
        sb.append("p4_Cur=").append(p4_Cur).append("&");
        sb.append("p5_Pid=").append(URLEncoder.encode(order.getTitle(), "GBK")).append("&");
        sb.append("p6_Pcat=").append(p6_Pcat).append("&");
        sb.append("p7_Pdesc=").append(p7_Pdesc).append("&");
        sb.append("p8_Url=").append(p8_Url).append("&");
        sb.append("p9_SAF=").append(p9_SAF).append("&");
        sb.append("pa_MP=").append(pa_MP).append("&");
        sb.append("pd_FrpId=").append(pd_FrpId).append("&");
        sb.append("pr_NeedResponse=").append(pr_NeedResponse).append("&");
        sb.append("hmac=").append(hmac);
        
        return "redirect:" + sb.toString();
    }
    
    @RequestMapping("callback")
    public String callback(HttpServletRequest request, HttpServletResponse response, RedirectAttributes redirectAttributes) throws Exception {
        String p1_MerId = request.getParameter("p1_MerId");
        String r0_Cmd = request.getParameter("r0_Cmd");
        String r1_Code = request.getParameter("r1_Code");
        String r2_TrxId = request.getParameter("r2_TrxId");
        String r3_Amt = request.getParameter("r3_Amt");
        String r4_Cur = request.getParameter("r4_Cur");
        String r5_Pid = request.getParameter("r5_Pid");
        String r6_Order = request.getParameter("r6_Order");
        String r7_Uid = request.getParameter("r7_Uid");
        String r8_MP = request.getParameter("r8_MP");
        String r9_BType = request.getParameter("r9_BType");
        String rb_BankId = request.getParameter("rb_BankId");
        String ro_BankOrderId = request.getParameter("ro_BankOrderId");
        String rp_PayDate = request.getParameter("rp_PayDate");
        String rq_CardNo = request.getParameter("rq_CardNo");
        String ru_Trxtime = request.getParameter("ru_Trxtime");
        // 身份校验 --- 判断是不是支付公司通知你
        String hmac = request.getParameter("hmac");
        String keyValue = ResourceBundle.getBundle("merchantInfo").getString(
                "keyValue");
        
        // 自己对上面数据进行加密 --- 比较支付公司发过来hamc
        boolean isValid = PaymentUtil.verifyCallback(hmac, p1_MerId, r0_Cmd,
                r1_Code, r2_TrxId, r3_Amt, r4_Cur, r5_Pid, r6_Order, r7_Uid,
                r8_MP, r9_BType, keyValue);
        if (isValid) {
            // 响应数据有效
            if (r9_BType.equals("1")) {
                // 浏览器重定向
                //修改订单状态
                redirectAttributes.addFlashAttribute(Constants.MESSAGE, "您的订单号为:" + r6_Order + ",金额为:" + r3_Amt + "已经支付成功,等待发货~~");
            } else if (r9_BType.equals("2")) {
                // 服务器点对点 --- 支付公司通知你
                // 修改订单状态 为已付款
                // 回复支付公司
                ShoppingOrder order = shoppingOrderService.findByOrderNum(r6_Order);
                order.setOrderState("1");
                shoppingOrderService.update(order);
                response.getWriter().print("success");
            }
            
            
        } else {
            // 数据无效
            throw new BaseException("支付过程发生错误，请联系客服。");
        }
        return "redirect:/shop/member/order";
        
    }
}
