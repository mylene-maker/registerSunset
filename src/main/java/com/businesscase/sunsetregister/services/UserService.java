package com.businesscase.sunsetregister.services;

import com.businesscase.sunsetregister.models.User;
import com.businesscase.sunsetregister.utils.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.mindrot.jbcrypt.BCrypt;

import java.util.List;

public class UserService {

    private RoleService roleService;

    public UserService() {
        this.roleService = new RoleService();
    }

    public List<User> getUserByEmail(String email){
        SessionFactory sf = HibernateUtil.getSessionFactory();
        Session session = sf.getCurrentSession();
        Transaction tx = session.beginTransaction();

        List<User> users = session.createQuery("FROM User u WHERE u.email = :email", User.class)
                .setParameter("email", email).getResultList();

        tx.commit();
        session.close();

        return users;
    }

    public void registerUser(User user){


        user.addRole(this.roleService.getByName("USER"));

        SessionFactory sf = HibernateUtil.getSessionFactory();
        Session session = sf.getCurrentSession();
        Transaction tx = session.beginTransaction();

        user.setPassword(BCrypt.hashpw(user.getPassword(), BCrypt.gensalt()));
        session.persist(user);

        tx.commit();
        session.close();
    }
}
