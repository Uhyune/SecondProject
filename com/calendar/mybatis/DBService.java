package com.servlet.calendar.mybatis;

import java.io.IOException;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class DBService {
    private static SqlSessionFactory factory;

    //static 초기화문
    static {
        try {
            factory = new SqlSessionFactoryBuilder().build(Resources
                                                                   .getResourceAsReader("calendar/config.xml"));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static SqlSessionFactory getFactory() {
        return factory;
    }
}
