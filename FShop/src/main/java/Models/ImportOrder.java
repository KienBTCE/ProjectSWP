/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

import java.sql.Date;
import java.text.NumberFormat;
import java.util.List;
import java.util.Locale;

/**
 *
 * @author KienBTCE180180
 */
public class ImportOrder {

    private int ioid;
    private int employeeId;
    private int supplierId;
    private Date importDate;
    private long totalCost;
    private Date lastModify;
    private Supplier supplier;
    private List<ImportOrderDetail> importOrderDetails;

    public ImportOrder() {
    }
    
    public ImportOrder(int employeeId, int supplierId, long totalCost) {
        this.employeeId = employeeId;
        this.supplierId = supplierId;
        this.totalCost = totalCost;
    }

    public ImportOrder(int ioid, int employeeId, int supplierId, Date importDate, long totalCost, Date lastModify) {
        this.ioid = ioid;
        this.employeeId = employeeId;
        this.supplierId = supplierId;
        this.importDate = importDate;
        this.totalCost = totalCost;
        this.lastModify = lastModify;
    }

    public int getIoid() {
        return ioid;
    }

    public void setIoid(int ioid) {
        this.ioid = ioid;
    }

    public int getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(int employeeId) {
        this.employeeId = employeeId;
    }

    public int getSupplierId() {
        return supplierId;
    }

    public void setSupplierId(int supplierId) {
        this.supplierId = supplierId;
    }

    public Date getImportDate() {
        return importDate;
    }

    public void setImportDate(Date importDate) {
        this.importDate = importDate;
    }

    public long getTotalCost() {
        return totalCost;
    }

    public void setTotalCost(long totalCost) {
        this.totalCost = totalCost;
    }

    public Date getLastModify() {
        return lastModify;
    }

    public void setLastModify(Date lastModify) {
        this.lastModify = lastModify;
    }
    
    public Supplier getSupplier() {
        return supplier;
    }

    public void setSupplier(Supplier supplier) {
        this.supplier = supplier;
    }

    public List<ImportOrderDetail> getImportOrderDetails() {
        return importOrderDetails;
    }

    public void setImportOrderDetails(List<ImportOrderDetail> importOrderDetails) {
        this.importOrderDetails = importOrderDetails;
    }
    
    public String getPriceFormatted() {
        Locale vietnam = new Locale("vi", "VN");
        NumberFormat currencyFormatter = NumberFormat.getCurrencyInstance(vietnam);
        return currencyFormatter.format(totalCost);
    }

}
