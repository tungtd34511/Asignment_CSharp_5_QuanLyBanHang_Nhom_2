// id1: Productid, id2: Colorid, id3: Sizeid
function updateCart(id1, id2, id3, quantity, e) {
    function GetListItems() {
        
        $.ajax({
            type: "GET",
            url: '/Cart/GetListItems',
            success: function (res) {
                var total = 0;
                if (res.length == 0) {
                    $("a.btn_check_out").hide();
                }
                else {
                    $("a.btn_check_out").show();
                }
                $.each(res, function (i, item) {                   
                    var amount = item.price * item.quantity;
                    if (item.productId == id1 && item.colorId == id2 && id3 == item.sizeId) {

                        $("#td-amount-item" + id1 + id2 + id3).text(amount + " VNĐ");
                    }
                    total += amount;
                    
                });
                $('#cart-sum-total').text(total + " VNĐ");
            },
            error: function (err) {
                alert(err);
            }
        });
    }
    $.ajax({
        type: "POST",
        url: '/Cart/UpdateCart',
        data: {
            id1: id1,
            id2: id2,
            id3: id3,
            quantity: quantity
        },
        success: function (res) {
            GetListItems();
            message("Update cart success !");
            if (quantity == 0) {
                var a = $("#" + id1 + "_" + id2 + "_" + id3);
                a.remove();
            };
            e.parents(".input-group.quantity").children("#Quantity").val(quantity);
            loadquatity();
        },
        error: function (err) {
            console.log(err);
        }
    });
}

$('body').on('click', '.btnPlus', function () {
    ///Quantity
    const id = String(this.id);
    var listId = id.split("_");
    const id1 = listId[0];
    const id2 = listId[1];
    const id3 = listId[2];
    quantity = parseInt($(this).parents(".input-group.quantity").children("#Quantity").val())+1;
    updateCart(id1, id2, id3, quantity, $(this));
    });

    $('body').on('click', '.btnMinus', function () {
        ///Quantity
        const id = String(this.id);
        var listId = id.split("_");
        const id1 = listId[0];
        const id2 = listId[1];
        const id3 = listId[2];
        quantity = parseInt($(this).parents(".input-group.quantity").children("#Quantity").val()) - 1;
        updateCart(id1, id2, id3, quantity, $(this));
    });
$('body').on('click', '.btn-Delete-row', function () {
    const id = String(this.id);
    var listId = id.split("_");
    const id1 = listId[0];
    const id2 = listId[1];
    const id3 = listId[2];
    updateCart(id1, id2, id3, 0, $(this).parents("tr").children(".btnMinus"));
    });