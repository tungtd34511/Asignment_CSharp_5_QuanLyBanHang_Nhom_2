using App.API.Infrastructure.Utilities.Exceptions;
using App.API.Infrastructure.ViewModels.Catalog.Color;
using App.API.Infrastructure.ViewModels.Catalog.ProductVariations;
using App.API.Infrastructure.ViewModels.Common;
using Data.DbContext;
using Data.Entities;
using Microsoft.EntityFrameworkCore;

namespace App.API.Services.Catalog.ProductVariations
{
    public class ProductVariationService : IProductVariationService
    {
        private readonly QLBHContext _context;

        public ProductVariationService(QLBHContext context)
        {
            _context = context;
        }
        public async Task<PagedResult<ProductVariationVm>> GetAllPaging(GetManageProductVariationPagingRequest request)
        {
            var query = from a in _context.ProductVariations
                        join cl in _context.Colors on a.ColorId equals cl.Id
                        join s in _context.Sizes on a.SizeId equals s.Id
                        join py in _context.ProductTranslations on a.ProductId equals py.ProductId
                        where py.LanguageId == request.LanguageId
                        select new { a, cl, s, py };
            //2. filter
            if (!string.IsNullOrEmpty(request.Keyword))
            {
                var kw = request.Keyword.ToLower();
                query = query.Where(x => x.py.Name.ToLower().Contains(kw) || x.cl.Name.ToLower().Contains(kw) || x.s.Name.ToLower().Contains(kw));
            }
            //3. Paging
            int totalRow = await query.CountAsync();

            var data = await query.Skip((request.PageIndex - 1) * request.PageSize)
                .Take(request.PageSize).Select(c => new ProductVariationVm()
                {
                    Id = c.a.Id,
                    ProductId = c.a.ProductId,
                    ColorCode = c.cl.HEXCode,
                    ColorName = c.cl.Name,
                    ColorId = c.cl.Id,
                    SizeId = c.s.Id,
                    SizeCode = c.s.Code,
                    SizeName = c.s.Name,
                    Stock = c.a.Stock
                }).ToListAsync();

            //4. Select and projection

            var pagedResult = new PagedResult<ProductVariationVm>()
            {
                TotalRecords = totalRow,
                PageSize = request.PageSize,
                PageIndex = request.PageIndex,
                Items = data
            };
            return pagedResult;
        }
        public async Task<List<ProductVariationVm>> GetByProductVariationsAsync()
        {
            var l1 = _context.ProductVariations.ToList();
            var l3 = _context.Sizes.ToList();
            var l2 = _context.Colors.ToList();
            var query = (from p in l1
                         join cl in l2 on p.ColorId equals cl.Id
                         join s in l3 on p.SizeId equals s.Id
                         select new ProductVariationVm()
                         {
                             Id = p.Id,
                             ColorId = p.ColorId,
                             SizeId = p.SizeId,
                             ProductId = p.ProductId,
                             ColorCode = cl.HEXCode,
                             ColorName = cl.Name,
                             SizeCode = s.Code,
                             SizeName = s.Name,
                             Stock = p.Stock
                         });
            return query.ToList();
        }

        public async Task<List<ProductVariationVm>> GetByProductVariationsByProductIdAsync(int id)
        {
            var l1 = _context.ProductVariations.Where(c => c.ProductId == id).ToList();
            var l3 = _context.Sizes.ToList();
            var l2 = _context.Colors.ToList();
            var query = (from p in l1
                         join cl in l2 on p.ColorId equals cl.Id
                         join s in l3 on p.SizeId equals s.Id
                         select new ProductVariationVm()
                         {
                             Id = p.Id,
                             ColorId = p.ColorId,
                             SizeId = p.SizeId,
                             ProductId = p.ProductId,
                             ColorCode = cl.HEXCode,
                             ColorName = cl.Name,
                             SizeCode = s.Code,
                             SizeName = s.Name,
                             Stock = p.Stock
                         });
            return query.ToList();
        }

        public async Task<ProductVariationVm> GetById(int id)
        {
            var pv = await (from a in _context.ProductVariations
                            join b in _context.Colors on a.ColorId equals b.Id
                            join c in _context.Sizes on a.SizeId equals c.Id
                            select new ProductVariationVm()
                            {
                                Id = a.Id,
                                ProductId = a.ProductId,
                                ColorId = b.Id,
                                ColorName = b.Name,
                                ColorCode = b.HEXCode,
                                SizeId = c.Id,
                                SizeName = c.Name,
                                SizeCode = c.Code,
                                Stock = a.Stock
                            }).FirstOrDefaultAsync(z => z.Id == id);
            if (pv == null) throw new EShopException($"Cannot find a ProductVariation: {id}");
            return pv;
        }
        public async Task<int> Create(ProductVariation request)
        {
            _context.ProductVariations.Add(request);
            await _context.SaveChangesAsync();
            return request.Id;
        }

        public async Task<int> Update(ProductVariation request)
        {
            var re = _context.ProductVariations.FirstOrDefault(c=>(c.ColorId==request.ColorId&&c.SizeId==request.SizeId&&request.ProductId==c.ProductId)||request.Id==c.Id);
            re.Stock = request.Stock;
            var a=  _context.ProductVariations.Update(re);
            var b = a;
            return await _context.SaveChangesAsync();
        }
    }
}
