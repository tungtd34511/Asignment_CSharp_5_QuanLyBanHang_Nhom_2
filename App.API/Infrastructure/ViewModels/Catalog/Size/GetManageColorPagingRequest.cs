using System;
using System.Collections.Generic;
using System.Text;
using App.API.Infrastructure.ViewModels.Common;

namespace App.API.Infrastructure.ViewModels.Catalog.Size
{
    public class GetManageSizePagingRequest : PagingRequestBase
    {
        public string? Keyword { get; set; }

        public string? LanguageId { get; set; }
    }
}