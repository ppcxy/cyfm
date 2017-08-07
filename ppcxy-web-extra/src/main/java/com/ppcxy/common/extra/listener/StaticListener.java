package com.ppcxy.common.extra.listener;

import com.ppcxy.common.repository.jpa.support.hibernate.HibernateUtils;
import com.ppcxy.common.spring.SpringContextHolder;
import com.ppcxy.common.utils.LinkedProperties;
import org.apache.commons.io.FileUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.util.ResourceUtils;
import org.springside.modules.test.spring.Profiles;
import org.springside.modules.utils.PropertiesLoader;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import java.io.*;
import java.util.Date;

public class StaticListener implements ServletContextListener {
    private JdbcTemplate jdbcTemplate;

    @Override
    public void contextDestroyed(ServletContextEvent event) {

    }

    @Override
    public void contextInitialized(ServletContextEvent event) {
        //判断数据情况进行数据初始化,读配置文件是否是安装,安装完毕后回写为安装完成
        System.out.println("**********************************************");
        System.out.println("*    宸艺快速开发框架V0.1 bate by ppcxy.com  *");
        System.out.println("*    github: https://github.com/ppcxy/cyfm   *");
        System.out.println("*                                            *");
        System.out.println("**********************************************");


        PropertiesLoader propertiesLoader = new PropertiesLoader("classpath:/application.properties");

        LinkedProperties prop = new LinkedProperties();//属性集合对象

        File propFile = null;
        FileInputStream fis = null;//属性文件流

        try {

            propFile = ResourceUtils.getFile("classpath:application.properties");
            fis = new FileInputStream(propFile);
            prop.load(fis);//将属性文件流装载到Properties对象中

            //测试模式启动情况加载test属性文件
            if(System.getProperty(Profiles.ACTIVE_PROFILE).equals(Profiles.FUNCTIONAL_TEST)){
                propFile = ResourceUtils.getFile("classpath:application.test.properties");
                fis = new FileInputStream(propFile);
                prop.load(fis);
            }

        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

        String runModel = prop.getProperty("run.model");
        String jdbcUrl = prop.getProperty("jdbc.url");
        String dbType = HibernateUtils.getDatabaseName(jdbcUrl);


        System.out.println(String.format("=============>%s", "运行模式:") + runModel);
        System.out.println(String.format("=============>%s", "存储类型:") + dbType);

        if ("init".equals(runModel)) {
            try {
                if (dbType.equals("mysql")) {
                    initDbMysql();
                }

                prop.setProperty("run.model", "init");
                FileOutputStream fos = new FileOutputStream(propFile);
                // 将Properties集合保存到流中
                prop.store(fos, new Date().toString()+" update run model from init to update.");
                fos.close();// 关闭流
            } catch (FileNotFoundException e) {
                System.out.println("严重错误:未找到用来初始化数据的脚本..." + e.getMessage());
                System.exit(3);
            } catch (IOException e) {
                e.printStackTrace();
            }
        } else if ("update".equals(runModel)) {
            update();
        }
    }

    private void update() {
    }

    private void initDb(File scheamFlie, File dataFile, File... otherSqlFiles) {
        System.out.println("*    准备执行数据库初始化操作...");
        System.out.println("**********************************************");
        System.out.println("*    表初始化开始");
        execSqlFile(scheamFlie);
        System.out.println("*    表初始化结束");
        System.out.println("**********************************************");
        System.out.println("*    表数据初始化开始");
        execSqlFile(dataFile);
        System.out.println("*    表数据初始化结束");
        for (File ofile : otherSqlFiles) {
            System.out.println("**********************************************");
            System.out.println("*    其他初始化开始");
            execSqlFile(ofile);
            System.out.println("*    其他据初始化结束");
        }

    }

    private void initDbMSSQLServer() throws FileNotFoundException {
        String dir = "classpath:sql/sqlserver/";

        File scheamFlie = ResourceUtils.getFile(dir + "schema.sql");
        File dataFile = ResourceUtils.getFile(dir + "data.sql");

        initDb(scheamFlie, dataFile);
    }

    private void initDbOracle() throws FileNotFoundException {
        String dir = "classpath:sql/oracle/";

        File scheamFlie = ResourceUtils.getFile(dir + "schema.sql");
        File dataFile = ResourceUtils.getFile(dir + "data.sql");

        initDb(scheamFlie, dataFile);
    }

    private void initDbMysql() throws FileNotFoundException {
        String dir = "classpath:sql/mysql/";

        File scheamFlie = ResourceUtils.getFile(dir + "schema.sql");
        File dataFile = ResourceUtils.getFile(dir + "data.sql");

        initDb(scheamFlie, dataFile);
    }


    /**
     * 执行sql文件中的内容.
     *
     * @param file
     * @return
     */
    private boolean execSqlFile(File file) {
        if (file == null) {
            return false;
        }
        if (this.jdbcTemplate == null) {
            this.jdbcTemplate = SpringContextHolder.getBean(JdbcTemplate.class);
        }

        String sqls = null;
        try {
            sqls = FileUtils.readFileToString(file, "utf-8");

            if (jdbcTemplate != null) {
                for (String sql : sqls.replaceAll("\r", "").split(";\n")) {
                    if (StringUtils.isNotBlank(sql)) {
                        jdbcTemplate.execute(sql);
                    }
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
            return false;
        }

        return true;
    }
}
