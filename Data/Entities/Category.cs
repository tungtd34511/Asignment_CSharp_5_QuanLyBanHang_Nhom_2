using System;
using System.Collections.Generic;
using System.Text;
using Data.Enums;

namespace Data.Entities
{
    public class Category
    {
        public int Id { set; get; }
        public int SortOrder { set; get; }
        public bool IsShowOnHome { set; get; }
        public int? ParentId { set; get; }
        public Status Status { set; get; }
        public virtual List<ProductInCategory> ProductInCategories { get; set; }

        public virtual List<CategoryTranslation> CategoryTranslations { get; set; }

    }
}
