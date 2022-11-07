package com.cs7ericibooks.ibooks.service.impl;

import com.cs7ericibooks.ibooks.dao.BookDAO;
import com.cs7ericibooks.ibooks.dao.impl.BookDAOImpl;
import com.cs7ericibooks.ibooks.pojo.Book;
import com.cs7ericibooks.ibooks.pojo.Page;
import com.cs7ericibooks.ibooks.service.BookService;

import java.util.List;

public class BookServiceImpl implements BookService {

    private BookDAO bookDAO = new BookDAOImpl();

    @Override
    public void addBook(Book book) {
        bookDAO.addBook(book);
    }

    @Override
    public void deleteBookById(Integer id) {
        bookDAO.deleteBookById(id);
    }

    @Override
    public void updateBook(Book book) {
        bookDAO.updateBook(book);
    }

    @Override
    public Book queryBookById(Integer id) {
        return bookDAO.queryBookById(id);
    }

    @Override
    public List<Book> queryBooks() {
        return bookDAO.queryBooks();
    }

    @Override
    public Page<Book> page(int pageNo, int pageSize) {
        Page<Book> page = new Page<Book>();



        //设置每页显示的数量
        page.setPageSize(pageSize);

        //求总记录数
        Integer pageTotalCount = bookDAO.queryForPageTotalCount();

        //设置总记录数
        page.setPageTotalCount(pageTotalCount);

        Integer pageTotal = pageTotalCount / pageSize;
        if(pageTotalCount % pageSize > 0){
            pageTotal++;
        }

        //设置总页码
        page.setPageTotal(pageTotal);
        //设置当前页码
        page.setPageNo(pageNo);

        //求当前页面数据的开始索引
        int begin = (page.getPageNo() - 1) * pageSize;

        //求当前页数据
        List<Book> items = bookDAO.queryForPageItems(begin, pageSize);

        //设置当前页数据
        page.setItems(items);

        return page;
    }

    @Override
    public Book queryByISBN(String ISBN) {
        return bookDAO.queryByISBN(ISBN);
    }
}
