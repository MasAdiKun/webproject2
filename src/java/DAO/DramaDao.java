/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Connection.DBConnection;
import Model.DramaModel;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author masad
 */
public class DramaDao {
    Connection conn;
    public DramaDao(){
        conn=DBConnection.getConnectionDB();
    };
    public void addDrama(DramaModel model){
        try{
            String addDrama = "insert into catalog(title,trailer,preview,type,act,year,genres,episodes,description) "
                    + "values(?,?,?,?,?,?,?,?)";
            PreparedStatement ps = conn.prepareStatement(addDrama);
            ps.setString(1, model.getTitle());
            ps.setString(2, model.getLink());
            ps.setString(3, model.getImg());
            ps.setString(4, model.getType());
            ps.setString(5, model.getAct());
            ps.setString(6, String.valueOf(model.getYear()));
            ps.setString(7, model.getGenres());
            ps.setString(8, String.valueOf(model.getEps()));
            ps.setString(9, model.getDesc());
            
            ps.executeUpdate();
        }
        catch(SQLException e){
            System.out.println(e.getMessage());
        }
    }
    public List showByType(String type){
        List sdrama= new ArrayList();
        try{
            String showByType = "select * from catalog where type = ?";
            PreparedStatement ps = conn.prepareStatement(showByType);
            ps.setString(1, type);
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                DramaModel model = new DramaModel();
                model.setId(Integer.parseInt(rs.getString(1)));
                model.setTitle(rs.getString(2));
                model.setLink(rs.getString(3));
                model.setImg(rs.getString(4));
                model.setType(type);
                model.setAct(rs.getString(6));
                model.setYear(Integer.parseInt(rs.getString(7)));
                model.setGenres(rs.getString(8));
                model.setEps(Integer.parseInt(rs.getString(9)));
                model.setDesc(rs.getString(10));
                sdrama.add(model);
            }
            
        }catch(SQLException e){
            System.out.println(e.getMessage());
        }
        return sdrama;
    }
    public List showTop3(String type){
        List sdrama= new ArrayList();
        try{
            String showTop3 = "SELECT * FROM catalog WHERE type = ? LIMIT 3";
            PreparedStatement ps = conn.prepareStatement(showTop3);
            ps.setString(1, type);
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                DramaModel model = new DramaModel();
                model.setId(Integer.parseInt(rs.getString(1)));
                model.setTitle(rs.getString(2));
                model.setLink(rs.getString(3));
                model.setImg(rs.getString(4));
                model.setType(type);
                model.setAct(rs.getString(6));
                model.setYear(Integer.parseInt(rs.getString(7)));
                model.setGenres(rs.getString(8));
                model.setEps(Integer.parseInt(rs.getString(9)));
                model.setDesc(rs.getString(10)); 
                sdrama.add(model);
            }
            
        }catch(SQLException e){
            System.out.println(e.getMessage());
        }
        return sdrama;
    }
    public DramaModel showByDramaId(int drama_id){
    DramaModel model = new DramaModel();
    try{
        String editDrama="select *from catalog where id=?";
        PreparedStatement ps = conn.prepareStatement(editDrama);
        ps.setInt(1, drama_id);
        ResultSet rs = ps.executeQuery();
        while (rs.next()){
            model.setTitle(rs.getString(2));
            model.setLink(rs.getString(3));
            model.setImg(rs.getString(4));
            model.setType(rs.getString(5));
            model.setAct(rs.getString(6));
            model.setYear(Integer.parseInt(rs.getString(7)));
            model.setGenres(rs.getString(8));
            model.setEps(Integer.parseInt(rs.getString(9)));
            model.setDesc(rs.getString(10));       
        }
    }catch(SQLException e){
        e.getMessage();
        }
    return model;
    }
    public void updateDrama(DramaModel model){
        try{
            String updateDrama = "update catalog set title=?,trailer=?,preview=?,type=?,"
                    + "act=?,year=?,genres=?,episodes=?,description=? where id=?";
            PreparedStatement ps = conn.prepareStatement(updateDrama);
            ps.setString(1, model.getTitle());
            ps.setString(2, model.getLink());
            ps.setString(3, model.getImg());
            ps.setString(4, model.getType());
            ps.setString(5, model.getAct());
            ps.setString(6, String.valueOf(model.getYear()));
            ps.setString(7, model.getGenres());
            ps.setString(8, String.valueOf(model.getEps()));
            ps.setString(9, model.getDesc());
            ps.setString(10, String.valueOf(model.getId()));
            System.out.println(model.getId());
            System.out.println(model.getEps());
            ps.executeUpdate();
        }
        catch(SQLException e){
            System.out.println(e.getMessage());
        }
    }
    public void deleteDramaByID(int id){
        try{
            String deleteDrama="delete from catalog where id=?";
            PreparedStatement ps= conn.prepareStatement(deleteDrama);
            ps.setInt(1, id);
            ps.executeUpdate();
        }catch (SQLException e){
            System.out.println(e.getMessage());
        }
    }
}
