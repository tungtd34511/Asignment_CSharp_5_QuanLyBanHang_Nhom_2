using System.ComponentModel.DataAnnotations;

namespace App.API.Infrastructure.ViewModels.Catalog.ProductVariations
{
	public class UpdateProductVariationRequest
	{
        public int Id { get; set; }

        [Required(ErrorMessage = "Id sản phẩm không được để trống")]
        [RegularExpression("^0-9", ErrorMessage = "Id ản phẩm không được nhập chữ")]
        public int ProductId { get; set; }

        [Required(ErrorMessage = "Id size không được để trống")]
        [RegularExpression("^0-9", ErrorMessage = "Id size không được nhập chữ")]
        public int SizeId { get; set; }

        [Required(ErrorMessage = "Id màu không được để trống")]
        [RegularExpression("^0-9", ErrorMessage = "Id màu không được nhập chữ")]
        public int ColorId { get; set; }

        [Required(ErrorMessage = "Stock không được để trống")]
        [RegularExpression("^0-9", ErrorMessage = "Stock không được nhập chữ")]
        public int Stock { get; set; }
    }
}
