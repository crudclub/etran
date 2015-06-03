package com.etran.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DBUtils {

	private DBUtils() {
	}

	/** mysql */
	 public static String url = "jdbc:mysql://localhost:3306/zyy?autoReconnect=true&useUnicode=true&characterEncoding=utf-8";
	 public static String name = "root";
	 public static String pwd = "2009";
	 public static String driverName = "com.mysql.jdbc.Driver";
	
	
//	 public static String url = "jdbc:mysql://192.168.111.14:3306/ecappdbv2?autoReconnect=true&failOverReadOnly=false&useUnicode=true&characterEncoding=utf-8&zeroDateTimeBehavior=convertToNull";
//	 public static String name = "ecapp";
//	 public static String pwd = "HaEcity@APP";
//	 public static String driverName = "com.mysql.jdbc.Driver";
	/** oracle */
//	public static String url = "jdbc:oracle:thin:@192.168.110.160:1521:ORA11G";
//	public static String name = "dsp";
//	public static String pwd = "dsp";
//	public static String driverName = "oracle.jdbc.OracleDriver";

	public static Connection getConnection() {
		try {
			return initNewConnection();
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	private static Connection initNewConnection() throws Exception {
		Class.forName(driverName);
		return DriverManager.getConnection(url, name, pwd);
	}

	public static void close(Connection conn) {
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				throw new RuntimeException(e);
			}
		}
	}

	public static void close(PreparedStatement prep, Connection conn) {
		if (prep != null) {
			try {
				prep.close();
			} catch (SQLException e) {
				throw new RuntimeException(e);
			}
		}
		close(conn);
	}

	public static void close(ResultSet set, PreparedStatement prep, Connection conn) {
		if (set != null) {
			try {
				set.close();
			} catch (SQLException e) {
				throw new RuntimeException(e);
			}
		}
		close(prep, conn);
	}
}
