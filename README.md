# 设计要求

## 问题描述

在全国各大学校中，图书馆发挥着重要的作用。有人说，图书馆是一个大学的文化深度的标志。图书馆是一个专门收集、整理、保存、传播文献并提供利用的科学、文化、教育和科研机构。图书管理系统有着手工管理无法比拟的优点，如检索迅速、查找方便、可靠性高、存储量大、保密性好、寿命长、成本低等。这些优点能够极大地提高图书管理的效率。因此，开发一套能够为用户提供充足的信息和快捷的查询手段的图书管理系统，将是非常必要的，也是十分及时的。

 

本项目的设计目标旨在方便图书管理员的操作，减少图书管理员的工作量并使其能更有效的管理书库中的图书，实现了传统的图书管理工作的信息化建设。本系统的服务对象为图书馆流通部门的工作人员，用户界面友好，不需计算机专业的专门训练即可使用本系统。

 

## 需求分析

这是一个根据 MVC 模式设计的 Web 程序，为了实现各部分功能解耦合，将软件代码拆分成为组件，单独开发，组合使用

Model 模型：将与业务逻辑相关的数据封装成为具体的 JavaBean 类，其中不掺杂任何与数据处理相关的代码

View 视图：只负责数据和页面的显示，不接受任何与数据无关的代码，便于程序员和美工的分工合作

Controller 控制器：只负责接受请求，调用业务层的代码处理请求，然后派发页面，是一个“调度者”的角色，转到某个页面，或者重定向某个页面

![img](https://cs7eric-image.oss-cn-hangzhou.aliyuncs.com/images/wps1.jpg)

项目的算法思想：

\1. 首先进入 页面，由使用者选择响应功能

\2. 由 客户端（浏览器）向服务器端（Tomcat）传递相关参数 

\3. 服务器端（Tomcat）接受请求，做出响应

\4. dao层,service层处理数据，拿到数据后，填充页面

 

# 概要设计

## 编写目的

本项目的设计目标旨在方便图书管理员的操作，减少图书管理员的工作量并使其能更有效的管理书库中的图书，实现了传统的图书管理工作的信息化建设。本系统的服务对象为图书馆流通部门的工作人员，用户界面友好，不需计算机专业的专门训练即可使用本系统。

 

## 运行环境

Windows 10  x64

JDK 1.8

JavaEE 8

MySQL 8.x

IDEA 2021.3.1

 

## ***\*系统架构\****

![img](https://cs7eric-image.oss-cn-hangzhou.aliyuncs.com/images/wps2.jpg) 

 

## JavaBean 类

### **Page- 分页数据**

### **User - 管理员**

### **书籍类** 

![img](https://cs7eric-image.oss-cn-hangzhou.aliyuncs.com/images/wps3.jpg)![img](https://cs7eric-image.oss-cn-hangzhou.aliyuncs.com/images/wps4.jpg)![img](https://cs7eric-image.oss-cn-hangzhou.aliyuncs.com/images/wps5.jpg) 

 

## 各子程序功能简介

登录 : 可以实现用户登录

注册 : 可以实现用户注册

注销 : 可以实现用户注销

图书浏览 : 可以实现全部图书信息的浏览

图书信息修改 :  可以实现图书信息的修改

图书推荐 : 可以推荐指定数量的图书在图书详情页

图书排序 : 可以按照图书价格排序，默认价格从小到大

搜索图书 : 可以根据 ISBN 书号进行搜索，若存在相应书籍，则跳转到该书籍的信息详情页

 

## 各程序层次关系

各程序功能都符合 dao 层 、service 层 、web 层、JavaBean 类 之间调用的关系。调用层级如图所示

 

![img](https://cs7eric-image.oss-cn-hangzhou.aliyuncs.com/images/wps6.jpg) 

 

# 模块设计

## 模块介绍

本程序后端包含 web,dao,service 三个主要的模块,以及util 工具包

 

## 子模块及功能设计

### **Dao**

![img](https://cs7eric-image.oss-cn-hangzhou.aliyuncs.com/images/wps7.jpg) 

 

### **Service**

![img](https://cs7eric-image.oss-cn-hangzhou.aliyuncs.com/images/wps8.jpg) 

 

### **web**

![img](https://cs7eric-image.oss-cn-hangzhou.aliyuncs.com/images/wps9.jpg) 

 

详细的功能及代码实现会在 详细设计中攥写

 

## 模块的调用关系

以下为 各模块的调用关系

![img](https://cs7eric-image.oss-cn-hangzhou.aliyuncs.com/images/wps10.jpg)



# 详细设计

## 数据库表设计

### 书籍表

```mysql
CREATE TABLE `t_book` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ISBN` varchar(500) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `author` varchar(100) DEFAULT NULL,
  `price` decimal(11,2) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `img_path` varchar(200) DEFAULT NULL,
  `intro` varchar(20000) DEFAULT NULL,
      PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8
```



### 管理员表

```mysql
CREATE TABLE `t_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(32) NOT NULL,
  `email` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1
```





## 配置文件

### Web.xml

```xml
<?xml version="1.0" encoding="UTF-8"?>
<web-app xmlns="http://xmlns.jcp.org/xml/ns/javaee"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://xmlns.jcp.org/xml/ns/javaee http://xmlns.jcp.org/xml/ns/javaee/web-app_4_0.xsd"
         version="4.0">
    <filter>
        <filter-name>TransactionFilter</filter-name>
        <filter-class>com.cs7eric.ibooks.filter.TransactionFilter</filter-class>
    </filter>
    <filter-mapping>
        <filter-name>TransactionFilter</filter-name>
        <url-pattern>/*</url-pattern>
    </filter-mapping>


    <servlet>
        <servlet-name>UserServlet</servlet-name>
        <servlet-class>com.cs7eric.ibooks.web.UserServlet</servlet-class>
    </servlet>
    <servlet>
        <servlet-name>BaseServlet</servlet-name>
        <servlet-class>com.cs7eric.ibooks.web.BaseServlet</servlet-class>
    </servlet>
    <servlet>
        <servlet-name>BookServlet</servlet-name>
        <servlet-class>com.cs7eric.ibooks.web.BookServlet</servlet-class>
    </servlet>
    <servlet>
        <servlet-name>ClientBookServlet</servlet-name>
        <servlet-class>com.cs7eric.ibooks.web.ClientBookServlet</servlet-class>
    </servlet>
    <servlet-mapping>
        <servlet-name>ClientBookServlet</servlet-name>
        <url-pattern>/client/bookServlet</url-pattern>
    </servlet-mapping>

    <servlet-mapping>
        <servlet-name>BookServlet</servlet-name>
        <url-pattern>/manager/bookServlet</url-pattern>
    </servlet-mapping>
    <servlet-mapping>
        <servlet-name>UserServlet</servlet-name>
        <url-pattern>/userServlet</url-pattern>
    </servlet-mapping>
    <servlet-mapping>
        <servlet-name>BaseServlet</servlet-name>
        <url-pattern>/baseServlet</url-pattern>
    </servlet-mapping>


    <servlet>
        <servlet-name>KaptchaServlet</servlet-name>
        <servlet-class>com.google.code.kaptcha.servlet.KaptchaServlet</servlet-class>
    </servlet>
    <servlet-mapping>
        <servlet-name>KaptchaServlet</servlet-name>
        <url-pattern>/kaptcha.jpg</url-pattern>
    </servlet-mapping>
</web-app>
```





### Druid.properties

```properties
url=jdbc:mysql://localhost:3306/ibooks?rewriteBatchedStatements=true
username=root
password=C020611.
driverClassName=com.mysql.cj.jdbc.Driver
initialSize=10
maxActive=20
maxWait=1000
filters=wall
```



# 用户使用手册

## 引言

 

## 快速启动

1. 运行 sql 建表语句
2. 添加相关依赖
3. 更改 druid.properties 配置文件

 

## 软件概述

 

### **技术栈**

#### **前端**

- HTML
- CSS
- JavaScript
- jQuery 1.7.2
- Core-js 3.20.3
- Bootstrap 5.2
- JSP

 

#### **后端**

- Apache Tomcat
- Servlet
- Filter
- MySQL 8.0.x
- JDBC
- Google kaptcha

 

#### **构建工具**

- maven 3.8.1

 

 

#### 主要依赖库

- commons-beanutils-1.8.0
- commons-dbutils-1.3
- common-logging-1.1.1
- dom4j-1.6.1
- druid-1.1.10
- hamcrest-core-1.3
- junit-4.12
- kaptcha-2.3.2
- mysql-connector-java-8.0.30
- taglibs-standard-impl-1.2.1
- taglibs-standard-spec-1.2.1

 

## 使用说明

项目 URL : http://localhost:8088/iBooks/

 

 

## 项目分工

后端：陈帅旗、孙荣耀、丁荣荣、张翔熙

前端：崔倩倩、陈帅旗

UI设计：崔倩倩、陈帅旗

页面联调：陈帅旗、崔倩倩

项目架构：陈帅旗

项目文档纂写：陈帅旗、张翔熙、孙荣耀、丁荣荣、崔倩倩

 

项目源码

github 开源仓库: https://github.com/cs7eric/iBooks-
