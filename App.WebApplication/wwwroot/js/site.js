
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
			$(e).html("");
			$.each(data, function (i, item) {
				var text = '<option value="' + item.id + '"\>' + item.code + '</option>'
				e.append(text);
			});
		},
		error: function (err) {
			message("ERROR", err);
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
function message(title,text) {
	$('.Label-message-alert').append(
		"<div class=\"alert alert-success bg-secondary m-0\" role=\"alert\">\r\n" +
		"<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\"><span aria-hidden=\"true\">&times;<\/span><\/button>\r\n" +
		"<strong>" + title + "!<\/strong>" + text + "\r\n" +
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
			message("ERROR",err);
		}
	});
};
loadquatity();
/// Add-to-cart



