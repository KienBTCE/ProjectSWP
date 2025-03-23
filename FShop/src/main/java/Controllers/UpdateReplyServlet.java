/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAOs.RatingRepliesDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author HP
 */
public class UpdateReplyServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RatingRepliesDAO rrDAO = new RatingRepliesDAO();
        String answerUpdate = request.getParameter("answer");
        int replyID = Integer.parseInt(request.getParameter("replyID"));
        try {
            if (replyID > 0 && answerUpdate != null && !answerUpdate.isEmpty()) {
                int result = rrDAO.UpdateReply(replyID, answerUpdate);
                if (result > 0) {
                    response.getWriter().write("Success");
                } else {
                    response.getWriter().write("Failed");
                }
            } else {
                response.getWriter().write("Invalid Input");
            }
        } catch (Exception e) {
            response.getWriter().write("Error: " + e.getMessage());
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
