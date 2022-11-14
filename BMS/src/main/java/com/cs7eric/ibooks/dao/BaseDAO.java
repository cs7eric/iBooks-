package com.cs7eric.ibooks.dao;

import com.cs7eric.ibooks.utils.JDBCUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

public class BaseDAO {
    //使用 DbUtils 操作数据库
    private QueryRunner queryRinner = new QueryRunner();

    /**
     * update 用来执行 Insert/Delete/Update 语句
     * @return 如果返回 - 1，说明执行失败，返回其他表示影响的行数
     */
    public int update(String sql,Object ...params){

        Connection conn = JDBCUtils.getConnection();
        try {
            return queryRinner.update(conn,sql,params);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }

    /**
     * 查询返回一个 JavaBean 的 SQL 语句
     * @param type 返回的对象类型
     * @param sql 执行的 SQL 语句
     * @param params SQL 对应的参数值
     * @param <T> 返回的类型的泛型
     * @return
     */
    public <T> T queryForOne(Class<T> type,String sql,Object ...params){
        Connection conn = JDBCUtils.getConnection();
        try {
            return queryRinner.query(conn,sql,new BeanHandler<T>(type),params);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }


    /**
     * 查询返回多个 JavaBean 的 SQL 语句
     * @param type 返回的对象类型
     * @param sql 执行的 SQL 语句
     * @param params SQL 对应的参数值
     * @param <T> 返回的类型的泛型
     * @return
     */
    public <T> List<T> queryForList(Class<T> type, String sql, Object ...params){
        Connection conn = JDBCUtils.getConnection();
        try {
            return queryRinner.query(conn,sql,new BeanListHandler<T>(type),params);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }

    /**
     * 执行返回一行一列的 SQL 语句
     * @param sql 执行的 SQL 语句
     * @param params SQL语句中对应的参数
     * @return
     */
    public Object getForSingleValue(String sql,Object...params){
        Connection conn = JDBCUtils.getConnection();
        try {
            return queryRinner.query(conn, sql, new ScalarHandler(), params);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }
}
