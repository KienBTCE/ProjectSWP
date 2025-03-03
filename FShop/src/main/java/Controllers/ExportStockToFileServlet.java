/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAOs.StockDAO;
import Models.Stock;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.List;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

/**
 *
 * @author HP
 */
public class ExportStockToFileServlet extends HttpServlet {

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
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ExportStockToFileServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ExportStockToFileServlet at " + request.getContextPath() + "</h1>");
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
        response.setContentType("application/vnd.ms-excel");
        response.setHeader("Content-Disposition", "attachment; filename=data.xls");
        XSSFWorkbook wb = new XSSFWorkbook();
        XSSFSheet sheet = wb.createSheet("list");
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        StockDAO stockDAO = new StockDAO();
        List<Stock> list = stockDAO.GetAll();

        int rowNo = 0;
        XSSFRow row = sheet.createRow(rowNo++);
        int celNUm = 0;
        XSSFCell cell = row.createCell(celNUm++);
        cell.setCellValue("IOID");

        cell = row.createCell(celNUm++);
        cell.setCellValue("Employee Name");

        cell = row.createCell(celNUm++);
        cell.setCellValue("Supplier Name");

        cell = row.createCell(celNUm++);
        cell.setCellValue("Import Date");

        cell = row.createCell(celNUm++);
        cell.setCellValue("Total Cost:");

        cell = row.createCell(celNUm++);
        cell.setCellValue("LastModify");

        cell = row.createCell(celNUm++);
        cell.setCellValue("Product ID");

        cell = row.createCell(celNUm++);
        cell.setCellValue("Product Name");

        cell = row.createCell(celNUm++);
        cell.setCellValue("Brand Name");

        cell = row.createCell(celNUm++);
        cell.setCellValue("Category Name");

        cell = row.createCell(celNUm++);
        cell.setCellValue("Quantity");

        cell = row.createCell(celNUm++);
        cell.setCellValue("Import Price");

        cell = row.createCell(celNUm++);
        cell.setCellValue("Retail Price");

        cell = row.createCell(celNUm++);
        cell.setCellValue("Profit Margin");

        for (Stock no : list) {
            celNUm = 0;
            row = sheet.createRow(rowNo++);

            cell = row.createCell(celNUm++);
            cell.setCellValue(no.getIOID());

            cell = row.createCell(celNUm++);
            cell.setCellValue(no.getEmployeeName());

            cell = row.createCell(celNUm++);
            cell.setCellValue(no.getSupplierName());

            cell = row.createCell(celNUm++);
            cell.setCellValue(sdf.format(no.getImportDate()));

            cell = row.createCell(celNUm++);
            cell.setCellValue(no.getTotalCost());

            cell = row.createCell(celNUm++);
            cell.setCellValue(sdf.format(no.getLastModify()));

            cell = row.createCell(celNUm++);
            cell.setCellValue(no.getProductID());

            cell = row.createCell(celNUm++);
            cell.setCellValue(no.getProductName());

            cell = row.createCell(celNUm++);
            cell.setCellValue(no.getBrandName());

            cell = row.createCell(celNUm++);
            cell.setCellValue(no.getCategoryName());

            cell = row.createCell(celNUm++);
            cell.setCellValue(no.getQuantity());

            cell = row.createCell(celNUm++);
            cell.setCellValue(no.getImportPrice());

            cell = row.createCell(celNUm++);
            cell.setCellValue(no.getRetailPrice());

            cell = row.createCell(celNUm++);
            cell.setCellValue(no.getProfitMargin());
        }

        wb.write(response.getOutputStream());
        wb.close();
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
