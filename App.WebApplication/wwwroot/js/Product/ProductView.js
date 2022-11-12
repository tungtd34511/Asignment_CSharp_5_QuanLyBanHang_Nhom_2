
/// select color onchange
function CheckStok(id1,id2,id3,quantity,e) {
    $.ajax({
        type: "POST",
        url: '/Cart/CheckStok',
        data: {
            id1: id1,
            id2: id2,
            id3: id3
        },
        success: function (res) {
            if ($(e).val() < parseInt(res)) {
                e.val(quantity);
            }
            else {
                message("ERROR", "Quantity Reached Max!");
            }
        },
        error: function (err) {
            message("ERROR", err);
        }
    });
}
$('.Product-view').on('change', '.colours', function () { /// script rren ra seclect 2 chứ không phải select 1;
    //ways to retrieve selected option and text outside handler 
    const id1 = this.id;
    var selectSizes = $(this).parents(".product-button-2s").find("select.sizes");
    const id2 = $(this).children("option:selected").val()
    loadSizeById(id1, id2, selectSizes);
});
//
$('.Product-view').on('click', '.btnPlus', function () {
    ///Quantity
    const id1 = $(this).data('id');
    const id3 = $("select.sizes").children("option:selected").val();
    const id2 = $("select.colours").children("option:selected").val();
    var input = $(this).parents(".input-group.quantity").children("#Quantity")
   
    quantity = parseInt(input.val()) + 1;
    CheckStok(id1, id2, id3, quantity, input);
    });

$('.Product-view').on('click', '.btnMinus', function () {
    ///Quantity
    const id1 = $(this).data('id');
    const id3 = $("select.sizes").children("option:selected").val();
    const id2 = $("select.colours").children("option:selected").val();
    var input = $(this).parents(".input-group.quantity").children("#Quantity")
    if (parseInt(input.val()) > 0) {
        quantity = parseInt(input.val()) - 1;
        CheckStok(id1, id2, id3, quantity, input);
    };
});

/// Add-to-cart
$('.Product-view').on('click', '.btn-add-cart', function (e) {
    e.preventDefault();
    const id1 = $(this).data('id');
    const id2 = $(this).parents(".product-button-2s").find("select.colours").children("option:selected").val()
    const id3 = $(this).parents(".product-button-2s").find("select.sizes").children("option:selected").val()
    const stok = $(this).parents(".product-button-2s").find("#Quantity").val()
    alert("id1:" + id1 + "id2:" + id2 + "id3:" + id3);
    if (parseInt(stok) > 0) {
        $.ajax({
            type: "POST",
            url: '/Cart/AddToCart',
            data: {
                id1: id1,
                id2: id2,
                id3: id3,
                stok: stok,
                languageId: "vi"
            },
            success: function () {
                loadquatity();
                message("SUCCESS","Add to cart successfully!");
            },
            error: function (err) {
                message("ERROR", err);
            }
        });
    }
    else {
        message("ERROR", "Acess Denined!");
    }
    
})