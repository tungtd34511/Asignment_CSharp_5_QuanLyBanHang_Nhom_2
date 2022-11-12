using App.API.Infrastructure.ViewModels.Catalog.Products;
using App.API.Infrastructure.ViewModels.System.Roles;

namespace App.API.Infrastructure.ViewModels.Common
{
    public class ShopingResult
    {
        public int PageIndex { get; set; }

        public int PageSize { get; set; }

        public int TotalRecords { get; set; }
        public List<Checked>? Checklists { get; set; }
        public string? Keyword { get; set; }

        public int PageCount
        {
            get
            {
                var pageCount = (double)TotalRecords / PageSize;
                return (int)Math.Ceiling(pageCount);
            }
        }
        public List<ProductVm>? Items { set; get; }
    }
}
