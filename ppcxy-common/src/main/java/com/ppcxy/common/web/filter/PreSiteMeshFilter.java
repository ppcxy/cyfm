package com.ppcxy.common.web.filter;

import javax.servlet.*;
import java.io.IOException;

/**
 * Created by weep on 2016-5-19.
 */
public class PreSiteMeshFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {

    }
}
