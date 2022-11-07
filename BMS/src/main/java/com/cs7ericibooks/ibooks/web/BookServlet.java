package com.cs7ericibooks.ibooks.web;

import com.cs7ericibooks.ibooks.dao.BookDAO;
import com.cs7ericibooks.ibooks.dao.impl.BookDAOImpl;
import com.cs7ericibooks.ibooks.pojo.Book;
import com.cs7ericibooks.ibooks.pojo.Page;
import com.cs7ericibooks.ibooks.service.BookService;
import com.cs7ericibooks.ibooks.service.impl.BookServiceImpl;
import com.cs7ericibooks.ibooks.utils.WebUtils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class BookServlet extends BaseServlet{

    private BookService bookService = new BookServiceImpl();
    private BookDAO bookDAO = new BookDAOImpl();

    protected void list(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //通过 bookService 查询全部图书
        List<Book> bookList = bookService.queryBooks();
        //将全部图书保存到 request 域 中
        request.setAttribute("bookList",bookList);
        //请求转发到 /pages/manager/book_manager.jsp 页面
        request.getRequestDispatcher( "/pages/manager/book_manager.jsp").forward(request,response);
//        response.sendRedirect(request.getContextPath() + "/pages/manager/book_manager.jsp");
    }

    protected void add(HttpServletRequest request, HttpServletResponse response){
        //获取请求参数 ---封装成为 Book 对象
        Book book = WebUtils.copyParamToBean(request.getParameterMap(), new Book());
        //调用 BookService.addBook
        bookService.addBook(book);
        try {
            response.sendRedirect(request.getContextPath() + "/manager/bookServlet?action=page");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    protected void delete(HttpServletRequest request, HttpServletResponse response) throws IOException {

        //获取参数
        int id = WebUtils.parseInt(request.getParameter("id"),0);
        //调用 bookService.deleteBookById()
        bookService.deleteBookById(id);
        //重定向回图书列表管理页面
        response.sendRedirect(request.getContextPath() + "/manager/bookServlet?action=page");
    }

    protected void getBook(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //获取参数
        int id = WebUtils.parseInt(request.getParameter("id"), 0);
        //调用 bookService.queryBookById()查询图书
        Book book = bookService.queryBookById(id);
        //保存图书 到 Request域中
        request.setAttribute("book",book);
        //请求转发到  pages/manager/book_edit.jsp 页面
        request.getRequestDispatcher("/pages/manager/book_edit.jsp").forward(request,response);

    }

    protected void update(HttpServletRequest request, HttpServletResponse response) throws IOException {

        //获取参数  封装成为 Book 对象
        Book book = WebUtils.copyParamToBean(request.getParameterMap(), new Book());
        //调用 bookService.updateBook()修改图书
        bookService.updateBook(book);
        //重定向回图书管理页面
        response.sendRedirect(request.getContextPath() + "/manager/bookServlet?action=page");
    }

    protected void page(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //获取请求参数  pageNo 和 pageSize
        int pageNo = WebUtils.parseInt(request.getParameter("pageNo"), 1);
        int pageSize = WebUtils.parseInt(request.getParameter("pageSize"), Page.PAGE_SIZE);

        //调用 BookService.page(pageNo,pageSize) :Page 对象
        Page<Book> page = bookService.page(pageNo, pageSize);
        //保存 Page 对象到 Request 域中
        request.setAttribute("page",page);
        //请求转发到 /pages/manager/book_manager.jsp 页面
        request.getRequestDispatcher( "/pages/manager/book_manager.jsp").forward(request,response);
    }

    protected void info (HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {

        //获取参数
        String ISBN = request.getParameter("ISBN");
        //调用bookService.queryByISBN
        Book book = bookService.queryByISBN(ISBN);
        //把 book 保存到 request 域中
        request.setAttribute("bookInfo",book);
        //请求转发
        request.getRequestDispatcher("/pages/manager/book_info.jsp").forward(request,response);
    }

    protected void index(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //获取当前总图书数，保存到 Request 域中
        Integer totalCount = bookDAO.queryForPageTotalCount();
        request.setAttribute("totalCount",totalCount);

        //请求转发到 index.jsp
        request.getRequestDispatcher("/index.jsp").forward(request,response);
    }
}
