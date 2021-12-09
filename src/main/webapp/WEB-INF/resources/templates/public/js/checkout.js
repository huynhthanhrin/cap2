var Checkout = function () {

    return {
        init: function () {
            
            $('#checkout').on('change', '#checkout-content input[name="account"]', function() {

              var title = '';

              if ($(this).attr('value') == 'register') {
                title = 'Step 2: Account &amp; Billing Details';
              } else {
                title = 'Step 2: Billing Details';
              }    

              $('#payment-address .accordion-toggle').html(title);
            });

        }
    };

}();

function confirmOrder () {
    var re_name = $("#re_name").val();
    var re_phone = $("#re_phone").val();
    var address_delivery = $("#address_delivery").val();
    var same_dilivery_address = document.getElementById('same_dilivery_address').checked;
    var cartArray = shoppingCart.listCart();

    var data = {
        "recipientName" : re_name,
        "recipientPhone" : re_phone,
        "recipientAddress" : address_delivery,
        "sameAddressDelivery" : same_dilivery_address,
        "cartRequest" : cartArray
    }

    $.ajax({
        url: "/api/order",
        type: "POST",
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        data: JSON.stringify(data),
        success: function (result) {
            //$("#wait").css("display", "none");
            if (result.code == '200') {
                swal({
                    title: 'Order Successfully!',
                    /* text: 'Redirecting...', */
                    icon: 'success',
                    timer: 2000,
                    buttons: true,
                    type: 'success'
                }).then(function () {
                    shoppingCart.clearCart();

                    window.location = "/order/index?order=success";

                    return;
                });

            }
        },
        error: function (xhr, status, error) {
            $("#register_error_mes").show();
        }
    });
}