<%-- 
    Document   : checkout
    Created on : Dec 11, 2024, 10:45:50 PM
    Author     : nhutb
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" href="./assets/css/checkout.css">
        <title>Checkout</title>
    </head>

    <body>
        <jsp:include page="header.jsp"></jsp:include>
            <main>
                <div class="container">
                    <p>Home › Shopping Cart › Checkout Process</p>
                    <div class="row">
                        <div class="col-md-8">
                            <div class="title">
                                <div>
                                    <h1>Checkout</h1>
                                </div>
                                <div><button type="submit"
                                             style="background-color: white; border: #0156ff solid 1px; color: #0156ff;"><b>Sign
                                            in</b></button></div>
                            </div>
                        </div>
                        <div class="col-md-4" style="text-align: right;">
                            <img src="./assets/imgs/CheckoutImg/status.jpg" alt="" width="350px">
                        </div>
                    </div>
                    <br>
                    <br>
                    <div class="row">
                        <div class="col-md-12" style="text-align: left;">
                            <h5>Shipping Address</h5>
                            <svg width="66%" height="2" viewBox="0 0 66% 2" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <path d="M0 1L924 1.00008" stroke="#CACDD8" />
                            </svg>
                        </div>

                    </div>
                    <div class="row">
                        <div class="col-md-8">
                            <form action="" class="infor">
                                <div class="form-group">
                                    <div class="control-label">Email Address *</div>
                                    <div class="">
                                        <input id="text" type="text" class="form-control" value="" placeholder="" />
                                    </div>
                                </div>
                                You can create an account after checkout.
                                <div class="form-group">
                                    <div class="control-label">First Name *</div>
                                    <div class="">
                                        <input id="text" type="text" class="form-control" value="" placeholder="" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="control-label">Last Name *</div>
                                    <div class="">
                                        <input id="text" type="text" class="form-control" value="" placeholder="" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="control-label">Phone Number *</div>
                                    <div class="">
                                        <input id="text" type="text" class="form-control" value="" placeholder="" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="control-label">Street Address *</div>
                                    <div class="">
                                        <input id="text" type="text" class="form-control" value="" placeholder="" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="control-label">City</div>
                                    <div class="">
                                        <select style="width: 70%; border: black solid 1px;" class="form-select form-select-sm mb-3" id="city" aria-label=".form-select-sm">
                                            <option value="" selected>Choose city</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="control-label">District</div>
                                    <div class="">
                                        <select style="width: 70%; border: black solid 1px;" style="width: 70%; border: black solid 1px;" class="form-select form-select-sm mb-3" id="district"
                                                 aria-label=".form-select-sm">
                                            <option value="" selected>Choose district</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="control-label">Town</div>
                                    <div class="">
                                        <select style="width: 70%; border: black solid 1px;" class="form-select form-select-sm" id="ward" aria-label=".form-select-sm">
                                            <option value="" selected>Choose town</option>
                                        </select>
                                    </div>
                                </div>
                                <svg width="100%" height="2" viewBox="0 0 100% 2" fill="none"
                                     xmlns="http://www.w3.org/2000/svg">
                                <path d="M0 1L924 1.00008" stroke="#CACDD8" />
                                </svg>
                                <div class="form-group">
                                    <div class="">
                                        <div class="control-label">Standard Rate</div>
                                        <div>
                                            <input type="radio" id="check" name="way" value=""> 
                                            <span style="display: flex; justify-content: space-between;">
                                                <p>Price may vary
                                                    depending on
                                                    the
                                                    item/destination. Shop Staff will contact you.
                                                </p>
                                                <p><b>$21.00</b></p>
                                            </span>
                                        </div>
                                        <div class="control-label">Pickup from store</div>
                                        <input type="radio" id="check" name="way" value=""> <span style="display: flex; justify-content: space-between;">
                                            <p> 305 La Trobe St
                                                Melbourne
                                                3000</p>
                                            <p><b> $0.00</b></p></span>
                                    </div>
                                </div>
                                <button type="submit"
                                        style="background-color: #0156ff; border: #0156ff solid 1px; color: white;">Next</button>
                            </form>
                        </div>
                        <div class="col-md-4" style="background-color: #f5f7ff; padding: 20px; margin-top: -10px; height: 80%;">
                            <h4>Order Summary</h4>
                            <svg width="100%" height="2" viewBox="0 0 100% 2" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <path d="M0 1L385 0.999966" stroke="#CACDD8" />
                            </svg>
                            <p>2 Items in Cart</p>
                            <div style="display: flex; column-gap: 20px;">
                                <div><img
                                        src="./assets/imgs/ShoppingCartImg/z6117255602466_41a821476ad82f7bf0f521d8b1b7fec3.jpg"
                                        alt="" width="70px"></div>
                                <div>
                                    <div>
                                        <p>MSI MEG Trident X 10SD-1012AU Intel i7 10700K, 2070 SUPER...</p>
                                    </div>
                                    <div style="display: flex; column-gap: 10px; margin-top: -15px;">
                                        <div>Qty 1</div>
                                        <div><b>$3,799.00</b></div>
                                    </div>
                                </div>
                            </div>
                            <br>
                            <div style="display: flex; column-gap: 20px;">
                                <div><img
                                        src="./assets/imgs/ShoppingCartImg/z6117255602466_41a821476ad82f7bf0f521d8b1b7fec3.jpg"
                                        alt="" width="70px"></div>
                                <div>
                                    <div>
                                        <p>MSI MEG Trident X 10SD-1012AU Intel i7 10700K, 2070 SUPER...</p>
                                    </div>
                                    <div style="display: flex; column-gap: 10px; margin-top: -15px;">
                                        <div>Qty 1</div>
                                        <div><b>$3,799.00</b></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <br>
                <div style="background-color: #f5f7ff;">
                    <div class="container">
                        <div class="row" style="text-align: center; padding: 30px; background-color: #f5f7ff;">
                            <div class="col-md-4">
                                <img src="./assets/imgs/ShoppingCartImg/headphone.jpg" alt="" width="70px">
                                <h5>Product Support</h5>
                                <p style="width: 70%; margin: 0 auto;">Up to 3 years on-site warranty available for your
                                    peace
                                    of mind.</p>
                            </div>
                            <div class="col-md-4">
                                <img src="./assets/imgs/ShoppingCartImg/person.jpg" alt="" width="70px">
                                <h5>Personal Account</h5>
                                <p style="width: 70%; margin: 0 auto;">With big discounts, free delivery and a dedicated
                                    support
                                    specialist.</p>
                            </div>
                            <div class="col-md-4">
                                <img src="./assets/imgs/ShoppingCartImg/tag.jpg" alt="" width="70px">
                                <h5>Amazing Savings</h5>
                                <p style="width: 70%; margin: 0 auto;">Up to 70% off new Products, you can be sure of
                                    the best
                                    price.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
        <jsp:include page="footer.jsp"></jsp:include>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.21.1/axios.min.js"></script>
        <script>
            var citis = document.getElementById("city");
            var districts = document.getElementById("district");
            var wards = document.getElementById("ward");
            var Parameter = {
                url: "https://raw.githubusercontent.com/kenzouno1/DiaGioiHanhChinhVN/master/data.json",
                method: "GET",
                responseType: "application/json",
            };
            var promise = axios(Parameter);
            promise.then(function (result) {
                renderCity(result.data);
            });

            function renderCity(data) {
                for (const x of data) {
                    citis.options[citis.options.length] = new Option(x.Name, x.Id);
                }
                citis.onchange = function () {
                    district.length = 1;
                    ward.length = 1;
                    if (this.value != "") {
                        const result = data.filter(n => n.Id === this.value);

                        for (const k of result[0].Districts) {
                            district.options[district.options.length] = new Option(k.Name, k.Id);
                        }
                    }
                };
                district.onchange = function () {
                    ward.length = 1;
                    const dataCity = data.filter((n) => n.Id === citis.value);
                    if (this.value != "") {
                        const dataWards = dataCity[0].Districts.filter(n => n.Id === this.value)[0].Wards;

                        for (const w of dataWards) {
                            wards.options[wards.options.length] = new Option(w.Name, w.Id);
                        }
                    }
                };
            }
        </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
    </body>

</html>
