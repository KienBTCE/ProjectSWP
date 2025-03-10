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

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
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

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        StockDAO stockDAO = new StockDAO();
        List <Stock> list = stockDAO.GetAll();
        if(list != null){
            request.setAttribute("dataStock", list);
            request.getRequestDispatcher("excelStock.jsp").forward(request, response);
        }else {
          response.sendRedirect(request.getContextPath() + "/ExportStockToFileServlet");
                }
     
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
        response.setHeader("Content-Disposition", "attachment; filename=data.xlsx");

        XSSFWorkbook wb = new XSSFWorkbook();
        XSSFSheet sheet = wb.createSheet("list");
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        StockDAO stockDAO = new StockDAO();
        List<Stock> list = stockDAO.GetAll();

        int rowNo = 0;
        XSSFRow row = sheet.createRow(rowNo++);
        int cellNum = 0;
        XSSFCell cell = row.createCell(cellNum++);
        cell.setCellValue("IOID");

        cell = row.createCell(cellNum++);
        cell.setCellValue("Employee Name");

        cell = row.createCell(cellNum++);
        cell.setCellValue("Supplier Name");

        cell = row.createCell(cellNum++);
        cell.setCellValue("Import Date");

        cell = row.createCell(cellNum++);
        cell.setCellValue("Total Cost");

        cell = row.createCell(cellNum++);
        cell.setCellValue("LastModify");

        cell = row.createCell(cellNum++);
        cell.setCellValue("Product ID");

        cell = row.createCell(cellNum++);
        cell.setCellValue("Product Name");

        cell = row.createCell(cellNum++);
        cell.setCellValue("Brand Name");

        cell = row.createCell(cellNum++);
        cell.setCellValue("Category Name");

        cell = row.createCell(cellNum++);
        cell.setCellValue("Quantity");

        cell = row.createCell(cellNum++);
        cell.setCellValue("Import Price");

        cell = row.createCell(cellNum++);
        cell.setCellValue("Retail Price");

        cell = row.createCell(cellNum++);
        cell.setCellValue("Profit Margin");

        for (Stock stock : list) {
            cellNum = 0;
            row = sheet.createRow(rowNo++);

            cell = row.createCell(cellNum++);
            cell.setCellValue(stock.getIOID());

            cell = row.createCell(cellNum++);
            cell.setCellValue(stock.getEmployeeName());

            cell = row.createCell(cellNum++);
            cell.setCellValue(stock.getSupplierName());

            cell = row.createCell(cellNum++);
            cell.setCellValue(sdf.format(stock.getImportDate()));

            cell = row.createCell(cellNum++);
            cell.setCellValue(stock.getTotalCost());

            cell = row.createCell(cellNum++);
            cell.setCellValue(sdf.format(stock.getLastModify()));

            cell = row.createCell(cellNum++);
            cell.setCellValue(stock.getProductID());

            cell = row.createCell(cellNum++);
            cell.setCellValue(stock.getProductName());

            cell = row.createCell(cellNum++);
            cell.setCellValue(stock.getBrandName());

            cell = row.createCell(cellNum++);
            cell.setCellValue(stock.getCategoryName());

            cell = row.createCell(cellNum++);
            cell.setCellValue(stock.getQuantity());

            cell = row.createCell(cellNum++);
            cell.setCellValue(stock.getImportPrice());

            cell = row.createCell(cellNum++);
            cell.setCellValue(stock.getRetailPrice());

            cell = row.createCell(cellNum++);
            cell.setCellValue(stock.getProfitMargin());
        }

        wb.write(response.getOutputStream());
        wb.close();
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
