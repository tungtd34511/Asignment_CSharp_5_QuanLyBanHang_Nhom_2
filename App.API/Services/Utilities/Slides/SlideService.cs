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
using Data.Entities;

namespace App.API.Services.Utilities.Slides
{
    public class SlideService : ISlideService
    {
        private readonly QLBHContext _db;

        public SlideService(QLBHContext db)
        {
            _db = db;
        }

        public async Task<bool> Add(SlideAddRequest request)
        {
            if (request == null) return true;

            var slide = new Slide()
            {
                Name = request.Name,
                Description = request.Description,
                Image = request.Image,
                Url = request.Url,
                SortOrder = request.SortOrder,
                Status = Data.Enums.Status.Active,
            };

            try
            {
                _db.Slides.Add(slide);
                _db.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public async Task<bool> Delete(int id)
        {
            var slide = _db.Slides.FirstOrDefault(c => c.Id == id);

            if (slide == null) return false;

            try
            {
                _db.Slides.Remove(slide);
                _db.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public async Task<bool> Edit(int id, SlideEditRequest request)
        {
            if (request == null) return true;

            var slide = new Slide()
            {
                Id = id,
                Name = request.Name,
                Description = request.Description,
                Image = request.Image,
                Url = request.Url,
                SortOrder = request.SortOrder,
                Status = Data.Enums.Status.Active,
            };

            try
            {
                _db.Slides.Update(slide);
                _db.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public async Task<List<Slide>> GetAll()
        {
            return _db.Slides.ToList(); ;
        }

        public async Task<Slide> GetById(int id)
        {
            return _db.Slides.FirstOrDefault(c => c.Id == id);
        }
    }
}