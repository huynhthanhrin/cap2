<div id="home-slider">
    <div class="container">
        <div class="row">
            <div class="col-sm-12 header-top-right">
                <div class="homeslider">
                    <ul id="contenhomeslider">
                        <li><img alt="Funky roots" src="/resources/templates/public/images/slide/img1.jpg" title="Funky roots"/></li>
                        <li><img alt="Funky roots" src="/resources/templates/public/images/slide/img2.jpg" title="Funky roots"/></li>
                        <li><img alt="Funky roots" src="/resources/templates/public/images/slide/img3.jpg" title="Funky roots"/></li>
                        <li><img alt="Funky roots" src="/resources/templates/public/images/slide/img4.jpg" title="Funky roots"/></li>
                        <li><img alt="Funky roots" src="/resources/templates/public/images/slide/img5.jpg" title="Funky roots"/></li>
                        <li><img alt="Funky roots" src="/resources/templates/public/images/slide/img6.jpg" title="Funky roots"/></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- END Home slideder-->

<!-- page wapper-->
<div class="columns-container">
    <div class="container" id="columns">
        <!-- page heading-->
        <h2 class="page-heading">
            <span class="page-heading-title">Check out</span>
        </h2>
        <!-- ../page heading-->
        <div class="page-content page-order">
            <div class="panel-group checkout-page accordion scrollable" id="checkout-page">


                <!-- BEGIN PAYMENT ADDRESS -->
                <div id="payment-address" class="panel panel-default">
                    <div class="panel-heading">
                        <h2 class="panel-title">
                            <a data-toggle="collapse" data-parent="#checkout-page" href="#payment-address-content" class="accordion-toggle">
                                Step 1: Your Personal Details
                            </a>
                        </h2>
                    </div>
                    <div id="payment-address-content" class="panel-collapse collapse in">
                        <div class="panel-body row">
                            <div class="col-md-6 col-sm-6">

                                <div class="form-group">
                                    <label for="re_name">Recipient's Name<span class="require">*</span></label>
                                    <input type="text" id="re_name" class="input form-control">
                                </div>
                            </div>
                            <div class="col-md-6 col-sm-6">
                                <div class="form-group">
                                    <label for="re_phone">Phone Number<span class="require">*</span></label>
                                    <input type="text" id="re_phone" class="input form-control">
                                </div>

                            </div>
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label for="address_delivery">Address</label>
                                    <textarea type="text" id="address_delivery" class="input form-control"></textarea>
                                </div>
                            </div>

                            <hr>
                            <div class="col-md-12">
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox" class="checkbox"> I wish to subscribe to the FMOOS newsletter.
                                    </label>
                                </div>
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox" id="same_dilivery_address" name="same_dilivery_address" checked="checked"> My delivery and billing addresses are the same.
                                    </label>
                                </div>
                                <button class="button  pull-left" type="submit" data-toggle="collapse" data-parent="#checkout-page" data-target="#payment-method-content" id="button-payment-address">Continue</button>

                            </div>
                        </div>
                    </div>
                </div>
                <!-- END PAYMENT ADDRESS -->

                <!-- BEGIN PAYMENT METHOD -->
                <div id="payment-method" class="panel panel-default">
                    <div class="panel-heading">
                        <h2 class="panel-title">
                            <a data-toggle="collapse" data-parent="#checkout-page" href="#payment-method-content" class="accordion-toggle">
                                Step 2: Payment Method
                            </a>
                        </h2>
                    </div>
                    <div id="payment-method-content" class="panel-collapse collapse">
                        <div class="panel-body row">
                            <div class="col-md-12">
                                <p>Please select the preferred payment method to use on this order.</p>
                                <div class="radio-list">
                                    <label>
                                        <input type="radio" name="CashOnDelivery" value="CashOnDelivery"> Cash On Delivery
                                    </label>
                                </div>
                                <div class="form-group">
                                    <label for="delivery-payment-method">Add Comments About Your Order</label>
                                    <textarea id="delivery-payment-method" rows="8" class="input form-control"></textarea>
                                </div>

                                <div class="checkbox pull-left">
                                    <label>
                                        <input type="checkbox"> I have read and agree to the <a title="Terms & Conditions" href="#">Terms & Conditions </a> &nbsp;&nbsp;&nbsp;
                                    </label>
                                </div>
                                <div style="clear: both">
                                    <button class="button pull-left" type="submit" id="button-payment-method" data-toggle="collapse" data-parent="#checkout-page" data-target="#confirm-content">Continue</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- END PAYMENT METHOD -->

                <!-- BEGIN CONFIRM -->
                <div id="confirm" class="panel panel-default">
                    <div class="panel-heading">
                        <h2 class="panel-title">
                            <a data-toggle="collapse" data-parent="#checkout-page" href="#confirm-content" class="accordion-toggle">
                                Step 3: Confirm Order
                            </a>
                        </h2>
                    </div>
                    <div id="confirm-content" class="panel-collapse collapse">
                        <div class="panel-body row">
                            <div class="col-md-12 clearfix">
                                <div class="table-wrapper-responsive">
                                    <table class="table table-bordered table-responsive cart_summary">
                                        <thead>
                                        <tr>
                                            <th class="cart_product">Product</th>
                                            <th>Description</th>
                                            <th>Status</th>
                                            <th>Unit price</th>
                                            <th>Qty</th>
                                            <th>Total</th>
                                        </tr>
                                        </thead>
                                        <tbody id="show-list-order">

                                        </tbody>
                                        <tfoot>
                                        <tr>
                                            <td colspan="2" rowspan="3"></td>
                                            <td colspan="3"><strong>Total(tax incl.)</strong></td>
                                            <td colspan="2" id="total_price" style="font-weight: bold; color: #e84d1c; font-size: 20px;">54,000</td>
                                        </tr>
                                        <tr>

                                            <td colspan="3"><strong>Voucher</strong></td>
                                            <td colspan="2">
                                                <input style="font-weight: normal; letter-spacing: 3px;" class="input form-control" placeholder="Voucher....">
                                            </td>
                                        </tr>
                                        <tr>

                                            <td colspan="3"><strong>Total</strong></td>
                                            <td colspan="2" id="total_price_all" style="font-weight: bold; color: #e84d1c; font-size: 20px;">54,000</td>
                                        </tr>
                                        </tfoot>
                                    </table>
                                </div>
                                <div class="clearfix"></div>
                                <button class="button pull-right" type="submit" onclick="return confirmOrder();" id="button-confirm">Confirm Order</button>
                                <button type="button" id="btn-remove-all-item" class="button-cancel pull-right margin-right-20">Cancel</button>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- END CONFIRM -->
            </div>

        </div>
    </div>
</div>
<!-- ./page wapper-->