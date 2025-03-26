<%-- 
    Document   : UpdateVoucherView
    Created on : Mar 22, 2025, 6:37:14 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Voucher</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

    <style>
        .fixed-header {
            position: fixed;
            top: 0;
            left: 250px;
            width: calc(100% - 250px);
/*            background-color: white;*/
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
            padding-top: 0px;
        }

        .main-layout {
            display: flex;
        }

        .content {
            flex-grow: 1;
            margin-left: 750px;
            margin-top: 120px;
            padding: 20px;
        }

        .form-label {
            font-weight: 500;
        }

        .form-container {
            max-width: 800px;
            margin: auto;
        }

        .btn i {
            margin-right: 6px;
        }
    </style>
</head>
<body>
    <div class="sidebar-container">
        <jsp:include page="SidebarDashboard.jsp" />
    </div>

    <div class="main-layout">
        <div class="fixed-header">
            <jsp:include page="HeaderDashboard.jsp" />
        </div>

        <div class="content">
            <div class="form-container">
                <h2 class="mb-4 text-center">Update Voucher</h2>

                <!-- Thông báo lỗi nếu có -->
                <c:if test="${not empty error}">
                    <div class="alert alert-danger alert-dismissible fade show" role="alert">
                        <i class="fa-solid fa-triangle-exclamation me-2"></i> ${error}
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                </c:if>

                <form action="UpdateVoucherServlet" method="post">
                    <input type="hidden" name="voucherID" value="${voucher.voucherID}" />

                    <div class="mb-3">
                        <label class="form-label">Voucher Code</label>
                        <input type="text" name="voucherCode" class="form-control" value="${voucher.voucherCode}" required maxlength="10">
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Voucher Type</label>
                        <select class="form-select" name="voucherType" required>
                            <option value="0" ${voucher.voucherType == 0 ? 'selected' : ''}>Percent (%)</option>
                            <option value="1" ${voucher.voucherType == 1 ? 'selected' : ''}>Fixed Price</option>
                        </select>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Voucher Value</label>
                        <input type="number" name="voucherValue" class="form-control" value="${voucher.voucherValue}" required>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Max Discount Amount</label>
                        <input type="number" name="maxDiscountAmount" class="form-control" value="${voucher.maxDiscountAmount}">
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Min Order Value</label>
                        <input type="number" name="minOrderValue" class="form-control" value="${voucher.minOrderValue}" required>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Start Date</label>
                        <input type="datetime-local" name="startDate" class="form-control" value="${voucher.startDate}" required>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">End Date</label>
                        <input type="datetime-local" name="endDate" class="form-control" value="${voucher.endDate}" required>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Used Count</label>
                        <input type="number" name="usedCount" class="form-control" value="${voucher.usedCount}">
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Max Used Count</label>
                        <input type="number" name="maxUsedCount" class="form-control" value="${voucher.maxUsedCount}">
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Status</label>
                        <select class="form-select" name="status">
                            <option value="1" ${voucher.status == 1 ? 'selected' : ''}>Active</option>
                            <option value="0" ${voucher.status == 0 ? 'selected' : ''}>Inactive</option>
                        </select>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Description</label>
                        <textarea class="form-control" name="description" rows="3">${voucher.description}</textarea>
                    </div>

                    <div class="text-center">
                        <button type="submit" class="btn btn-success me-2">
                            <i class="fa-solid fa-check"></i> Update Voucher
                        </button>
<!--                        <a href="ViewVoucherListServlet" class="btn btn-secondary">
                            <i class="fa-solid fa-arrow-left"></i> Cancel
                        </a>-->
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
