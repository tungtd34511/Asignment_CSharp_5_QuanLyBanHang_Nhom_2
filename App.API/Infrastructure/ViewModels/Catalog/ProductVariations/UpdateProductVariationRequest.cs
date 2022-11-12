using System.ComponentModel.DataAnnotations;

namespace App.API.Infrastructure.ViewModels.Catalog.ProductVariations
{
	public class UpdateProductVariationRequest
	{
        public int Id { get; set; }

        [Required(ErrorMessage = "Id sản phẩm không được để trống")]
        public int ProductId { get; set; }

        [Required(ErrorMessage = "Id size không được để trống")]
        public int SizeId { get; set; }

        [Required(ErrorMessage = "Id màu không được để trống")]
        public int ColorId { get; set; }

        [Required(ErrorMessage = "Stock không được để trống")]
        public int Stock { get; set; }
    }
}
