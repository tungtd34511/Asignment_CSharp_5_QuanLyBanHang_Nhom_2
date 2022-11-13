using Data.Enums;

namespace App.API.Infrastructure.ViewModels.Catalog.Categories
{
    public class CreateCatergoryRequest
    {
        public int SortOrder { set; get; }
        public bool IsShowOnHome { set; get; } = true;
        public int? ParentId { set; get; }
        public Status Status { set; get; }
        public int TranLasteId { set; get; }
        public string? Name { set; get; }
        public string? SeoDescription { set; get; }
        public string? SeoTitle { set; get; }
        public string? LanguageId { set; get; } = "vi";
        public string? SeoAlias { set; get; }
    }
}
