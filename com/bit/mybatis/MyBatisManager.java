package com.servlet.bit.mybatis;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import javax.servlet.http.HttpServlet;
import java.io.IOException;

public class MyBatisManager extends HttpServlet {

    private static SqlSessionFactory factory;

    // 싱글톤 패턴
    private MyBatisManager() {
        super();
    }

    // 초기화
    static {
        try {
            factory = new SqlSessionFactoryBuilder()
                    .build(Resources.getResourceAsReader("mybatis/config.xml"));
        } catch (IOException e) {
            e.printStackTrace();
            System.out.println("SqlSessionFactory Exception");
        }
    }

    public static SqlSessionFactory getInstance() {
        return factory;
    }

}
