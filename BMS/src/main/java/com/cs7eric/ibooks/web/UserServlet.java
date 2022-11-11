package com.cs7eric.ibooks.web;

import com.cs7eric.ibooks.pojo.User;
import com.cs7eric.ibooks.service.UserService;
import com.cs7eric.ibooks.service.impl.UserServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.lang.reflect.Method;

import static com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY;

public class UserServlet extends BaseServlet {

    private UserService userService = new UserServiceImpl();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        try {
            Method method = this.getClass().getDeclaredMethod(action,HttpServletRequest.class,HttpServletResponse.class);
            method.invoke(this,request,response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 处理登录的功能
     * @param request
     * @param response
     */
    protected void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        User loginUser = userService.login(new User(null, username, password, null));
        if( loginUser == null){
            //把错误信息回显
            request.setAttribute("msg","用户名或密码错误");
            request.setAttribute("username",username);
            System.out.println("登陆失败，");
            //跳回登录页面
            request.getRequestDispatcher("/pages/user/login.jsp").forward(request, response);
        } else {
            System.out.println("登陆成功");

            //保存用户登录的信息到 Session 域中
            request.getSession().setAttribute("user",loginUser);
            request.getRequestDispatcher("index.jsp").forward(request,response);
        }
    }


    /**
     * 处理注册的功能
     * @param request
     * @param response
     */
    protected void regist(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //获取验证码 token
        String token = (String)request.getSession().getAttribute(KAPTCHA_SESSION_KEY);
        //删除 Session 中的验证码
        request.getSession().removeAttribute(KAPTCHA_SESSION_KEY);


        //1. 获取请求的参数
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String code = request.getParameter("code");
//        User user = WebUtils.copyParamToBean(request.getParameterMap(), new User());

        //2. Google 验证码验证  Kaptcha
        if(token != null && token.equalsIgnoreCase(code)){
            //正确
            //3.检查用户名是否可用
            if(userService.existsUsername(username)){
                //不可用
                //设置回显
                request.setAttribute("email",email);
                request.setAttribute("msg","用户名  " + username + " 不可用");
                request.setAttribute("username",username);
                //跳回注册页面
                request.getRequestDispatcher("pages/user/regist_new.jsp").forward(request,response);
            } else {
                //可用
                //调用 Service 保存到数据库
                userService.register(new User(null,username,password,email));

                //跳转首页
                request.getRequestDispatcher("index.jsp").forward(request,response);
            }


        } else {
            //错误
            //跳回注册页面
            request.setAttribute("msg","验证码 " + code + "  错误");
            //设置回显信息
            request.setAttribute("email",email);
            request.setAttribute("username",username);
            request.getRequestDispatcher("/pages/user/regist.jsp").forward(request,response);
        }
    }


    /**
     *  注销功能
     * @param request
     * @param response
     * @throws IOException
     */
    protected void logout(HttpServletRequest request, HttpServletResponse response) throws IOException {

        //销毁 Session 中用户登录的信息或者销毁 Session
        request.getSession().invalidate();
        //重定向 回首页
        response.sendRedirect(request.getContextPath());
    }

}