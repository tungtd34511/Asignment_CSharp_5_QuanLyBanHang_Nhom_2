using App.API.Infrastructure.Utilities.Exceptions;
using App.API.Infrastructure.ViewModels.Catalog.Products;
using App.API.Infrastructure.ViewModels.Catalog.Size;
using App.API.Infrastructure.ViewModels.Common;
using Data.DbContext;
using Data.Entities;
using Microsoft.EntityFrameworkCore;
using System.Linq;
namespace App.API.Services.Catalog.Sizes
{
    public class SizeService : ISizeService
    {
        private readonly QLBHContext _context;

        public SizeService(QLBHContext context)
        {
            _context = context;
        }
        public async Task<int> Create(Size request)
        {
            _context.Sizes.Add(request);
            await _context.SaveChangesAsync();
            return request.Id;
        }

        public async Task<int> Update(Size request)
        {
            _context.Sizes.Update(request);
            await _context.SaveChangesAsync();
            return request.Id;
        }

        public async Task<int> Delete(int Id)
        {
            var color = await _context.Sizes.FindAsync(Id);
            if (color == null) throw new EShopException($"Cannot find a size: {Id}");
            _context.Sizes.Remove(color);
            return await _context.SaveChangesAsync();
        }

        public async Task<Size> GetById(int id)
        {
            var color = await _context.Sizes.FirstOrDefaultAsync(c => c.Id == id);
            if (color == null) throw new EShopException($"Cannot find a size: {id}");
            return color;
        }
        public async Task<IEnumerable<Size>> GetSizesByMany(int productid, int colorId)
        {
            var sizes = from a in _context.Sizes
                        join b in _context.ProductVariations.Where(c => c.ProductId == productid && c.ColorId == colorId).Select(cl => cl.SizeId).Distinct() on a.Id equals b
                        select a;
            return sizes;
        }
        public async Task<PagedResult<Size>> GetAllPaging(GetManageSizePagingRequest request)
        {
            var query = from a in _context.Sizes
                        select a;
            //2. filter
            if (!string.IsNullOrEmpty(request.Keyword))
            {
                query = query.Where(x => x.Name.Contains(request.Keyword));
            }
            //3. Paging
            int totalRow = await query.CountAsync();

            var data = await query.Skip((request.PageIndex - 1) * request.PageSize)
                .Take(request.PageSize).ToListAsync();

            //4. Select and projection

            var pagedResult = new PagedResult<Size>()
            {
                TotalRecords = totalRow,
                PageSize = request.PageSize,
                PageIndex = request.PageIndex,
                Items = data
            };
            return pagedResult;
        }
        public async Task<List<Size>> GetAll()
        {
            return await _context.Sizes.ToListAsync();
        }
    }
}
