using App.API.Infrastructure.Utilities.Exceptions;
using App.API.Infrastructure.ViewModels.Catalog.Color;
using App.API.Infrastructure.ViewModels.Catalog.Products;
using App.API.Infrastructure.ViewModels.Common;
using Data.DbContext;
using Data.Entities;
using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using System.Linq;
using System.Net.WebSockets;

namespace App.API.Services.Catalog.Colors
{
    public class ColorService : IColorService
    {
        private readonly QLBHContext _context;

        public ColorService(QLBHContext context)
        {
            _context = context;
        }
        public async Task<int> Create(ColorCreateRequest request)
        {
            var color = new Color()
            {
                Name = request.Name,
                HEXCode = request.HexCode
            };
            _context.Colors.Add(color);
            await _context.SaveChangesAsync();
            return color.Id;
        }
        public async Task<List<Color>> GetAll()
        {
            return await _context.Colors.ToListAsync();
        }
        public async Task<int> Update(UpdateColorRequest request)
        {
            var color = _context.Colors.FirstOrDefault(c => c.Id == request.Id);
            color.Name = request.Name;
            color.HEXCode = request.HexCode;
            _context.Colors.Update(color);
            await _context.SaveChangesAsync();
            return request.Id;
        }

        public async Task<int> Delete(int colorId)
        {
            var color = await _context.Colors.FindAsync(colorId);
            if (color == null) throw new EShopException($"Cannot find a color: {colorId}");
            _context.Colors.Remove(color);
            return await _context.SaveChangesAsync();
        }

        public async Task<Color> GetById(int id)
        {
            var color = await _context.Colors.FirstOrDefaultAsync(c=>c.Id==id);
            if (color == null) throw new EShopException($"Cannot find a color: {id}");
            return color;
        }

        public async Task<PagedResult<Color>> GetAllPaging(GetManageColorPagingRequest request)
        {
            var query = from a in _context.Colors
                        select a;
            var totalRow = 0;
            //2. filter
            if (!string.IsNullOrEmpty(request.Keyword))
            {
                query = query.Where(x => x.Name.Contains(request.Keyword));
            }
            //3. Paging
            totalRow = await query.CountAsync();
            var data = await query.Skip((request.PageIndex - 1) * request.PageSize)
                .Take(request.PageSize).ToListAsync();

            //4. Select and projection

            var pagedResult = new PagedResult<Color>()
            {
                TotalRecords = totalRow,
                PageSize = request.PageSize,
                PageIndex = request.PageIndex,
                Items = data
            };
            return pagedResult;
        }
    }
}
