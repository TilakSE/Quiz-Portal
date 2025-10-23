package com.quiz.dao;

import java.sql.*;

import com.quiz.util.DBConnection;

public class UserDao {
    private Connection conn;

    public UserDao() {
        conn = DBConnection.getConnection();
    }

    public int getParticipantCount() throws SQLException {
        String query = "SELECT COUNT(*) FROM user";
        PreparedStatement ps = conn.prepareStatement(query);
        ResultSet rs = ps.executeQuery();
        rs.next();
        return rs.getInt(1);
    }
}
