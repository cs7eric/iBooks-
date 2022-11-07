package com.cs7ericibooks.ibooks.dao.impl;

import com.cs7ericibooks.ibooks.dao.BookDAO;
import com.cs7ericibooks.ibooks.pojo.Book;
import org.junit.Test;

import java.math.BigDecimal;
import java.util.List;

import static org.junit.Assert.*;

public class BookDAOImplTest {

    private BookDAO bookDAO = new BookDAOImpl();
    @Test
    public void addBook() {
        bookDAO.addBook(new Book(null,"123","ds","csq",new BigDecimal(2323),34,null,"introduce"));

    }

    @Test
    public void deleteBookById() {
        bookDAO.deleteBookById(6);
    }

    @Test
    public void updateBook() {
        bookDAO.updateBook(new Book(7,"SN34343","css","csq",new BigDecimal(323),3,null,"niubi"));
    }

    @Test
    public void queryBookById() {
        Book book = bookDAO.queryBookById(7);
        System.out.println(book);
    }

    @Test
    public void queryBooks() {
        List<Book> books = bookDAO.queryBooks();
        books.forEach(System.out::println);
    }
}