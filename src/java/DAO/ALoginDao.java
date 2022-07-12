/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Connection.DBConnection;
import Model.LoginModel;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author masad
 */
public class ALoginDao {
    private Connection conn;
    public ALoginDao(){
        conn = DBConnection.getConnectionDB();
    }
    public void addAdmin(LoginModel model){
        try{
            String addAdmin = "insert into admin(uname,email,pass) values(?,?,?)";
            PreparedStatement ps = conn.prepareStatement(addAdmin);
            ps.setString(1, model.getUsername());
            ps.setString(2, model.getEmail());
            ps.setString(3, model.getPass());
            
            ps.executeUpdate();
        }
        catch(SQLException e){
            System.out.println(e.getMessage());
        }
    }
}
