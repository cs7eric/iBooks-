package com.cs7ericibooks.ibooks.service;

import com.cs7ericibooks.ibooks.pojo.Book;
import com.cs7ericibooks.ibooks.pojo.Page;

import java.util.List;

public interface BookService {


    public void addBook(Book book);

    public void deleteBookById(Integer id);

    public void updateBook(Book book);

    public Book queryBookById(Integer id);

    public List<Book> queryBooks();

    public Page<Book> page(int pageNo, int pageSize);

    Book queryByISBN(String ISBN);
}
