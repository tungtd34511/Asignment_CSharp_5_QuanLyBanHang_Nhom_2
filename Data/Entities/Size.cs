using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Data.Entities
{
    public class Size
    {
        public int Id { get; set; }
        public string? Name { get; set; }
        public string? Code { get; set; }
        public bool Status { get; set; } = true;
        public virtual List<ProductVariation>? ProductVariations { get; set; }
    }
}
