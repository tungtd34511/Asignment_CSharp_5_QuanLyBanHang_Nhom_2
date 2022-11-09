namespace App.API.Infrastructure.ViewModels.Catalog.ProductVariations
{
    //Biến thể sản phẩm
    public class ProductVariationVm
    {
        public int Id { get; set; }
        public int ProductId { set; get; }
        public int ColorId { set; get; }
        public string? ColorName { set; get; }
        public string? ColorCode { set; get; }
        public int SizeId { set; get; }
        public string? SizeName { set; get; }
        public string? SizeCode { set; get; }
        //Số lượng
        public int Stock { set; get; }
    }
}
