<%-- 
    Document   : CreateVoucherView
    Created on : Mar 22, 2025, 7:45:24 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Create Voucher</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
        <style>
            .fixed-header {
                position: fixed;
                top: 0;
                left: 250px;
                width: calc(100% - 250px);
                background-color: white;
                z-index: 1050;
                padding: 10px 20px;
                /*box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);*/
            }

            .sidebar-container {
                position: fixed;
                top: 0;
                left: 0;
                width: 250px;
                height: 100vh;
                background-color: white;
                z-index: 1100;
             
            }

            .main-layout {
                display: flex;
            }

            .content {
                flex-grow: 1;
                margin-left: 750px;;
                margin-top: 120px;
                padding: 20px;
            }
        </style>
    </head>
    <body>
        <div class="sidebar-container">
            <jsp:include page="SidebarDashboard.jsp"></jsp:include>
            </div>

            <div class="main-layout">
                <div class="fixed-header">
                <jsp:include page="HeaderDashboard.jsp"></jsp:include>
                </div>

                <div class="content">
                <c:if test="${not empty error}">
                    <div class="alert alert-danger alert-dismissible fade show" role="alert">
                        <i class="fa-solid fa-triangle-exclamation"></i> ${error}
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                </c:if>

                <h2 class="mb-4">Create New Voucher</h2>

                <form action="CreateVoucherServlet" method="post">
                    <div class="mb-3">
                        <label class="form-label">Voucher Code</label>
                        <input type="text" name="voucherCode" class="form-control" required maxlength="10">
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Type</label>
                        <select name="voucherType" class="form-select">
                            <option value="1">Percent (%)</option>
                            <option value="0">Fixed Price</option>
                        </select>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Value</label>
                        <input type="number" name="voucherValue" class="form-control" required>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Max Discount</label>
                        <input type="number" name="maxDiscountAmount" class="form-control">
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Min Order Value</label>
                        <input type="number" name="minOrderValue" class="form-control" required>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Start Date</label>
                        <input type="datetime-local" name="startDate" class="form-control" required>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">End Date</label>
                        <input type="datetime-local" name="endDate" class="form-control" required>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Max Used Count</label>
                        <input type="number" name="maxUsedCount" class="form-control">
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Status</label>
                        <select name="status" class="form-select">
                            <option value="1">Active</option>
                            <option value="0">Inactive</option>
                        </select>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Description</label>
                        <textarea name="description" class="form-control"></textarea>
                    </div>

                    <button type="submit" class="btn btn-success">
                        <i class="fa-solid fa-plus"></i> Create
                    </button>
<!--                    <a href="ViewVoucherListServlet" class="btn btn-secondary">Cancel</a>-->
                </form>
            </div>
        </div>
    </body>
</html>
