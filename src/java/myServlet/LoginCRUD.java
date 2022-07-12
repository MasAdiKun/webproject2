/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package myServlet;

import Connection.DBConnection;
import DAO.ALoginDao;
import DAO.CLoginDao;
import Model.LoginModel;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author masad
 */
@WebServlet(name = "LoginCRUD", urlPatterns = {"/LoginCRUD"})
public class LoginCRUD extends HttpServlet {
    private static String CRegister = "/clogin";
    private static String CLogin = "/homepage";
    private static String ARegister = "/alogin";
    private static String ALogin = "/catalog";
    private ALoginDao alogin;
    private CLoginDao clogin;
    public LoginCRUD(){
       super();
       alogin = new ALoginDao();
       clogin = new CLoginDao();
    }
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String redirectURL="";
        String act = request.getParameter("action");
        String apass = request.getParameter("passcode");
//        client login
        if(act.equalsIgnoreCase("insertc")){
            LoginModel login = new LoginModel();
            login.setUsername(request.getParameter("username"));
            login.setEmail(request.getParameter("email"));
            login.setPass(request.getParameter("pass"));
            clogin.addClient(login);
            redirectURL = CRegister;
            System.out.println("Record Succes");
        }else if(act.equalsIgnoreCase("loginc")){
            try{
            Connection conn;
            conn = DBConnection.getConnectionDB();
            String uname = request.getParameter("uname");
            String pass = request.getParameter("pass");
            String clogin = "select * from client where username = ? and password= ?";
            PreparedStatement ps = conn.prepareStatement(clogin);
            ps.setString(1, uname);
            ps.setString(2, pass);
            ResultSet rs= ps.executeQuery();
            if(rs.next()){
                redirectURL=CLogin;
            }else{
                out.println("Username or Password Incorrect");
                redirectURL=CRegister;
            }
            }catch(SQLException e){
                System.out.println(e.getMessage());
            }
        }else if(act.equalsIgnoreCase("logins")){
            try{
            Connection conn;
            conn = DBConnection.getConnectionDB();
            String uname = request.getParameter("uname");
            String pass = request.getParameter("pass");
            String alogin = "select * from admin where uname = ? and pass= ?";
            PreparedStatement ps = conn.prepareStatement(alogin);
            ps.setString(1, uname);
            ps.setString(2, pass);
            ResultSet rs= ps.executeQuery();
            if(rs.next()){
                redirectURL=ALogin;
            }else{
                out.println("Username or Password Incorrect");
                redirectURL=ARegister;
            }
            }catch(SQLException e){
                System.out.println(e.getMessage());
            }
        }else if(apass.equalsIgnoreCase("adl")){
            if(act.equalsIgnoreCase("inserta")){
            LoginModel login = new LoginModel();
            login.setUsername(request.getParameter("username"));
            login.setEmail(request.getParameter("email"));
            login.setPass(request.getParameter("pass"));
            alogin.addAdmin(login);
            redirectURL=ARegister;
            System.out.println("Succes");
            }
        }
        RequestDispatcher rd= request.getRequestDispatcher(redirectURL);
        rd.forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
