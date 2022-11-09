namespace App.API.Infrastructure.ViewModels.Catalog.Oders
{
    public class OderDetailVm
    {
        public int OrderId { set; get; }
        public int ProductVariationId { set; get; }
        public int Quantity { set; get; }
        public decimal Price { set; get; }
        public int ProductId { set; get; }
        public string? ProductName { set; get; }
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
