package com.cs7eric.ibooks.dao;

import com.cs7eric.ibooks.pojo.Book;

import java.util.List;

public interface BookDAO {

    /**
     * 添加图书
     * @param book
     * @return
     */
    public int addBook(Book book);


    /**
     * 通过指定ID 删除图书
     * @param id
     * @return
     */
    public int deleteBookById(Integer id);

    /**
     * 更新图书
     * @param book
     * @return
     */
    public int updateBook(Book book);

    /**
     * 通过指定 ID 查询 图书
     * @param id
     * @return
     */
    public Book queryBookById(Integer id);

    /**
     * 查询所有图书
     * @return
     */
    public List<Book> queryBooks();

    public Integer queryForPageTotalCount();


    public List<Book> queryForPageItems(int begin,int pageSize);

    Book queryByISBN(String ISBN);

    List<Book> queryForRecommend(int pageSize);
}
