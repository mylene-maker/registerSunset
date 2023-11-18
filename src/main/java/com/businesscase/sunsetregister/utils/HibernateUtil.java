package com.businesscase.sunsetregister.utils;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class HibernateUtil {
    private static SessionFactory sessionFactory = buildSessionFactory();

    public static SessionFactory buildSessionFactory(){
        return new Configuration().configure().buildSessionFactory();
    }

    public static SessionFactory getSessionFactory(){
        return sessionFactory;
    }

    public void close(){
        sessionFactory.close();
    }

}
