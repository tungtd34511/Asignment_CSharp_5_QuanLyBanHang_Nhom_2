using System;
using System.Collections.Generic;
using System.Text;
using App.API.Infrastructure.ViewModels.Common;

namespace App.API.Infrastructure.ViewModels.Catalog.Products
{
    public class GetManageProductPagingRequest : PagingRequestBase
    {
        public string? Keyword { get; set; }

        public string? LanguageId { get; set; }

        public int? CategoryId { get; set; }

        public List<bool>? Checks { get;set; }
    }
}