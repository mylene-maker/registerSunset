package com.businesscase.sunsetregister.services;

import com.businesscase.sunsetregister.models.Role;
import com.businesscase.sunsetregister.utils.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

public class RoleService {

    public Role getByName(String role){
        SessionFactory sf = HibernateUtil.getSessionFactory();
        Session session = sf.getCurrentSession();
        Transaction tx = session.beginTransaction();

        Role roleObject = session.createQuery("FROM Role r WHERE r.roleName = :role", Role.class)
                .setParameter("role", role).getSingleResult();

        tx.commit();
        session.close();

        return roleObject;
    }
}
