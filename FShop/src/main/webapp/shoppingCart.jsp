<%-- 
    Document   : shoppingCart
    Created on : Dec 10, 2024, 10:00:59 PM
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
        <link rel="stylesheet" href="./assets/css/cart.css">
        <title>Shopping Cart</title>
    </head>

    <body>
        <header><jsp:include page="header.jsp"></jsp:include></header>

            <main>
                <div class="container">
                    <div class="row">
                        <p>Home › Login</p>
                        <h2>Shopping Cart</h2>
                        <div class="col-md-8">
                            <table style="width: 100%; border-collapse: collapse; ">
                                <tr style="height: 60px;">
                                    <th style="width: 17%;  padding: 20px 0px 20px 0px;
                                        border-bottom: gray solid 1px;">Item</th>
                                    <th style="width: 35%;  padding: 20px 0px 20px 0px;
                                        border-bottom: gray solid 1px;"></th>
                                    <th style="width: 13%;  padding: 20px 0px 20px 0px;
                                        border-bottom: gray solid 1px;">Price</th>
                                    <th style="width: 15%;  padding: 20px 0px 20px 0px;
                                        border-bottom: gray solid 1px;">Qty</th>
                                    <th style="width: 15%;  padding: 20px 0px 20px 0px;
                                        border-bottom: gray solid 1px;">Subtotal</th>
                                    <th style="width: 15%;  padding: 20px 0px 20px 0px;
                                        border-bottom: gray solid 1px;"></th>
                                </tr>
                                <tr>
                                    <td style=" padding: 20px 0px 20px 0px;
                                        border-bottom: gray solid 1px; vertical-align: top;
                                        font-size: 13px;"><img src="./assets/imgs/ShoppingCartImg/z6117255602466_41a821476ad82f7bf0f521d8b1b7fec3.jpg" alt=""
                                           width="105px"></td>
                                    <td style=" padding: 20px 0px 20px 0px;
                                        border-bottom: gray solid 1px; vertical-align: top;
                                        font-size: 13px;">MSI MEG Trident X 10SD-1012AU Intel i7 10700K, 2070 SUPER, 32GB RAM, 1TB SSD, Windows 10
                                        Home, Gaming Keyboard and Mouse 3 Years Warranty</td>
                                    <td style=" padding: 20px 0px 20px 0px;
                                        border-bottom: gray solid 1px;vertical-align: top;
                                        font-size: 13px;">
                                        <h6>$4,349.00</h6>
                                    </td>
                                    <td style=" padding: 20px 0px 20px 0px;
                                        border-bottom: gray solid 1px; vertical-align: top;
                                        font-size: 13px;"><input type="number" min="1" value="1" name="" id="" style=" width: 45%;
                                             height: 40px;
                                             padding-left: 10px;
                                             font-weight: bold;
                                             background-color: #f5f7ff;
                                             border: #f5f7ff solid 1px;"></td>
                                    <td style=" padding: 20px 0px 20px 0px;
                                        border-bottom: gray solid 1px; vertical-align: top;
                                        font-size: 13px;">
                                        <h6>$13,047.00</h6>
                                    </td>
                                    <td style=" padding: 20px 0px 20px 0px;
                                        border-bottom: gray solid 1px;vertical-align: top;
                                        font-size: 13px;">
                                        <a href=""><img src="./assets/imgs/ShoppingCartImg/x.jpg" alt="" width="25px"></a>
                                        <a href=""><img src="./assets/imgs/ShoppingCartImg/pen.jpg" alt="" width="25px"
                                                        style="margin-top: 5px;"></a>
                                    </td>
                                </tr> 
                            </table>
                            <br>
                            <div class="btnControl">
                                <div>
                                    <input type="submit" name="" id="" value="Continue Shopping"
                                           style="height:35px;width: 200px; border-radius: 20px; color: gray; background-color: white;">
                                    <button>Clear Shopping Cart</button>
                                </div>
                                <div>
                                    <button>Update Shopping Cart</button>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4 right">
                            <h3>Summary</h3>
                            <div>
                                <div class="tax">
                                    <p>Estimate Shipping and Tax </p>
                                    <button onclick="toggleDisplay('detail1')"
                                            style="background-image: url(./assets/imgs/ShoppingCartImg/up.jpg); width: 10%; border: white solid; border-radius: 30px;"></button>
                                </div>
                                <div id="detail1" style="display: none; color: gray;">
                                    <p>Enter your destination to get a shipping estimate.</p>
                                </div>
                            </div>
                            <div>
                                <div class="tax">
                                    <p>Apply Discount Code</p>
                                    <button onclick="toggleDisplay('detail2')"
                                            style="background-image: url(./assets/imgs/ShoppingCartImg/up.jpg); width: 10%; border: white solid; border-radius: 30px;"></button>
                                </div>
                                <div id="detail2" style="display: none; color: gray;">
                                    <p>Enter your destination to get a shipping estimate.</p>
                                </div>
                            </div>

                            <svg width="385" height="2" viewBox="0 0 385 2" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <path d="M0 1.00003L385 0.999997" stroke="#CACDD8" />
                            </svg>
                            <div>
                                <div class="totalPrice">
                                    <p>Subtotal</p>
                                    <p>$13,047.00</p>
                                </div>
                                <div class="totalPrice">
                                    <p>Shipping</p>
                                    <p>$21.00</p>
                                </div>
                                <div class="totalPrice">
                                    <p>Order Total</p>
                                    <h4>$13,068.00</h4>
                                </div>
                            </div>
                            <div class="btnSummary">
                                <button style="background-color: #0156ff; border: #0156ff solid 1px; color: white;">Proceed to
                                    Checkout</button>
                                <button style="background-color: #ffb800; border: #0156ff solid 1px; color: black;">Check out
                                    with <span><svg width="72" height="18" viewBox="0 0 72 18" fill="none"
                                                    xmlns="http://www.w3.org/2000/svg">
                                        <path
                                            d="M55.6932 5H52.0409C51.8261 5 51.6113 5.21053 51.5039 5.42105L50 14.6842C50 14.8947 50.1074 15 50.3223 15H52.2558C52.4706 15 52.578 14.8947 52.578 14.6842L53.0077 12.0526C53.0077 11.8421 53.2225 11.6316 53.5448 11.6316H54.7264C57.197 11.6316 58.5935 10.4737 58.9157 8.15789C59.1306 7.21053 58.9157 6.36842 58.486 5.84211C57.8415 5.31579 56.8748 5 55.6932 5ZM56.1228 8.47368C55.908 9.73684 54.9412 9.73684 53.9745 9.73684H53.33L53.7596 7.31579C53.7596 7.21053 53.8671 7.10526 54.0819 7.10526H54.2967C54.9412 7.10526 55.5858 7.10526 55.908 7.52631C56.1228 7.63158 56.1228 7.94737 56.1228 8.47368Z"
                                            fill="#139AD6" />
                                        <path
                                            d="M27.6572 4.59998H23.7715C23.5429 4.59998 23.3144 4.82855 23.2001 5.05712L21.6001 15.1142C21.6001 15.3428 21.7144 15.4571 21.943 15.4571H23.7715C24.0001 15.4571 24.2287 15.2285 24.3429 14.9999L24.8001 12.2571C24.8001 12.0285 25.0287 11.8 25.3715 11.8H26.6287C29.2572 11.8 30.7429 10.5428 31.0858 8.02854C31.3144 6.99997 31.0858 6.08569 30.6286 5.51426C29.9429 4.94283 29.0286 4.59998 27.6572 4.59998ZM28.1144 8.37139C27.8858 9.74282 26.8572 9.74282 25.8287 9.74282H25.2572L25.7144 7.11425C25.7144 6.99997 25.8287 6.88568 26.0572 6.88568H26.2858C26.9715 6.88568 27.6572 6.88568 28.0001 7.34282C28.1144 7.45711 28.2287 7.79997 28.1144 8.37139Z"
                                            fill="#263B80" />
                                        <path
                                            d="M39.4286 8.25714H37.6C37.4857 8.25714 37.2572 8.37142 37.2572 8.48571L37.1429 9.05713L37.0286 8.82856C36.5714 8.25714 35.7714 8.02856 34.8572 8.02856C32.8 8.02856 30.9715 9.62856 30.6286 11.8C30.4 12.9428 30.7429 13.9714 31.3143 14.6571C31.8857 15.3428 32.6857 15.5714 33.7143 15.5714C35.4286 15.5714 36.3429 14.5428 36.3429 14.5428L36.2286 15.1143C36.2286 15.3428 36.3429 15.4571 36.5714 15.4571H38.2857C38.5143 15.4571 38.7429 15.2285 38.8572 15L39.8857 8.59999C39.7714 8.48571 39.5429 8.25714 39.4286 8.25714ZM36.8 11.9143C36.5714 12.9428 35.7714 13.7428 34.6286 13.7428C34.0572 13.7428 33.6 13.5143 33.3715 13.2857C33.1429 12.9428 33.0286 12.4857 33.0286 11.9143C33.1429 10.8857 34.0572 10.0857 35.0857 10.0857C35.6572 10.0857 36 10.3143 36.3429 10.5428C36.6857 10.8857 36.8 11.4571 36.8 11.9143Z"
                                            fill="#263B80" />
                                        <path
                                            d="M67.51 8.24243H65.5498C65.4273 8.24243 65.1823 8.36364 65.1823 8.48485L65.0598 9.09091L64.9373 8.84849C64.4472 8.24243 63.5897 8 62.6096 8C60.4044 8 58.4443 9.69697 58.0767 12C57.8317 13.2121 58.1993 14.303 58.8118 15.0303C59.4243 15.7576 60.2819 16 61.3845 16C63.2221 16 64.2022 14.9091 64.2022 14.9091L64.0797 15.5151C64.0797 15.7576 64.2022 15.8788 64.4472 15.8788H66.2849C66.5299 15.8788 66.7749 15.6364 66.8974 15.3939L68 8.60606C67.8775 8.48485 67.755 8.24243 67.51 8.24243ZM64.6922 12.1212C64.4472 13.2121 63.5897 14.0606 62.3646 14.0606C61.752 14.0606 61.262 13.8182 61.017 13.5758C60.7719 13.2121 60.6494 12.7273 60.6494 12.1212C60.772 11.0303 61.752 10.1818 62.8546 10.1818C63.4672 10.1818 63.8347 10.4242 64.2022 10.6667C64.6922 11.0303 64.8148 11.6364 64.6922 12.1212Z"
                                            fill="#139AD6" />
                                        <path
                                            d="M49.7137 8H47.7899C47.5636 8 47.4504 8.11494 47.3372 8.22988L44.8476 12.1379L43.716 8.45977C43.6028 8.22988 43.4896 8.11494 43.1501 8.11494H41.3395C41.1132 8.11494 41 8.34483 41 8.57471L43.037 14.6667L41.1132 17.4253C41 17.6552 41.1132 18 41.3395 18H43.1501C43.3765 18 43.4896 17.8851 43.6028 17.7701L49.8269 8.68966C50.1664 8.34483 49.94 8 49.7137 8Z"
                                            fill="#263B80" />
                                        <path
                                            d="M69.5556 5.27587L68 15.6541C68 15.8847 68.1111 16 68.3333 16H69.8889C70.1111 16 70.3333 15.7694 70.4444 15.5387L72 5.39118C72 5.16055 71.8889 5.04524 71.6667 5.04524H69.8889C69.7778 4.92992 69.6667 5.04524 69.5556 5.27587Z"
                                            fill="#139AD6" />
                                        <path
                                            d="M13.0638 1.35211C12.2686 0.450703 10.7918 0 8.74706 0H3.06715C2.72636 0 2.38556 0.338026 2.27196 0.676055L0 15.4366C0 15.7746 0.227196 16 0.454393 16H3.97594L4.88472 10.4789V10.7042C4.99832 10.3662 5.33911 10.0282 5.67991 10.0282H7.38388C10.6782 10.0282 13.1774 8.67605 13.9726 4.95775C13.9726 4.84507 13.9726 4.73239 13.9726 4.61972C13.859 4.61972 13.859 4.61972 13.9726 4.61972C14.0862 3.15493 13.859 2.25352 13.0638 1.35211Z"
                                            fill="#263B80" />
                                        <path
                                            d="M13.712 4C13.712 4.11765 13.712 4.2353 13.712 4.35294C12.9566 8.35294 10.5826 9.64706 7.45314 9.64706H5.83448C5.51075 9.64706 5.18702 10 5.07911 10.3529L4 17.5294C4 17.7647 4.10791 18 4.43164 18H7.23732C7.56105 18 7.88479 17.7647 7.88479 17.4118V17.2941L8.42434 13.6471V13.4118C8.42434 13.0588 8.74807 12.8235 9.07181 12.8235H9.50345C12.2012 12.8235 14.3594 11.6471 14.899 8.11765C15.1148 6.70588 15.0069 5.41176 14.3594 4.58824C14.2515 4.35294 14.0357 4.11765 13.712 4Z"
                                            fill="#139AD6" />
                                        <path
                                            d="M13 4.35C12.8889 4.35 12.7778 4.23333 12.6667 4.23333C12.5556 4.23333 12.4444 4.23333 12.3333 4.11666C11.8889 4 11.4444 4 10.8889 4H6.55556C6.44444 4 6.33333 4 6.22222 4.11666C6 4.23333 5.88889 4.46666 5.88889 4.7L5 10.7667V11C5.11111 10.65 5.44444 10.3 5.77778 10.3H7.44444C10.6667 10.3 13.1111 8.9 13.8889 5.05C13.8889 4.93333 13.8889 4.81666 14 4.7C13.7778 4.58333 13.6667 4.46667 13.4444 4.46667C13.1111 4.35 13.1111 4.35 13 4.35Z"
                                            fill="#232C65" />
                                        </svg>
                                    </span></button>
                                <button style="background-color: white; border: gray solid 1px; color: gray;">Check Out with
                                    Multiple Addresses</button>
                            </div>
                        </div>
                    </div>
                    <br>
                    <br>
                </div>
                <div style="background-color: #f5f7ff;">
                    <div class="container">
                        <div class="row" style="text-align: center; padding: 30px; background-color: #f5f7ff;">
                            <div class="col-md-4">
                                <img src="./assets/imgs/ShoppingCartImg/headphone.jpg" alt="" width="70px">
                                <h5>Product Support</h5>
                                <p style="width: 70%; margin: 0 auto;">Up to 3 years on-site warranty available for your peace
                                    of mind.</p>
                            </div>
                            <div class="col-md-4">
                                <img src="./assets/imgs/ShoppingCartImg/person.jpg" alt="" width="70px">
                                <h5>Personal Account</h5>
                                <p style="width: 70%; margin: 0 auto;">With big discounts, free delivery and a dedicated support
                                    specialist.</p>
                            </div>
                            <div class="col-md-4">
                                <img src="./assets/imgs/ShoppingCartImg/tag.jpg" alt="" width="70px">
                                <h5>Amazing Savings</h5>
                                <p style="width: 70%; margin: 0 auto;">Up to 70% off new Products, you can be sure of the best
                                    price.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </main>

            <footer> 
            <jsp:include page="footer.jsp"></jsp:include>
        </footer>
        <script>
            function toggleDisplay(divId) {
                var x = document.getElementById(divId);
                if (x.style.display === "none") {
                    x.style.display = "block";
                } else {
                    x.style.display = "none";
                }
            }
        </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
    </body>

</html>
