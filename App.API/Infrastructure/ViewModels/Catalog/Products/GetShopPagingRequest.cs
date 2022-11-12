namespace App.API.Infrastructure.ViewModels.Catalog.Products
{
    public class GetShopPagingRequest
    {
        public string? Keyword { get; set; }
        public List<bool>? Checks { get; set; }
    }
}