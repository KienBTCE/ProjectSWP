<%-- Document : shoppingCart Created on : Dec 10, 2024, 10:00:59 PM Author : nhutb --%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<fmt:setLocale value="vi_VN" />
<%@page import="DAOs.CartDAO" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
              crossorigin="anonymous">
        <link rel="stylesheet" href="./assets/css/cart.css">
        <title>Shopping Cart</title>
    </head>

    <body>
        <jsp:include page="header.jsp"></jsp:include>
            <main>
                <div class="container">
                    <div class="row">
                        <p><a style=" text-decoration: none;
                              color: black;" href="HomeServlet">Home</a> › Login</p>
                        <h2>Shopping Cart</h2>
                        <div class="col-md-8">
                        <c:if test="${cartList != null && !cartList.isEmpty()}">
                            <table style="width: 100%; border-collapse: collapse; ">
                                <tr style="height: 60px;">
                                    <th  class="th" style="width: 3%;"></th>
                                    <th class="th" style="width: 17%;">Item</th>
                                    <th class="th" style="width: 34%;"></th>
                                    <th class="th" style="width: 13%;">Price</th>
                                    <th class="th" style="width: 15%;">Qty</th>
                                    <th class="th" style="width: 13%;">Subtotal</th>
                                    <th class="th" style="width: 5%;"></th>
                                </tr>

                                <c:set var="total" value="0" />
                                <form id="cartSelected" action="checkout" method="get">
                                    <c:forEach items="${sessionScope.cartList}" var="p">
                                        <tr>
                                            <td>
                                                <input type="checkbox" name="cartSelected" value="${p.getProductSKU()}">
                                            </td>
                                            <td class="td"><img
                                                    src="./assets/imgs/${p.getProductType()}/${p.getProductImg()}"
                                                    alt="" width="105px"></td>
                                            <td class="th">${p.getProductName()}</td>
                                            <td class="th">
                                                <h6>
                                                    <fmt:formatNumber value="${p.getPrice()}" type="currency" />
                                                </h6>
                                            </td>
                                            <td class="th"><input style=" width: 60%;
                                                                  height: 40px;
                                                                  padding-left: 10px;
                                                                  font-weight: bold;
                                                                  background-color: #f5f7ff;
                                                                  border: #f5f7ff solid 1px;" type="number" min="1" value="${p.getQuantity()}"
                                                                  name="" id=""></td>
                                            <td class="th">
                                                <h6>
                                                    <fmt:formatNumber value="${p.getPrice() * p.getQuantity()}" type="currency" />
                                                </h6>
                                            </td>
                                            <td class="th">
                                                <a href="updateCart?id=${p.getProductSKU()}"><img src="./assets/imgs/ShoppingCartImg/x.jpg" alt=""
                                                                                                  width="25px" ></a>
                                                <a href=""><img src="./assets/imgs/ShoppingCartImg/pen.jpg" alt="" width="25px"
                                                                style="margin-top: 5px;"></a>
                                            </td>
                                        </tr>
                                        <c:set var="total" value="${total + (p.getPrice() * p.getQuantity())}" />
                                    </c:forEach>
                                </form>
                            </table>
                        </c:if>
                        <c:if test="${cartList == null || cartList.isEmpty()}">
                            <table style="width: 100%; border-collapse: collapse; ">
                                <tr style="height: 60px;">
                                    <th  class="th" style="width: 3%;"></th>
                                    <th class="th" style="width: 17%;">Item</th>
                                    <th class="th" style="width: 34%;"></th>
                                    <th class="th" style="width: 13%;">Price</th>
                                    <th class="th" style="width: 15%;">Qty</th>
                                    <th class="th" style="width: 13%;">Subtotal</th>
                                    <th class="th" style="width: 5%;"></th>
                                </tr>

                                <c:set var="total" value="0" />
                                <tr>
                                    <td colspan="7" style="text-align: center; padding: 20px"><h4>No products on cart. Countinue to shopping</h4></td>
                                </tr>

                            </table>
                        </c:if>
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
                                        style="width: 10%; border: white solid; border-radius: 30px; height: auto;"><svg
                                        width="16" height="15" viewBox="0 0 16 15" fill="none"
                                        xmlns="http://www.w3.org/2000/svg">
                                    <path d="M6 9.20209L8 7.20209L10 9.20209" stroke="black" stroke-width="1.6"
                                          stroke-linecap="round" />
                                    </svg>
                                </button>
                            </div>
                            <div id="" style="color: gray;">
                                <p>Enter your destination to get a shipping estimate.</p>
                            </div>
                            <div id="detail1" style="display: none; color: gray;">
                                <div>
                                    <form action="" method="post">
                                        <div class="form-group">
                                            <div class="control-label"> Country</div>
                                            <div class="">
                                                <select class="form-control" name="cboCat" required>
                                                    <option value="Afghanistan">Afghanistan</option>
                                                    <option value="Åland Islands">Åland Islands</option>
                                                    <option value="Albania">Albania</option>
                                                    <option value="Algeria">Algeria</option>
                                                    <option value="American Samoa">American Samoa</option>
                                                    <option value="Andorra">Andorra</option>
                                                    <option value="Angola">Angola</option>
                                                    <option value="Anguilla">Anguilla</option>
                                                    <option value="Antarctica">Antarctica</option>
                                                    <option value="Antigua and Barbuda">Antigua and Barbuda</option>
                                                    <option value="Argentina">Argentina</option>
                                                    <option value="Armenia">Armenia</option>
                                                    <option value="Aruba">Aruba</option>
                                                    <option value="Australia">Australia</option>
                                                    <option value="Austria">Austria</option>
                                                    <option value="Azerbaijan">Azerbaijan</option>
                                                    <option value="Bahamas">Bahamas</option>
                                                    <option value="Bahrain">Bahrain</option>
                                                    <option value="Bangladesh">Bangladesh</option>
                                                    <option value="Barbados">Barbados</option>
                                                    <option value="Belarus">Belarus</option>
                                                    <option value="Belgium">Belgium</option>
                                                    <option value="Belize">Belize</option>
                                                    <option value="Benin">Benin</option>
                                                    <option value="Bermuda">Bermuda</option>
                                                    <option value="Bhutan">Bhutan</option>
                                                    <option value="Bolivia">Bolivia</option>
                                                    <option value="Bosnia and Herzegovina">Bosnia and Herzegovina
                                                    </option>
                                                    <option value="Botswana">Botswana</option>
                                                    <option value="Bouvet Island">Bouvet Island</option>
                                                    <option value="Brazil">Brazil</option>
                                                    <option value="British Indian Ocean Territory">British Indian
                                                        Ocean
                                                        Territory</option>
                                                    <option value="Brunei Darussalam">Brunei Darussalam</option>
                                                    <option value="Bulgaria">Bulgaria</option>
                                                    <option value="Burkina Faso">Burkina Faso</option>
                                                    <option value="Burundi">Burundi</option>
                                                    <option value="Cambodia">Cambodia</option>
                                                    <option value="Cameroon">Cameroon</option>
                                                    <option value="Canada">Canada</option>
                                                    <option value="Cape Verde">Cape Verde</option>
                                                    <option value="Cayman Islands">Cayman Islands</option>
                                                    <option value="Central African Republic">Central African
                                                        Republic
                                                    </option>
                                                    <option value="Chad">Chad</option>
                                                    <option value="Chile">Chile</option>
                                                    <option value="China">China</option>
                                                    <option value="Christmas Island">Christmas Island</option>
                                                    <option value="Cocos (Keeling) Islands">Cocos (Keeling) Islands
                                                    </option>
                                                    <option value="Colombia">Colombia</option>
                                                    <option value="Comoros">Comoros</option>
                                                    <option value="Congo">Congo</option>
                                                    <option value="Congo, The Democratic Republic of The">Congo, The
                                                        Democratic Republic of The</option>
                                                    <option value="Cook Islands">Cook Islands</option>
                                                    <option value="Costa Rica">Costa Rica</option>
                                                    <option value="Cote D'ivoire">Cote D'ivoire</option>
                                                    <option value="Croatia">Croatia</option>
                                                    <option value="Cuba">Cuba</option>
                                                    <option value="Cyprus">Cyprus</option>
                                                    <option value="Czech Republic">Czech Republic</option>
                                                    <option value="Denmark">Denmark</option>
                                                    <option value="Djibouti">Djibouti</option>
                                                    <option value="Dominica">Dominica</option>
                                                    <option value="Dominican Republic">Dominican Republic</option>
                                                    <option value="Ecuador">Ecuador</option>
                                                    <option value="Egypt">Egypt</option>
                                                    <option value="El Salvador">El Salvador</option>
                                                    <option value="Equatorial Guinea">Equatorial Guinea</option>
                                                    <option value="Eritrea">Eritrea</option>
                                                    <option value="Estonia">Estonia</option>
                                                    <option value="Ethiopia">Ethiopia</option>
                                                    <option value="Falkland Islands (Malvinas)">Falkland Islands
                                                        (Malvinas)</option>
                                                    <option value="Faroe Islands">Faroe Islands</option>
                                                    <option value="Fiji">Fiji</option>
                                                    <option value="Finland">Finland</option>
                                                    <option value="France">France</option>
                                                    <option value="French Guiana">French Guiana</option>
                                                    <option value="French Polynesia">French Polynesia</option>
                                                    <option value="French Southern Territories">French Southern
                                                        Territories</option>
                                                    <option value="Gabon">Gabon</option>
                                                    <option value="Gambia">Gambia</option>
                                                    <option value="Georgia">Georgia</option>
                                                    <option value="Germany">Germany</option>
                                                    <option value="Ghana">Ghana</option>
                                                    <option value="Gibraltar">Gibraltar</option>
                                                    <option value="Greece">Greece</option>
                                                    <option value="Greenland">Greenland</option>
                                                    <option value="Grenada">Grenada</option>
                                                    <option value="Guadeloupe">Guadeloupe</option>
                                                    <option value="Guam">Guam</option>
                                                    <option value="Guatemala">Guatemala</option>
                                                    <option value="Guernsey">Guernsey</option>
                                                    <option value="Guinea">Guinea</option>
                                                    <option value="Guinea-bissau">Guinea-bissau</option>
                                                    <option value="Guyana">Guyana</option>
                                                    <option value="Haiti">Haiti</option>
                                                    <option value="Heard Island and Mcdonald Islands">Heard Island
                                                        and
                                                        Mcdonald Islands</option>
                                                    <option value="Holy See (Vatican City State)">Holy See (Vatican
                                                        City
                                                        State)</option>
                                                    <option value="Honduras">Honduras</option>
                                                    <option value="Hong Kong">Hong Kong</option>
                                                    <option value="Hungary">Hungary</option>
                                                    <option value="Iceland">Iceland</option>
                                                    <option value="India">India</option>
                                                    <option value="Indonesia">Indonesia</option>
                                                    <option value="Iran, Islamic Republic of">Iran, Islamic Republic
                                                        of
                                                    </option>
                                                    <option value="Iraq">Iraq</option>
                                                    <option value="Ireland">Ireland</option>
                                                    <option value="Isle of Man">Isle of Man</option>
                                                    <option value="Israel">Israel</option>
                                                    <option value="Italy">Italy</option>
                                                    <option value="Jamaica">Jamaica</option>
                                                    <option value="Japan">Japan</option>
                                                    <option value="Jersey">Jersey</option>
                                                    <option value="Jordan">Jordan</option>
                                                    <option value="Kazakhstan">Kazakhstan</option>
                                                    <option value="Kenya">Kenya</option>
                                                    <option value="Kiribati">Kiribati</option>
                                                    <option value="Korea, Democratic People's Republic of">Korea,
                                                        Democratic People's Republic of</option>
                                                    <option value="Korea, Republic of">Korea, Republic of</option>
                                                    <option value="Kuwait">Kuwait</option>
                                                    <option value="Kyrgyzstan">Kyrgyzstan</option>
                                                    <option value="Lao People's Democratic Republic">Lao People's
                                                        Democratic Republic</option>
                                                    <option value="Latvia">Latvia</option>
                                                    <option value="Lebanon">Lebanon</option>
                                                    <option value="Lesotho">Lesotho</option>
                                                    <option value="Liberia">Liberia</option>
                                                    <option value="Libyan Arab Jamahiriya">Libyan Arab Jamahiriya
                                                    </option>
                                                    <option value="Liechtenstein">Liechtenstein</option>
                                                    <option value="Lithuania">Lithuania</option>
                                                    <option value="Luxembourg">Luxembourg</option>
                                                    <option value="Macao">Macao</option>
                                                    <option value="Macedonia, The Former Yugoslav Republic of">
                                                        Macedonia, The Former Yugoslav Republic of</option>
                                                    <option value="Madagascar">Madagascar</option>
                                                    <option value="Malawi">Malawi</option>
                                                    <option value="Malaysia">Malaysia</option>
                                                    <option value="Maldives">Maldives</option>
                                                    <option value="Mali">Mali</option>
                                                    <option value="Malta">Malta</option>
                                                    <option value="Marshall Islands">Marshall Islands</option>
                                                    <option value="Martinique">Martinique</option>
                                                    <option value="Mauritania">Mauritania</option>
                                                    <option value="Mauritius">Mauritius</option>
                                                    <option value="Mayotte">Mayotte</option>
                                                    <option value="Mexico">Mexico</option>
                                                    <option value="Micronesia, Federated States of">Micronesia,
                                                        Federated States of</option>
                                                    <option value="Moldova, Republic of">Moldova, Republic of
                                                    </option>
                                                    <option value="Monaco">Monaco</option>
                                                    <option value="Mongolia">Mongolia</option>
                                                    <option value="Montenegro">Montenegro</option>
                                                    <option value="Montserrat">Montserrat</option>
                                                    <option value="Morocco">Morocco</option>
                                                    <option value="Mozambique">Mozambique</option>
                                                    <option value="Myanmar">Myanmar</option>
                                                    <option value="Namibia">Namibia</option>
                                                    <option value="Nauru">Nauru</option>
                                                    <option value="Nepal">Nepal</option>
                                                    <option value="Netherlands">Netherlands</option>
                                                    <option value="Netherlands Antilles">Netherlands Antilles
                                                    </option>
                                                    <option value="New Caledonia">New Caledonia</option>
                                                    <option value="New Zealand">New Zealand</option>
                                                    <option value="Nicaragua">Nicaragua</option>
                                                    <option value="Niger">Niger</option>
                                                    <option value="Nigeria">Nigeria</option>
                                                    <option value="Niue">Niue</option>
                                                    <option value="Norfolk Island">Norfolk Island</option>
                                                    <option value="Northern Mariana Islands">Northern Mariana
                                                        Islands
                                                    </option>
                                                    <option value="Norway">Norway</option>
                                                    <option value="Oman">Oman</option>
                                                    <option value="Pakistan">Pakistan</option>
                                                    <option value="Palau">Palau</option>
                                                    <option value="Palestinian Territory, Occupied">Palestinian
                                                        Territory, Occupied</option>
                                                    <option value="Panama">Panama</option>
                                                    <option value="Papua New Guinea">Papua New Guinea</option>
                                                    <option value="Paraguay">Paraguay</option>
                                                    <option value="Peru">Peru</option>
                                                    <option value="Philippines">Philippines</option>
                                                    <option value="Pitcairn">Pitcairn</option>
                                                    <option value="Poland">Poland</option>
                                                    <option value="Portugal">Portugal</option>
                                                    <option value="Puerto Rico">Puerto Rico</option>
                                                    <option value="Qatar">Qatar</option>
                                                    <option value="Reunion">Reunion</option>
                                                    <option value="Romania">Romania</option>
                                                    <option value="Russian Federation">Russian Federation</option>
                                                    <option value="Rwanda">Rwanda</option>
                                                    <option value="Saint Helena">Saint Helena</option>
                                                    <option value="Saint Kitts and Nevis">Saint Kitts and Nevis
                                                    </option>
                                                    <option value="Saint Lucia">Saint Lucia</option>
                                                    <option value="Saint Pierre and Miquelon">Saint Pierre and
                                                        Miquelon
                                                    </option>
                                                    <option value="Saint Vincent and The Grenadines">Saint Vincent
                                                        and
                                                        The Grenadines</option>
                                                    <option value="Samoa">Samoa</option>
                                                    <option value="San Marino">San Marino</option>
                                                    <option value="Sao Tome and Principe">Sao Tome and Principe
                                                    </option>
                                                    <option value="Saudi Arabia">Saudi Arabia</option>
                                                    <option value="Senegal">Senegal</option>
                                                    <option value="Serbia">Serbia</option>
                                                    <option value="Seychelles">Seychelles</option>
                                                    <option value="Sierra Leone">Sierra Leone</option>
                                                    <option value="Singapore">Singapore</option>
                                                    <option value="Slovakia">Slovakia</option>
                                                    <option value="Slovenia">Slovenia</option>
                                                    <option value="Solomon Islands">Solomon Islands</option>
                                                    <option value="Somalia">Somalia</option>
                                                    <option value="South Africa">South Africa</option>
                                                    <option value="South Georgia and The South Sandwich Islands">
                                                        South
                                                        Georgia and The South Sandwich Islands</option>
                                                    <option value="Spain">Spain</option>
                                                    <option value="Sri Lanka">Sri Lanka</option>
                                                    <option value="Sudan">Sudan</option>
                                                    <option value="Suriname">Suriname</option>
                                                    <option value="Svalbard and Jan Mayen">Svalbard and Jan Mayen
                                                    </option>
                                                    <option value="Swaziland">Swaziland</option>
                                                    <option value="Sweden">Sweden</option>
                                                    <option value="Switzerland">Switzerland</option>
                                                    <option value="Syrian Arab Republic">Syrian Arab Republic
                                                    </option>
                                                    <option value="Taiwan">Taiwan</option>
                                                    <option value="Tajikistan">Tajikistan</option>
                                                    <option value="Tanzania, United Republic of">Tanzania, United
                                                        Republic of</option>
                                                    <option value="Thailand">Thailand</option>
                                                    <option value="Timor-leste">Timor-leste</option>
                                                    <option value="Togo">Togo</option>
                                                    <option value="Tokelau">Tokelau</option>
                                                    <option value="Tonga">Tonga</option>
                                                    <option value="Trinidad and Tobago">Trinidad and Tobago</option>
                                                    <option value="Tunisia">Tunisia</option>
                                                    <option value="Turkey">Turkey</option>
                                                    <option value="Turkmenistan">Turkmenistan</option>
                                                    <option value="Turks and Caicos Islands">Turks and Caicos
                                                        Islands
                                                    </option>
                                                    <option value="Tuvalu">Tuvalu</option>
                                                    <option value="Uganda">Uganda</option>
                                                    <option value="Ukraine">Ukraine</option>
                                                    <option value="United Arab Emirates">United Arab Emirates
                                                    </option>
                                                    <option value="United Kingdom">United Kingdom</option>
                                                    <option value="United States">United States</option>
                                                    <option value="United States Minor Outlying Islands">United
                                                        States
                                                        Minor Outlying Islands</option>
                                                    <option value="Uruguay">Uruguay</option>
                                                    <option value="Uzbekistan">Uzbekistan</option>
                                                    <option value="Vanuatu">Vanuatu</option>
                                                    <option value="Venezuela">Venezuela</option>
                                                    <option value="Viet Nam">Viet Nam</option>
                                                    <option value="Virgin Islands, British">Virgin Islands, British
                                                    </option>
                                                    <option value="Virgin Islands, U.S.">Virgin Islands, U.S.
                                                    </option>
                                                    <option value="Wallis and Futuna">Wallis and Futuna</option>
                                                    <option value="Western Sahara">Western Sahara</option>
                                                    <option value="Yemen">Yemen</option>
                                                    <option value="Zambia">Zambia</option>
                                                    <option value="Zimbabwe">Zimbabwe</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="control-label"> State/Province</div>
                                            <div class="">
                                                <input type="text" name="state" class="form-control" value=""
                                                       required />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="control-label">Zip/Postal Code</div>
                                            <div class="">
                                                <input type="text" name="" class="form-control" value="" required />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="">
                                                <div class="control-label">Standard Rate</div>
                                                <input type="radio" name="way" value=""> <span>Price may vary
                                                    depending on
                                                    the
                                                    item/destination. Shop Staff will contact you. $21.00</span>
                                                <div class="control-label">Pickup from store</div>
                                                <input type="radio" name="way" value=""> <span>305 La Trobe St
                                                    Melbourne
                                                    3000
                                                    $0.00</span>
                                            </div>
                                        </div>
                                    </form>
                                    <br>
                                </div>
                            </div>
                        </div>
                        <div>
                            <div class="tax">
                                <p>Apply Discount Code</p>
                                <button onclick="toggleDisplay('detail2')"
                                        style="width: 10%; border: white solid; border-radius: 30px; height: auto;"><svg
                                        width="16" height="15" viewBox="0 0 16 15" fill="none"
                                        xmlns="http://www.w3.org/2000/svg">
                                    <path d="M6 9.20209L8 7.20209L10 9.20209" stroke="black" stroke-width="1.6"
                                          stroke-linecap="round" />
                                    </svg>
                                </button>
                            </div>
                            <div id="detail2" style="display: none; color: gray;">
                                <div>
                                    <form action="" class="discount">
                                        <div class="form-group">
                                            <div class="control-label" style="text-align: left;">Enter discount code
                                            </div>
                                            <div class="">
                                                <input type="text" class="form-control" value="" required
                                                       placeholder="Enter Discount code" />
                                            </div>
                                        </div>
                                        <button type="submit"
                                                style="background-color: white; border: #0156ff solid 1px; color: #0156ff;">Apply
                                            Discount</button>
                                    </form>
                                </div>
                            </div>
                        </div>

                        <svg width="385" height="2" viewBox="0 0 385 2" fill="none"
                             xmlns="http://www.w3.org/2000/svg">
                        <path d="M0 1.00003L385 0.999997" stroke="#CACDD8" />
                        </svg>
                        <div>
                            <div class="totalPrice">
                                <p>Subtotal</p>
                                <p><fmt:formatNumber value="${total}" type="currency" /></p>
                            </div>
                            <div class="totalPrice">
                                <p>Shipping</p>
                                <p><fmt:formatNumber value="30000" type="currency" /></p>
                            </div>
                            <div class="totalPrice">
                                <p>Order Total</p>
                                <h4><fmt:formatNumber value="${total + 30000}" type="currency" /></h4>
                            </div>
                        </div>
                        <div class="btnSummary">
                            <button type="button"
                                    style="background-color: #0156ff; border: #0156ff solid 1px; color: white;"
                                    id="checkout">Proceed
                                to
                                Checkout</a></button>
                            <button
                                style="background-color: #ffb800; border: #0156ff solid 1px; color: black;">Check
                                out
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
                            <button style="background-color: white; border: gray solid 1px; color: gray;">Check Out
                                with
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
        <script>
            document.getElementById("checkout").addEventListener("click", function () {
                // Lấy tất cả các checkbox trong form
                const checkboxes = document.querySelectorAll("input[name='cartSelected']");
                let isChecked = false;

                // Kiểm tra xem có ít nhất một checkbox được chọn không
                checkboxes.forEach(checkbox => {
                    if (checkbox.checked) {
                        isChecked = true;
                    }
                });

                if (!isChecked) {
                    // Hiển thị thông báo nếu chưa chọn checkbox nào
                    alert("Vui lòng chọn ít nhất một sản phẩm.");
                } else {
                    // Gửi form nếu có checkbox được chọn
                    document.getElementById("cartSelected").submit();
                }
            });


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