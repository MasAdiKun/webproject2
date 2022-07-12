/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package myServlet;

import DAO.DramaDao;
import Model.DramaModel;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author masad
 */
@MultipartConfig
@WebServlet(name = "DramaCRUDS", urlPatterns = {"/DramaCRUDS"})
public class DramaCRUDS extends HttpServlet {

    private static String AddDrama="/catalog";
    private static String AddFail="/add";
    private static String EditDrama="/edit";
    private static String DeleteDrama="/catalog";
    private static String DetailDrama="/detail";
    private DramaDao dramadao;
    public DramaCRUDS(){
        super();
        dramadao= new DramaDao();
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String redirectURL="";
        String ids = request.getParameter("drama_id");
        String act= request.getParameter("action");
        if (act.equalsIgnoreCase("edit")){
            redirectURL=EditDrama;
        }else if(act.equalsIgnoreCase("details")){
            redirectURL = DetailDrama;
        }else if(act.equalsIgnoreCase("delete")){
            int id = Integer.parseInt(ids);
            dramadao.deleteDramaByID(id);
            redirectURL=DeleteDrama;
        }
        RequestDispatcher dispatch = request.getRequestDispatcher(redirectURL);
        dispatch.forward(request, response);
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
        String redirectURL="";
        String act= request.getParameter("action");
        LocalDateTime date = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("ddMMYYssmm");
        String random = date.format(formatter);
        Part imgpart = request.getPart("img");
        String imgFileName = random+imgpart.getSubmittedFileName();
        String extension = imgpart.getContentType();
        extension="."+extension.substring(extension.lastIndexOf("/")+1);
        
        System.out.println(imgFileName);
        System.out.println(extension);
        String imgPath = "//imagepath"+imgFileName;
        String iframe = request.getParameter("iframe");
        
        if(act.equalsIgnoreCase("insert")){
            if(!iframe.contains("width")&& !iframe.contains("height")&& iframe.contains("<iframe")){
            System.out.println("right extension");
            
            if(extension.equalsIgnoreCase(".jpg")||extension.equalsIgnoreCase(".jpeg")
                ||extension.equalsIgnoreCase(".png")){
 //            Get Image
                FileOutputStream fos = new FileOutputStream(imgPath);
                InputStream is = imgpart.getInputStream();
                byte[] data = new byte[is.available()];
                is.read(data);
                fos.write(data);
                fos.close();
    //            Upload to database
                DramaModel drama = new DramaModel();
                drama.setTitle(request.getParameter("title"));
                drama.setType(request.getParameter("type"));
                drama.setLink(iframe);
                drama.setImg(imgFileName);
                drama.setYear(Integer.parseInt(request.getParameter("year")));
                drama.setGenres(request.getParameter("genres"));
                drama.setEps(Integer.parseInt(request.getParameter("eps")));
                drama.setAct(request.getParameter("act"));
                drama.setDesc(request.getParameter("desc"));
                dramadao.addDrama(drama);
                redirectURL=AddDrama;   
            }else{
                redirectURL = AddFail;
            }
        }else{
            redirectURL=AddFail;
            System.out.println("Fail to add because wrong extension");
            } 
        }else if(act.equalsIgnoreCase("update")){
            String id = request.getParameter("id");
            System.out.println(id);
        if(!iframe.contains("width")&& !iframe.contains("height")){
            System.out.println("right extension");
            
            if(extension.equalsIgnoreCase(".jpg")||extension.equalsIgnoreCase(".jpeg")
                ||extension.equalsIgnoreCase(".png")){
 //            Get Image
                FileOutputStream fos = new FileOutputStream(imgPath);
                InputStream is = imgpart.getInputStream();
                byte[] data = new byte[is.available()];
                is.read(data);
                fos.write(data);
                fos.close();
    //            Upload to database
                DramaModel drama = new DramaModel();
                drama.setId(Integer.parseInt(id));
                drama.setTitle(request.getParameter("title"));
                drama.setType(request.getParameter("type"));
                drama.setLink(iframe);
                drama.setImg(imgFileName);
                drama.setYear(Integer.parseInt(request.getParameter("year")));
                drama.setGenres(request.getParameter("genres"));
                drama.setEps(Integer.parseInt(request.getParameter("eps")));
                drama.setAct(request.getParameter("act"));
                drama.setDesc(request.getParameter("desc"));
                dramadao.updateDrama(drama);
                redirectURL=AddDrama; 
                request.setAttribute("dramas", dramadao.showByType(""));
            }else{
                redirectURL = AddFail;
            }
        }else{
            redirectURL=AddFail;
            System.out.println("Fail to add because wrong extension");
        }
        }
       RequestDispatcher dispatch = request.getRequestDispatcher(redirectURL);
       dispatch.forward(request, response);
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
