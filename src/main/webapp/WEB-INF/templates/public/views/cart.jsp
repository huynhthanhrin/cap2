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
            <span class="page-heading-title">Shopping Cart</span>
        </h2>
        <!-- ../page heading-->
        <div class="page-content page-order">

            <div class="heading-counter warning" ><span class="fa fa-shopping-cart"></span> Your shopping cart contains:
                <span id="count-cart" style="font-weight: bold">1</span> <span> Products</span>
            </div>
            <div class="alert alert-danger" role="alert" hidden id="notcheckout">
                You can only order from one store, please choose again or delete products!
            </div>
            <div class="order-detail-content">
                <table class="table table-bordered table-responsive cart_summary">
                    <thead>
                    <tr>
                        <th class="cart_product">Product</th>
                        <th>Description</th>
                        <th>Status</th>
                        <th>Unit price</th>
                        <th>Qty</th>
                        <th>Total</th>
                        <th class="action"><i class="fa fa-trash-o"></i></th>
                    </tr>
                    </thead>
                    <tbody id="show-item-cart">

                    </tbody>
                    <tfoot>
                    <tr>
                        <td colspan="2" rowspan="1"></td>
                        <td colspan="3"><strong>Total(tax incl.)</strong></td>
                        <td colspan="1" id="total_price" style="font-weight: bold; color: #e84d1c; font-size: 20px;">54,000</td>
                        <td></td>
                    </tr>
                    </tfoot>
                </table>
                <div class="cart_navigation">
                    <a class="prev-btn" href="javascript:history.go(-1)">Continue shopping</a>
                    <a id="pcheckout" class="next-btn" href="/checkout">Proceed to checkout</a>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- ./page wapper-->