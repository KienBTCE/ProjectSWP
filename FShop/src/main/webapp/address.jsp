<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <title>Shipping Address</title>
        <style>

        </style>
    </head>

    <body style="font-family: Arial, sans-serif;">
        <jsp:include page="header.jsp"></jsp:include>
            <div style="background: rgba(231, 220, 220, 0.4);">
                <div class="container" style="">
                    <div class="row">
                        <div class="col-md-3">
                        <jsp:include page="myInfor.jsp"></jsp:include>
                        </div>
                        <div class="col-md-9" style="background: white; margin: 20px 0px 20px 0px; border-radius: 10px; padding: 30px">
                            <div class="header"
                                 style=" display: flex; justify-content: space-between; align-items: center; border-bottom: 1px solid #ddd; padding-bottom: 20px">
                                <h2>My addresses</h2>
                                <button class="btn btn-add"
                                        style="background: red; color: white; padding: 5px 5px; cursor: pointer; border: none;"
                                        data-bs-toggle="modal" data-bs-target="#addModal">+ Add new address</button>
                            </div>

                            <h4 style="padding: 15px 0 0 0">Address</h4>

                            <div id="addressList">
                                <br>
                                <div class="address"
                                     style="border-bottom: 1px solid #ddd; display: flex; justify-content: space-between; align-items: center;">
                                    <div>
                                        <strong>Bùi Minh Nhựt</strong> (+84) 349 311 805
                                        <p>Nguyễn Văn Trường, Phường Long Tuyền, Quận Bình Thủy, Cần Thơ</p>
                                        <span class="default" style="color: red; font-weight: bold;">Default</span>
                                    </div>
                                    <div class="actions" style="display: flex; flex-direction: column;">
                                        <div class="btn1" style="display: flex; flex-direction: row;">
                                            <button class="btn btn-update"
                                                    style="color: blue; padding: 5px 5px; cursor: pointer; border: none; margin-left: 5px;"
                                                    data-bs-toggle="modal" data-bs-target="#updateModal">Update</button>
                                            <button class="btn btn-delete"
                                                    style="color: red; background: none; padding: 5px 5px; cursor: pointer; border: none; margin-left: 5px;">Delete</button>
                                        </div>
                                        <button class="btn btn-default"
                                                style="background: #f5f5f5; padding: 5px 5px; cursor: pointer; border: none; margin-left: 5px;"
                                                onclick="setDefault(this)">Set as default</button>
                                    </div>
                                </div>

                            </div>
                            <div id="addressList">
                                <br>
                                <div class="address"
                                     style="border-bottom: 1px solid #ddd; display: flex; justify-content: space-between; align-items: center;">
                                    <div>
                                        <strong>Bùi Minh Nhựt</strong> (+84) 349 311 805
                                        <p>Nguyễn Văn Trường, Phường Long Tuyền, Quận Bình Thủy, Cần Thơ</p>
                                        <span class="default" style="color: red; font-weight: bold;">Default</span>
                                    </div>
                                    <div class="actions" style="display: flex; flex-direction: column;">
                                        <div class="btn1" style="display: flex; flex-direction: row;">
                                            <button class="btn btn-update"
                                                    style="color: blue; padding: 5px 5px; cursor: pointer; border: none; margin-left: 5px;"
                                                    data-bs-toggle="modal" data-bs-target="#updateModal">Update</button>
                                            <button class="btn btn-delete"
                                                    style="color: red; background: none; padding: 5px 5px; cursor: pointer; border: none; margin-left: 5px;">Delete</button>
                                        </div>
                                        <button class="btn btn-default"
                                                style="background: #f5f5f5; padding: 5px 5px; cursor: pointer; border: none; margin-left: 5px;"
                                                onclick="setDefault(this)">Set as default</button>
                                    </div>
                                </div>

                            </div>
                            <div id="addressList">
                                <br>
                                <div class="address"
                                     style="border-bottom: 1px solid #ddd; display: flex; justify-content: space-between; align-items: center;">
                                    <div>
                                        <strong>Bùi Minh Nhựt</strong> (+84) 349 311 805
                                        <p>Nguyễn Văn Trường, Phường Long Tuyền, Quận Bình Thủy, Cần Thơ</p>
                                        <span class="default" style="color: red; font-weight: bold;">Default</span>
                                    </div>
                                    <div class="actions" style="display: flex; flex-direction: column;">
                                        <div class="btn1" style="display: flex; flex-direction: row;">
                                            <button class="btn btn-update"
                                                    style="color: blue; padding: 5px 5px; cursor: pointer; border: none; margin-left: 5px;"
                                                    data-bs-toggle="modal" data-bs-target="#updateModal">Update</button>
                                            <button class="btn btn-delete"
                                                    style="color: red; background: none; padding: 5px 5px; cursor: pointer; border: none; margin-left: 5px;">Delete</button>
                                        </div>
                                        <button class="btn btn-default"
                                                style="background: #f5f5f5; padding: 5px 5px; cursor: pointer; border: none; margin-left: 5px;"
                                                onclick="setDefault(this)">Set as default</button>
                                    </div>
                                </div>

                            </div>
                            <div id="addressList">
                                <br>
                                <div class="address"
                                     style="border-bottom: 1px solid #ddd; display: flex; justify-content: space-between; align-items: center;">
                                    <div>
                                        <strong>Bùi Minh Nhựt</strong> (+84) 349 311 805
                                        <p>Nguyễn Văn Trường, Phường Long Tuyền, Quận Bình Thủy, Cần Thơ</p>
                                        <span class="default" style="color: red; font-weight: bold;">Default</span>
                                    </div>
                                    <div class="actions" style="display: flex; flex-direction: column;">
                                        <div class="btn1" style="display: flex; flex-direction: row;">
                                            <button class="btn btn-update"
                                                    style="color: blue; padding: 5px 5px; cursor: pointer; border: none; margin-left: 5px;"
                                                    data-bs-toggle="modal" data-bs-target="#updateModal">Update</button>
                                            <button class="btn btn-delete"
                                                    style="color: red; background: none; padding: 5px 5px; cursor: pointer; border: none; margin-left: 5px;">Delete</button>
                                        </div>
                                        <button class="btn btn-default"
                                                style="background: #f5f5f5; padding: 5px 5px; cursor: pointer; border: none; margin-left: 5px;"
                                                onclick="setDefault(this)">Set as default</button>
                                    </div>
                                </div>

                            </div>
                            
                        </div>
                    </div>
                </div>
            </div>

            <!-- Add Address Modal -->
            <div style="margin-top: 100px" class="modal fade" id="addModal" tabindex="-1" aria-labelledby="addModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="addModalLabel">Add New Address</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <form>
                                <div class="mb-3 row">
                                    <label for="name" class="col-sm-3 col-form-label fw-bold">Name:</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" id="name" name="name">
                                    </div>
                                </div>

                                <div class="mb-3 row">
                                    <label for="phone" class="col-sm-3 col-form-label fw-bold">Phone:</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" id="phone" name="phone">
                                    </div>
                                </div>

                                <div class="mb-3 row">
                                    <label for="street" class="col-sm-3 col-form-label fw-bold">Street:</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" id="street" name="street">
                                    </div>
                                </div>

                                <div class="mb-3 row">
                                    <label for="province" class="col-sm-3 col-form-label fw-bold">Province:</label>
                                    <div class="col-sm-9">
                                        <select class="form-select" id="province">
                                            <option value="">Chọn tỉnh</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="mb-3 row">
                                    <label for="district" class="col-sm-3 col-form-label fw-bold">District:</label>
                                    <div class="col-sm-9">
                                        <select class="form-select" id="district">
                                            <option value="">Chọn huyện</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="mb-3 row">
                                    <label for="ward" class="col-sm-3 col-form-label fw-bold">Ward:</label>
                                    <div class="col-sm-9">
                                        <select class="form-select" id="ward">
                                            <option value="">Chọn xã</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="text-center">
                                    <button type="submit" class="btn btn-danger w-100">Add Address</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Update Address Modal -->
            <div  style="margin-top: 100px" class="modal fade" id="updateModal" tabindex="-1" aria-labelledby="updateModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="updateModalLabel">Update Address</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <form>
                                <div class="mb-3 row">
                                    <label for="name" class="col-sm-3 col-form-label fw-bold">Name:</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" id="name" name="name">
                                    </div>
                                </div>

                                <div class="mb-3 row">
                                    <label for="phone" class="col-sm-3 col-form-label fw-bold">Phone:</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" id="phone" name="phone">
                                    </div>
                                </div>

                                <div class="mb-3 row">
                                    <label for="street" class="col-sm-3 col-form-label fw-bold">Street:</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" id="street" name="street">
                                    </div>
                                </div>

                                <div class="mb-3 row">
                                    <label for="province" class="col-sm-3 col-form-label fw-bold">Province:</label>
                                    <div class="col-sm-9">
                                        <select class="form-select" id="province">
                                            <option value="">Chọn tỉnh</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="mb-3 row">
                                    <label for="district" class="col-sm-3 col-form-label fw-bold">District:</label>
                                    <div class="col-sm-9">
                                        <select class="form-select" id="district">
                                            <option value="">Chọn huyện</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="mb-3 row">
                                    <label for="ward" class="col-sm-3 col-form-label fw-bold">Ward:</label>
                                    <div class="col-sm-9">
                                        <select class="form-select" id="ward">
                                            <option value="">Chọn xã</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="text-center">
                                    <button type="submit" class="btn btn-danger w-100">Update Address</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        <jsp:include page="footer.jsp"></jsp:include>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>

</html>