package com.ppcxy.common.web.filter;

import org.springside.modules.web.Servlets;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by weep on 2016-5-19.
 */
public class PreSiteMeshFilter extends BaseFilter implements Filter {


    /**
     * 子类覆盖
     *
     * @param request
     * @param response
     * @param chain
     * @throws IOException
     * @throws ServletException
     */
    public void doFilter(HttpServletRequest request, HttpServletResponse response, FilterChain chain) throws IOException, ServletException {

        if ((request.getContextPath() + "/").equals(request.getRequestURI())) {
            Servlets.changeCookie("skin", "default", request, response);
        }
        chain.doFilter(request, response);
    }

}
