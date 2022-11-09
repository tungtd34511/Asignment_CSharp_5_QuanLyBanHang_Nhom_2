// load select by productid and sizeid
function loadSizeById(id1, id2,e) {
	$.ajax({
		type: "GET",
		url: '/Shop/GetSizesByMany',
		data: {
			productid: id1,
			colorId: id2
		},
		success: function (data) {
			$(e).empty();
			$.each(data, function (i, item) {
				var text = '<option value="' + item.id + '"\>' + item.code + '</option>'
				e.append(text);
			});
		},
		error: function (err) {
			message("Eror404");
		}
	});
}
/// select color onchange

$('body').on('change', '.colours', function () { /// script rren ra seclect 2 chứ không phải select 1;
	//ways to retrieve selected option and text outside handler 
	const id1 = this.id;
	var selectSizes = $(this).parents(".product-button").find("select.sizes");
	const id2 = $(this).children("option:selected").val()
	loadSizeById(id1, id2, selectSizes);
});
//$('select.colours').on('change', function () {
	
//});
function message(text) {
	$('.Label-message-alert').append(
		"<div class=\"alert alert-success bg-secondary m-0\" role=\"alert\">\r\n" +
		"<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\"><span aria-hidden=\"true\">&times;<\/span><\/button>\r\n" +
		"<strong>Success!<\/strong>" + text + "\r\n" +
		"<\/div>");
	window.setTimeout(function () {
		$(".alert").fadeTo(500, 0).slideUp(500, function () {
			$(this).remove();
		});
	}, 4000);
}
function loadquatity() {
	$.ajax({
		type: "GET",
		url: '/Cart/GetQuantity',
		success: function (data) {
			$('#TotalItem').text(data);
		},
		error: function (err) {
			console.log(err);
		}
	});
};
loadquatity();
/// Add-to-cart
$('body').on('click', '.btn-add-cart', function (e) {
	e.preventDefault();
	const id1 = $(this).data('id');
	const id2 = $(this).parents(".product-button").find("select.colours").children("option:selected").val()
	const id3 = $(this).parents(".product-button").find("select.sizes").children("option:selected").val()
	alert("id1:" + id1 + "id2:" + id2 + "id3:" + id3);
	$.ajax({
		type: "POST",
		url: '/Cart/AddToCart',
		data: {
			id1: id1,
			id2: id2,
			id3: id3,
			languageId: "vi"
		},
		success: function () {
			loadquatity();
			message("Thêm sản phẩm thành công !");
		},
		error: function (err) {
			message(err);
		}
	});
})


