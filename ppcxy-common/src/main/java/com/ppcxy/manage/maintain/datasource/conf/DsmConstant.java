package com.ppcxy.manage.maintain.datasource.conf;

/**
 * 系统配置静态常量类.
 *
 * @author weep
 */
public interface DsmConstant {
    
    // 占位符
    public static final String placeholder = "%S";
    
    public static final String SYS_DATABASE_NAME = "MYSQL";
    
    public static final String MYSQL = "MYSQL";
    
    public static final String MSSQLSERVER = "MSSQLSERVER";
    
    public static final String ORACLE = "ORACLE";
    
    
    //mysql constant***********************************************
    // 数据库驱动mysql
    public static final String MYSQL_DRIVER = "com.mysql.jdbc.Driver";
    
    // MySql查库名
    public static final String MYSQL_DATABASE_NAME = "SELECT SCHEMA_NAME AS DATABSE_NAME FROM INFORMATION_SCHEMA.SCHEMATA";
    
    // MySql查表名
    public static final String MYSQL_TABLE_NAME = "SELECT TABLE_NAME,TABLE_TYPE FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA=?"; //AND TABLE_TYPE='BASE TABLE' orVIEW
    
    // MySql查字段
    public static final String MYSQL_COLUMN_NAME = "SELECT COLUMN_NAME,COLUMN_TYPE,COLUMN_COMMENT FROM INFORMATION_SCHEMA.COLUMNS WHERE 1<>? and TABLE_SCHEMA=(select database() as dbName) AND TABLE_NAME=?";
    
    
    //SQL SERVER constant***********************************************
    // MSSQLSERVER
    public static final String MSSQLSERVER_DRIVER = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
    
    // MSSQLSERVER 查库名
    public static final String MSSQLSERVER_DATABASE_NAME = "SELECT NAME AS DATABASE_NAME FROM SYS.SYSDATABASES";
    
    // MSSQLSERVER查表名
    public static final String MSSQLSERVER_TABLE_NAME = "SELECT TABLE_NAME,TABLE_TYPE FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_CATALOG=?";
    
    // MSSQLSERVER查字段   1 != ? 为了兼容其他类型数据库的查询
    public static final String MSSQLSERVER_COLUMN_NAME = "SELECT NAME COLUMN_NAME , ( TYPE_NAME(SYSTEM_TYPE_ID) + '('  + cast(MAX_LENGTH as VARCHAR)  + ')') AS COLUMN_TYPE FROM SYS.COLUMNS WHERE '1'!=? and OBJECT_ID=OBJECT_ID(?)";// order by ColumnName" ;
    
    
    // MsSql2000查库名
    public static final String MSSQL2000_ATABASE_NAME = "select name as table_name from sysdatabases order by name ";
    
    // MsSql2000查表名
    public static final String MSSQL2000_TABLE_NAME = "select name as table_name from sysobjects where type='U' and category = 0  order by name";
    
    // MsSql2000查字段
    public static final String MSSQL2000_OLUMN_NAME = "SELECT c.name as column_name,bt.name as data_type from syscolumns c INNER JOIN systypes st on st.xusertype = c.xusertype INNER JOIN "
            + "systypes bt on bt.xusertype = c.xtype INNER JOIN sysobjects o on o.id=c.id WHERE c.number = 0 and c.name IS NOT NULL and o.name=?  order by ColumnName";
    
    
    //ORACLE constant***********************************************
    // Oracle驱动
    public static final String ORACLE_DRIVER = "oracle.jdbc.driver.OracleDriver";
    
    public static final String ORACLE_DATABASE_NAME = "SELECT USERNAME AS DATABSE_NAME FROM SYS.DBA_USERS ORDER BY USERNAME";
    
    // Oracle查表名
    public static final String ORACLE_TABLE_NAME = "SELECT TABLE_NAME FROM ALL_TABLES WHERE OWNER=?";
    
    // Oracle查字段
    public static final String ORACLE_COLUMN_NAME = "SELECT COLUMN_NAME AS COLUMN_NAME,DATA_TYPE AS DATA_TYPE FROM ALL_TAB_COLUMNS WHERE OWNER=? AND TABLE_NAME=?";
    
    
}
