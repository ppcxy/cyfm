package com.ppcxy.cyfm.manage.maintain.datasource.conf;

/**
 * Created by weep on 2016-5-23.
 */
public enum DataBaseType {
    
    MYSQL("mysql数据库", DsmConstant.MYSQL_DRIVER, DsmConstant.MYSQL_DATABASE_NAME, DsmConstant.MYSQL_COLUMN_NAME),
    ORACLE("oracle数据库", DsmConstant.ORACLE_DRIVER, DsmConstant.ORACLE_DATABASE_NAME, DsmConstant.ORACLE_COLUMN_NAME),
    MSSQLSERVER("微软SqlServer数据库", DsmConstant.MSSQLSERVER_DRIVER, DsmConstant.MSSQLSERVER_DATABASE_NAME, DsmConstant.MSSQLSERVER_COLUMN_NAME);
    
    private final String name;
    private final String driver;
    private final String tableNameSql;
    private final String columnNameSql;
    
    private DataBaseType(String name, String driver, String tableNameSql, String columnNameSql) {
        this.name = name;
        this.driver = driver;
        this.tableNameSql = tableNameSql;
        this.columnNameSql = columnNameSql;
    }
    
    public String getName() {
        return name;
    }
    
    public String getDriver() {
        return driver;
    }
    
    public String getColumnNameSql() {
        return columnNameSql;
    }
    
    public String getTableNameSql() {
        return tableNameSql;
    }
}
