package com.ppcxy.common.repository.jpa.support.hibernate;

import org.apache.commons.lang3.StringUtils;
import org.hibernate.Cache;
import org.hibernate.Hibernate;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.dialect.*;
import org.hibernate.jpa.HibernateEntityManagerFactory;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.SQLException;

/**
 * 根据 jpa api 获取hibernate相关api
 */
public class HibernateUtils {

    /**
     * 根据jpa EntityManager 获取 hibernate Session API
     *
     * @param em
     * @return
     */
    public static Session getSession(EntityManager em) {
        return (Session) em.getDelegate();
    }

    /**
     * 根据jpa EntityManager 获取 hibernate SessionFactory API
     *
     * @param em
     * @return
     * @see #getSessionFactory(EntityManagerFactory)
     */
    public static SessionFactory getSessionFactory(EntityManager em) {
        return getSessionFactory(em.getEntityManagerFactory());
    }

    /**
     * 根据jpa EntityManagerFactory 获取 hibernate SessionFactory API
     *
     * @param emf
     * @return
     */
    public static SessionFactory getSessionFactory(EntityManagerFactory emf) {
        return ((HibernateEntityManagerFactory) emf).getSessionFactory();
    }

    /**
     * 根据 jpa EntityManager 获取hibernate Cache API
     *
     * @param em
     * @return
     * @see #getCache(EntityManagerFactory)
     */
    public static Cache getCache(EntityManager em) {
        return getCache(em.getEntityManagerFactory());
    }

    /**
     * 根据jpa EntityManagerFactory 获取 hibernate Cache API
     *
     * @param emf
     * @return
     */
    public static Cache getCache(EntityManagerFactory emf) {
        return getSessionFactory(emf).getCache();
    }

    /**
     * 清空一级缓存
     *
     * @param em
     */
    public static void evictLevel1Cache(EntityManager em) {
        em.clear();
    }

    /**
     * 根据jpa EntityManager 清空二级缓存
     *
     * @param em
     * @see #evictLevel2Cache(EntityManagerFactory)
     */
    public static void evictLevel2Cache(EntityManager em) {
        evictLevel2Cache(em.getEntityManagerFactory());
    }

    /**
     * 根据jpa EntityManagerFactory 清空二级缓存 包括：
     * 1、实体缓存
     * 2、集合缓存
     * 3、查询缓存
     * 注意：
     * jpa Cache api 只能evict 实体缓存，其他缓存是删不掉的。。。
     *
     * @param emf
     * @see org.hibernate.jpa.internal.EntityManagerFactoryImpl.JPACache#evictAll()
     */
    public static void evictLevel2Cache(EntityManagerFactory emf) {
        Cache cache = HibernateUtils.getCache(emf);
        cache.evictEntityRegions();
        cache.evictCollectionRegions();
        cache.evictDefaultQueryRegion();
        cache.evictQueryRegions();
        cache.evictNaturalIdRegions();
    }

    /**
     * Initialize the lazy property value.
     *
     * e.g. Hibernates.initLazyProperty(user.getGroups());
     */
    public static void initLazyProperty(Object proxyedPropertyValue) {
        Hibernate.initialize(proxyedPropertyValue);
    }

    /**
     * 从DataSoure中取出connection, 根据connection的metadata中的jdbcUrl判断Dialect类型.
     * 仅支持Oracle, H2, MySql, PostgreSql, SQLServer，如需更多数据库类型，请仿照此类自行编写。
     */
    public static String getDialect(DataSource dataSource) {
        String jdbcUrl = getJdbcUrlFromDataSource(dataSource);

        // 根据jdbc url判断dialect
        if (StringUtils.contains(jdbcUrl, ":h2:")) {
            return H2Dialect.class.getName();
        } else if (StringUtils.contains(jdbcUrl, ":mysql:")) {
            return MySQL5InnoDBDialect.class.getName();
        } else if (StringUtils.contains(jdbcUrl, ":oracle:")) {
            return Oracle10gDialect.class.getName();
        } else if (StringUtils.contains(jdbcUrl, ":postgresql:")) {
            return PostgreSQL82Dialect.class.getName();
        } else if (StringUtils.contains(jdbcUrl, ":sqlserver:")) {
            return SQLServer2008Dialect.class.getName();
        } else {
            throw new IllegalArgumentException("Unknown Database of " + jdbcUrl);
        }
    }

    private static String getJdbcUrlFromDataSource(DataSource dataSource) {
        Connection connection = null;
        try {
            connection = dataSource.getConnection();
            if (connection == null) {
                throw new IllegalStateException("Connection returned by DataSource [" + dataSource + "] was null");
            }
            return connection.getMetaData().getURL();
        } catch (SQLException e) {
            throw new RuntimeException("Could not get database url", e);
        } finally {
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException e) {
                }
            }
        }
    }
}
