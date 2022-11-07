package com.cs7ericibooks.ibooks.dao.impl;

import com.cs7ericibooks.ibooks.dao.BaseDAO;
import com.cs7ericibooks.ibooks.dao.BookDAO;
import com.cs7ericibooks.ibooks.pojo.Book;

import java.util.List;

public class BookDAOImpl extends BaseDAO implements BookDAO {
    @Override
    public int addBook(Book book) {
        String sql = "insert into t_book(ISBN,name,author,price,stock,img_path,intro)values(?,?,?,?,?,?,?)";
        return update(sql,book.getISBN(),book.getName(),book.getAuthor(),book.getPrice(),book.getStock(),book.getImgPath(),book.getIntro());
    }

    @Override
    public int deleteBookById(Integer id) {
        String sql = "delete from t_book where id = ?";
        return update(sql,id);
    }

    @Override
    public int updateBook(Book book) {
        String sql = "update t_book set `ISBN`=?, `name`=?,`author`=?,`price`=?,`stock`=?,`img_path`=?,`intro`=? where id = ?";
        return update(sql,book.getISBN(),book.getName(),book.getAuthor(),book.getPrice(),book.getStock(),book.getImgPath(),book.getIntro(),book.getId());
    }

    @Override
    public Book queryBookById(Integer id) {
        String sql = "select `id` , `ISBN`, `name` , `author` , `price` , `stock` , `img_path` imgPath , `intro` from t_book where id =?";
        return queryForOne(Book.class,sql,id);
    }

    @Override
    public List<Book> queryBooks() {
        String sql = "select `id` ,`ISBN`, `name` , `author` , `price` , `stock` , `img_path` imgPath ,`intro` from t_book";
        return queryForList(Book.class,sql);
    }

    @Override
    public Integer queryForPageTotalCount() {
        String sql = "select count(*) from t_book";
        Number count = (Number)getForSingleValue(sql);
        return count.intValue();
    }

    @Override
    public List<Book> queryForPageItems(int begin, int pageSize) {
        String sql = "select `id` , `ISBN`, `name` , `author` , `price` , `stock` , `img_path` imgPath ,`intro` from t_book limit ?,?";
        return queryForList(Book.class, sql,begin,pageSize);
    }

    @Override
    public Book queryByISBN(String ISBN) {
        String sql = "select `id` , `ISBN`, `name` , `author` , `price` , `stock` , `img_path` imgPath , `intro` from t_book where ISBN =?";
        return queryForOne(Book.class,sql,ISBN);
    }
}
