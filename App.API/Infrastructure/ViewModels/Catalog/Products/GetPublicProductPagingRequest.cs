using System;
using System.Collections.Generic;
using System.Text;
using App.API.Infrastructure.ViewModels.Common;

namespace App.API.Infrastructure.ViewModels.Catalog.Products
{
    public class GetPublicProductPagingRequest : PagingRequestBase
    {
        public int? CategoryId { get; set; }
    }
}