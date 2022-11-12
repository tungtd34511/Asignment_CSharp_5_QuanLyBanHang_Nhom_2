$('body').on('click', 'a.page-index.button', function (e) {
	e.preventDefault();
	const id1 = $(this).data('id');
	$.ajax({
		type: "POST",
		url: '/Shop/SetPageIndex',
		data: {
			index: id1
		},
		success: function () {
			$("form.from-shoping").submit();
		},
		error: function (err) {
			message("ERROR", err);
		}
	});
})
