using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using System.Linq;
using App.API.Infrastructure.ViewModels.Catalog.Categories;
using Data.DbContext;
using Microsoft.EntityFrameworkCore;
using Data.Entities;
using App.API.Infrastructure.ViewModels.Common;

namespace App.API.Services.Catalog.Categories
{
    public class CategoryService : ICategoryService
    {
        private readonly QLBHContext _context;

        public CategoryService(QLBHContext context)
        {
            _context = context;
        }

        public async Task<List<CategoryVm>> GetAll(string languageId)
        {
            var query = from c in _context.Categories
                        join ct in _context.CategoryTranslations on c.Id equals ct.CategoryId
                        where ct.LanguageId == languageId
                        select new { c, ct };
            return await query.Select(x => new CategoryVm()
            {
                Id = x.c.Id,
                Name = x.ct.Name,
                ParentId = x.c.ParentId
            }).ToListAsync();
        }

        public async Task<CategoryVm> GetById(string languageId, int id)
        {
            var query = from c in _context.Categories
                        join ct in _context.CategoryTranslations on c.Id equals ct.CategoryId
                        where ct.LanguageId == languageId && c.Id == id
                        select new { c, ct };
            return await query.Select(x => new CategoryVm()
            {
                Id = x.c.Id,
                Name = x.ct.Name,
                ParentId = x.c.ParentId
            }).FirstOrDefaultAsync();
        }

        public async Task<int> Create(CreateCatergoryRequest request)
        {
            var cart = new Category()
            {
                IsShowOnHome = request.IsShowOnHome,
                SortOrder = request.SortOrder,
                Status = request.Status,
                ParentId = request.ParentId,
            };
            var carttl = new CategoryTranslation()
            {
                LanguageId = "vi",
                Name = request.Name,
                SeoAlias = request.SeoAlias,
                SeoDescription = request.SeoDescription,
                SeoTitle = request.SeoTitle,
                Category = cart
            };
            _context.CategoryTranslations.Add(carttl);
            return await _context.SaveChangesAsync();
        }

        public async Task<PagedResult<CatergoryVMinAdmin>> GetPaging(GetPagingCategoryRequest request)
        {
            var query = from c in _context.Categories
                        join ct in _context.CategoryTranslations.Where(c=>c.LanguageId =="vi") on c.Id equals ct.CategoryId
                        join pc in _context.Categories on c.ParentId equals pc.Id into g
                        from pc in g.DefaultIfEmpty()
                        join pct in _context.CategoryTranslations.Where(c => c.LanguageId == "vi") on pc.Id equals pct.CategoryId into g2
                        from pct in g2.DefaultIfEmpty()
                        select new { c, ct ,pc, pct };

            if (!String.IsNullOrEmpty(request.Keyword))
            {
                query = query.Where(c => c.ct.Name.ToLower().Contains(request.Keyword.ToLower()));
            }
            var totalrow = await query.CountAsync();

            var data = await query.Skip((request.PageIndex - 1) * request.PageSize)
                .Take(request.PageSize).
                Select(c=>new CatergoryVMinAdmin
                {
                    Id = c.c.Id,
                    IsShowOnHome = c.c.IsShowOnHome,
                    LanguageId = "vi",
                    Name = c.ct.Name,
                    ParentId = c.c.ParentId,
                    ParentName = c.pct.Name,
                    SeoAlias = c.ct.SeoAlias,
                    SeoDescription = c.ct.SeoDescription,
                    SeoTitle = c.ct.SeoTitle,
                    SortOrder = c.c.SortOrder,
                    Status = c.c.Status,
                    TranLasteId = c.ct.Id
                }).ToListAsync();

            //4. Select and projection

            var pagedResult = new PagedResult<CatergoryVMinAdmin>()
            {
                TotalRecords = totalrow,
                PageSize = request.PageSize,
                PageIndex = request.PageIndex,
                Items = data
            };
            return pagedResult;
        }
    }
}