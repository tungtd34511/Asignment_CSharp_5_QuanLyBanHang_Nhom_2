
using Microsoft.AspNetCore.Http;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net.Http.Headers;
using System.Text;
using System.Threading.Tasks;
using App.API.Infrastructure.Utilities.Constants;
using App.API.Infrastructure.Utilities.Exceptions;
using App.API.Infrastructure.ViewModels.Catalog.ProductImages;
using App.API.Infrastructure.ViewModels.Catalog.Products;
using App.API.Infrastructure.ViewModels.Common;
using App.API.Services.Catalog.ProductVariations;
using App.API.Services.Common;
using Data.DbContext;
using Data.Entities;
using App.API.Infrastructure.ViewModels.Catalog.Oders;
using Data.Enums;
using App.API.Infrastructure.ViewModels.System.Languages;
using System.Security.Cryptography;

namespace App.API.Services.Catalog.Oders
{
    public class OderService : IOderService
    {
        private readonly QLBHContext _context;
        public OderService(QLBHContext context)
        {
            _context = context;
        }
        public async Task<int> Create(CreateOderReqquest request)
        {
            AppUser user = new();
            Guid UserId;
            if (request.UserId == null)
            {
                user = new AppUser { FirstName = request.FirstName, LastName = request.LastName, PhoneNumber = request.ShipPhoneNumber, Email = request.ShipEmail };
                _context.Users.Add(user);
                await _context.SaveChangesAsync();
            }
            var oder = new Order()
            {
                OrderDate = DateTime.Now,
                UserId = request.UserId != null ? (Guid)request.UserId : user.Id,
                Status = request.Status,
                ShipAddress = request.ShipAddress,
                ShipEmail = request.ShipEmail,
                ShipName = request.ShipName,
                ShipPhoneNumber = request.ShipPhoneNumber,// chưa làm nên mặc định là thành công
            };
            _context.Orders.Add(oder);
            await _context.SaveChangesAsync();
            foreach (var item in request.OrderDetails)
            {
                item.OrderId = oder.Id;
                _context.OrderDetails.Add(item);
            }

            await _context.SaveChangesAsync();
            return oder.Id;
        }
        public async Task<int> Update(UpdateOderRequest request)
        {
            var order = await _context.Orders.FindAsync(request.Id);

            if (order == null) throw new EShopException($"Cannot find a oder with id: {request.Id}");
            var oderdetails = _context.OrderDetails.Where(c => c.OrderId == request.Id);
            // remove oderdetail
            var listOderID = request.OrderDetails.Select(c => c.OrderId);
            foreach (var od in oderdetails)
            {
                if (!listOderID.Contains(od.OrderId))
                {
                    _context.OrderDetails.Remove(od);
                }
            }
            //UpdateOderDetail
            foreach (var item in request.OrderDetails)
            {
                _context.OrderDetails.Update(item);
            }
            order.ShipAddress = request.ShipAddress;
            order.ShipEmail = request.ShipEmail;
            order.ShipPhoneNumber = request.ShipPhoneNumber;
            order.ShipName = request.ShipName;
            order.OrderDate = request.OrderDate;
            order.UserId = request.UserId;
            order.Status = request.Status;

            //Save oder
            _context.Orders.Update(order);

            return await _context.SaveChangesAsync();
        }

        public async Task<int> Delete(int Id)
        {
            var order = await _context.Orders.FindAsync(Id);

            if (order == null) throw new EShopException($"Cannot find a oder with id: {Id}");
            var oderdetails = _context.OrderDetails.Where(c => c.OrderId == Id);
            // remove oderdetail
            foreach (var od in oderdetails)
            {
                _context.OrderDetails.Remove(od);
            }
            //REMOVE oder
            _context.Orders.Remove(order);
            return await _context.SaveChangesAsync();
        }
        public async Task<OderVm> GetById(int id, string languageId)
        {
            var oder = await _context.Orders.FindAsync(id);
            var user = await _context.Users.FindAsync(oder.UserId);
            var orderDetails = await (from o in _context.OrderDetails
                                      join pv in _context.ProductVariations on o.ProductVariationId equals pv.Id
                                      join c in _context.Colors on pv.ColorId equals c.Id
                                      join s in _context.Sizes on pv.SizeId equals s.Id
                                      join pt in _context.ProductTranslations on pv.ProductId equals pt.ProductId
                                      where pt.LanguageId == languageId && o.OrderId == oder.Id
                                      select new OderDetailVm
                                      {
                                          ProductId = pv.ProductId,
                                          Quantity = o.Quantity,
                                          ColorCode = c.HEXCode,
                                          SizeCode = s.Code,
                                          SizeId = s.Id,
                                          SizeName = s.Name,
                                          Stock = pv.Stock,
                                          ColorId = c.Id,
                                          ColorName = c.Name,
                                          OrderId = o.OrderId,
                                          Price = o.Price,
                                          ProductName = pt.Name,
                                          ProductVariationId = pv.Id,
                                      }).ToListAsync();
            var productViewModel = new OderVm()
            {
                OrderDate = oder.OrderDate,
                OrderDetails = orderDetails,
                Id = oder.Id,
                ShipAddress = oder.ShipAddress,
                ShipEmail = oder.ShipEmail,
                ShipName = oder.ShipName,
                ShipPhoneNumber = oder.ShipPhoneNumber,
                Status = oder.Status,
                UserId = user.Id,
                UserName = user.LastName,
            };
            return productViewModel;
        }


        public async Task<bool> UpdateStatus(UpdateOrderStatusRequest request)
        {
            var oder = await _context.Orders.FindAsync(request.orderId);
            oder.Status = request.status;
            if (oder == null) throw new EShopException($"Cannot find a oder with id: {request.orderId}");
            return await _context.SaveChangesAsync() > 0;
        }
        public async Task<PagedResult<OderVm>> GetAllPaging(GetOrdersRequest request)
        {
            //var qery1 = from od in _context.OrderDetails
            //            join pv in _context.ProductVariations on od.ProductVariationId equals pv.Id
            //            join c in _context.Colors on pv.ColorId equals c.Id
            //            join s in _context.Sizes on pv.SizeId equals s.Id
            //            join pt in _context.ProductTranslations on pv.ProductId equals pt.ProductId
            //            where pt.LanguageId == "vi"
            //            select new { odId = od.OrderId, od, pv, c, s, pt };
         
            //1. Select join
            var query = from o in _context.Orders
                        join user in _context.Users on o.UserId equals user.Id
                        select new { o,  user };

            //2. filter
            if (!string.IsNullOrEmpty(request.Keyword))
                query = query.Where(x => (x.user.LastName + x.user.FirstName).ToLower().Contains(request.Keyword.ToLower()) || x.o.ShipPhoneNumber.Contains(request.Keyword));

            //3. Paging
            int totalRow = await query.CountAsync();

            var data = await query.OrderBy(c=>c.o.Id).Skip((request.PageIndex - 1) * request.PageSize)
                .Take(request.PageSize)
                .Select(x => new OderVm()
                {
                    Id = x.o.Id,
                    ShipAddress = x.o.ShipAddress,
                    ShipEmail = x.o.ShipEmail,
                    ShipName = x.o.ShipName,
                    ShipPhoneNumber = x.o.ShipPhoneNumber,
                    Status = x.o.Status,
                    OrderDate = x.o.OrderDate,
                    UserId = x.o.UserId,
                    UserName = (x.user.FirstName + x.user.LastName),
                    //OrderDetails = qery1.Select(c=>new OderDetailVm()
                    //{
                    //    ProductVariationId = c.pv.Id,
                    //    SizeCode = c.s.Code,
                    //    SizeId = c.s.Id,
                    //    SizeName = c.s.Name,
                    //    Stock = c.pv.Stock,
                    //    ColorCode = c.c.HEXCode,
                    //    ColorId = c.c.Id,
                    //    ColorName = c.c.Name,
                    //    OrderId = c.od.OrderId,
                    //    Price = c.od.Price,
                    //    ProductId = c.pv.ProductId,
                    //    ProductName = c.pt.Name,
                    //    Quantity = c.od.Quantity
                    //}).ToList()
                }).ToListAsync();

            //4. Select and projection

            var pagedResult = new PagedResult<OderVm>()
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