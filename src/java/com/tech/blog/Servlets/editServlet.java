/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tech.blog.Servlets;

import com.tech.blog.DAO.UserDao;
import com.tech.blog.Entities.Message;
import com.tech.blog.Entities.User;
import com.tech.blog.Helper.ConnectionProvider;
import com.tech.blog.Helper.Helper;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author Bluebeast
 */
@MultipartConfig
public class editServlet extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet editServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            String email=request.getParameter("user_email");
            String password=request.getParameter("user_password");
             String name=request.getParameter("user_name");
            String about=request.getParameter("user_about");
        Part part=request.getPart("pic");
        String imageName=part.getSubmittedFileName();
     
        //get the user from session
            HttpSession s=request.getSession();
            User user=(User)s.getAttribute("currentUser");
            user.setName(name);
            user.setEmail(email);
            user.setPassword(password);
            //fetching old profile path
                  String oldFile=user.getProfile();
                  
            user.setProfile(imageName);
         user.setAbout(about);
            UserDao dao=new UserDao(ConnectionProvider.getConnection());
            boolean ans=dao.UserUpdate(user);
        if(ans)
        {
       
        String path=request.getRealPath("/")+"pics"+File.separator+user.getProfile();
        
        
        String Oldpath=request.getRealPath("/")+"pics"+File.separator+oldFile;
        
        
        if(!oldFile.equals("default.png"))
                 Helper.deleteFile(Oldpath);
        
        
        
            if(Helper.saveFile(part.getInputStream(), path))
            {
 
                  Message msg=new Message("Profile updated ","success","alert-success");
   
   s.setAttribute("msg", msg);
            }
            else{
                
               Message msg=new Message("something went wrong","error","alert-danzer");
   
   s.setAttribute("msg", msg);
            }
                
                }
            
                
        else{
      
               Message msg=new Message("something went wrong","error","alert-danzer");
   
   s.setAttribute("msg", msg);
        }
        
        response.sendRedirect("profile.jsp");
        
        
        
        
        
        
        
        
            out.println("</body>");
            out.println("</html>");
        }
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
