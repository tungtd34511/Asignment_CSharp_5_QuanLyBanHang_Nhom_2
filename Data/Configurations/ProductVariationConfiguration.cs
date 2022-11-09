using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Data.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace Data.Configurations
{
    public class ProductVariationConfiguration : IEntityTypeConfiguration<ProductVariation>
    {
        public void Configure(EntityTypeBuilder<ProductVariation> builder)
        {
            builder.ToTable("ProductVariations");
            builder.HasKey(x => x.Id);
            builder.Property(c => c.Id).UseIdentityColumn();
            builder.Property(x => x.Stock).IsRequired().HasDefaultValue(0);
            builder.HasOne(x => x.Product).WithMany(x => x.ProductVariations).HasForeignKey(x => x.ProductId);
            builder.HasOne(x => x.Size).WithMany(x => x.ProductVariations).HasForeignKey(x => x.SizeId);
            builder.HasOne(x => x.Color).WithMany(x => x.ProductVariations).HasForeignKey(x => x.ColorId);
        }
    }
}
