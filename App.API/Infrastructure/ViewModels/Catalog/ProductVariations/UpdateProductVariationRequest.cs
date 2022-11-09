namespace App.API.Infrastructure.ViewModels.Catalog.ProductVariations
{
	public class UpdateProductVariationRequest
	{
        public int Id { get; set; }
        public int ProductId { get; set; }
        public int SizeId { get; set; }
        public int ColorId { get; set; }
        public int Stock { get; set; }
    }
}
