/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tech.blog.Servlets;

import com.tech.blog.DAO.PostDao;
import com.tech.blog.Entities.Post;
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
public class addPostServlet extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
   
      
           int cid=Integer.parseInt(request.getParameter("cid"));
//              out.println(cid);  
          String title=request.getParameter("postTitle");
//                  out.println(title);
          String content=request.getParameter("postContent");
        
//      out.println(content);
          String code=request.getParameter("postCode");
//      out.println(code);
         Part part=request.getPart("postPic");
           
   

        
           //getting curren t user
       
            HttpSession s=request.getSession();
            User user=(User)s.getAttribute("currentUser");
         
//             
//            out.println(part.getSubmittedFileName());
//           out.println("user id"+user.getId());
//           

            System.out.println("email"+user.getEmail());
         Post post=new Post(title, content, code, part.getSubmittedFileName(), null, cid,user.getId());

         PostDao dao=new PostDao(ConnectionProvider.getConnection());
       
         if(dao.savePost(post))
         {
             String path=request.getRealPath("/")+"blog_post"+File.separator+part.getSubmittedFileName();
             Helper.saveFile(part.getInputStream(), path);
             out.println("done");
         }else{
         out.println("not updated");
                 }
        
             
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
