package com.kd.util;

import com.alibaba.druid.pool.DruidDataSource;
import org.apache.commons.dbutils.QueryRunner;

public class JDBCUtil {
    private static final String URL="jdbc:mysql://192.168.1.53:3306/movie";
    private static  final String DRIVER="com.mysql.jdbc.Driver";
    private static final String USER="root";
    private static final String PASSWORD="123456789";
    private static DruidDataSource ds=null;
    private static QueryRunner qr=null;

    static {
        ds=new DruidDataSource();
        ds.setDriverClassName(DRIVER);
        ds.setUrl(URL);
        ds.setUsername(USER);
        ds.setPassword(PASSWORD);
        qr=new QueryRunner(ds);
    }
    public static QueryRunner getRunner(){
        return qr;
    }
}
