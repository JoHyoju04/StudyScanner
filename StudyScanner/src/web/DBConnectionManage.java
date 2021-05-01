package web;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

@WebListener
public class DBConnectionManage implements ServletContextListener {

    public DBConnectionManage() {
    }

    public void contextDestroyed(ServletContextEvent sce)  { 
    	Connection conn = (Connection) sce.getServletContext().getAttribute("DBconnection");
    	
    	try {
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
    }

    public void contextInitialized(ServletContextEvent sce)  { 
    	Connection conn = null;
		Properties connectionProps = new Properties();
		
		ServletContext sc = sce.getServletContext();
		String url = sc.getInitParameter("dburl");
		String user = sc.getInitParameter("dbuser");
		String passwd = sc.getInitParameter("dbpasswd");
		
		connectionProps.put("user", user);
		connectionProps.put("password", passwd);
		
		try {
			conn = DriverManager.getConnection(url, connectionProps);
			if (conn != null) sc.setAttribute("DBconnection", conn);
		} catch (SQLException e) {
			e.printStackTrace();
		}
    }
    
	
}
