package com.Helper;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Helper {
	public static Connection createConnection() {
		Connection connect = null;
		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/trainmanagement", "root", "");
			System.out.println("Connected");
			
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		return connect;

	}

	public static void closeAllConnection(Connection cn, PreparedStatement ps, ResultSet rs) {
		try {
			if (rs != null) {
				rs.close();
			}
			if (ps != null) {
				ps.close();
			}
			if (cn != null) {
				cn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}
}
