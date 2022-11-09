using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using App.API.Infrastructure.ViewModels.Utilities.Slides;
using App.API.Services.Utilities.Slides;
using Data.DbContext;

namespace App.API.Services.Utilities.Slides
{
    public class SlideService : ISlideService
    {
        private readonly QLBHContext _context;

        public SlideService(QLBHContext context)
        {
            _context = context;
        }

        public async Task<List<SlideVm>> GetAll()
        {
            var slides = await _context.Slides.OrderBy(x => x.SortOrder)
                .Select(x => new SlideVm()
                {
                    Id = x.Id,
                    Name = x.Name,
                    Description = x.Description,
                    Url = x.Url,
                    Image = x.Image
                }).ToListAsync();

            return slides;
        }
    }
}