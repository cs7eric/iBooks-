package com.cs7eric.ibooks.web;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class ClientBookServlet extends BaseServlet {


    protected void index (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        boolean isIndex = true;
        request.setAttribute("isIndex",isIndex);
        request.getRequestDispatcher("/pages/client/index.jsp").forward(request,response);
    }
}
