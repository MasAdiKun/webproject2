/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Connection.DBConnection;
import Model.LoginModel;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.RequestDispatcher;

/**
 *
 * @author masad
 */
public class CLoginDao {
    private Connection conn;
    public CLoginDao(){
        conn = DBConnection.getConnectionDB();
    }
    public void addClient(LoginModel model){
        try{
            String addClient = "insert into client(username,email,password) values(?,?,?)";
            PreparedStatement ps = conn.prepareStatement(addClient);
            ps.setString(1, model.getUsername());
            ps.setString(2, model.getEmail());
            ps.setString(3, model.getPass());
            
            ps.executeUpdate();
        }
        catch(SQLException e){
            System.out.println(e.getMessage());
        }
    }
    public void cLogin(String uname, String pass){      
        try{
            String login = "select * from client where username = ? and pass= ?";
            PreparedStatement ps = conn.prepareStatement(login);
            ps.setString(1, uname);
            ps.setString(2, pass);
            ResultSet rs= ps.executeQuery();
            if(rs.next()){
                
            }
        }catch(SQLException e){
            System.out.println(e.getMessage());
      }
    }
}
