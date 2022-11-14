package com.cs7eric.ibooks.utils;

import com.alibaba.druid.pool.DruidDataSource;
import com.alibaba.druid.pool.DruidDataSourceFactory;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Properties;

public class JDBCUtils {

    private static DruidDataSource dataSource;
    private static ThreadLocal<Connection> conns = new ThreadLocal<Connection>();

    static {
        try {
            Properties properties = new Properties();
            InputStream inputStream = JDBCUtils.class.getClassLoader().getResourceAsStream("druid.properties");
            properties.load(inputStream);
            dataSource = (DruidDataSource) DruidDataSourceFactory.createDataSource(properties);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    /**
     * 获取数据库连接池中的链接
     * @return 如果返回 null,说明获取连接失败   有值就是获取成功
     */
    public static Connection getConnection(){
        Connection conn = conns.get();
        try {
            conn = dataSource.getConnection();
            conns.set(conn);
            conn.setAutoCommit(false);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return conn;
    }


    /**
     * 提交事务 并 关闭连接
     */
    public static void commitAndClose(){

        Connection conn = conns.get();
        if(conn != null){

            try {
                conn.commit();
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }

        conns.remove();
    }


    /**
     * 回退事务并关闭连接
     */
    public static void  rollbackAndClose(){

        Connection conn = conns.get();
        if (conn != null){

            try {
                conn.rollback();
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        conns.remove();
    }



//    /**
//     * 关闭链接，放回数据库连接池
//     * @param conn
//     */
//    public static void close(Connection conn) {
//        if(conn != null){
//            try {
//                conn.close();
//            } catch (SQLException e) {
//                e.printStackTrace();
//            }
//        }
//    }
}
