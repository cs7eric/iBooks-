package com.cs7eric.ibooks.dao.impl;

import com.cs7eric.ibooks.dao.BaseDAO;
import com.cs7eric.ibooks.dao.BookDAO;
import com.cs7eric.ibooks.pojo.Book;

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
        String sql = "update t_book set `ISBN`=?, `name`=?,`author`=?,`price`=?,`stock`=?,`intro`=? ,`img_path`=? where id = ?";
        return update(sql,book.getISBN(),book.getName(),book.getAuthor(),book.getPrice(),book.getStock(),book.getIntro(),book.getImgPath(),book.getId());
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

    @Override
    public List<Book> queryForRecommend(int pageSize) {
        String sql = "select `id` , `ISBN`, `name` , `author` , `price` , `stock` , `img_path` imgPath , `intro` from t_book order by rand () limit ?";
        return queryForList(Book.class,sql,pageSize);
    }
}
