package com.cs7eric.ibooks.pojo;

import java.math.BigDecimal;

public class Book {

    private Integer id;
    private String ISBN;
    private String name;
    private String author;
    private BigDecimal price;
    private Integer stock;
    private String imgPath = "static/img/default.jpg";
    private String intro;

    public Book() {
    }

    public Book(Integer id, String ISBN, String name, String author, BigDecimal price, Integer stock, String imgPath, String intro) {
        this.id = id;
        this.ISBN = ISBN;
        this.name = name;
        this.author = author;
        this.price = price;
        this.stock = stock;
        this.imgPath = imgPath;
        this.intro = intro;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getISBN() {
        return ISBN;
    }

    public void setISBN(String ISBN) {
        this.ISBN = ISBN;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public Integer getStock() {
        return stock;
    }

    public void setStock(Integer stock) {
        this.stock = stock;
    }

    public String getImgPath() {
        return imgPath;
    }

    public void setImgPath(String imgPath) {
        this.imgPath = imgPath;
    }

    public String getIntro() {
        return intro;
    }

    public void setIntro(String intro) {
        this.intro = intro;
    }

    @Override
    public String toString() {
        return "Book{" +
                "id=" + id +
                ", ISBN='" + ISBN + '\'' +
                ", name='" + name + '\'' +
                ", author='" + author + '\'' +
                ", price=" + price +
                ", stock=" + stock +
                ", imgPath='" + imgPath + '\'' +
                ", intro='" + intro + '\'' +
                '}';
    }
}
