using App.API.Infrastructure.ViewModels.Catalog.Contacts;
using App.WebApplication.IServices;
using Data.Entities;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using MVC.Helper;

namespace App.WebApplication.Controllers
{
    public class ContactController : Controller
    {
        IContactApiClien _contactApiClien;
        CallApi _Helper;

        public ContactController(IContactApiClien contactApiClien)
        {
            _contactApiClien = contactApiClien;
        }
        [Authorize(Roles = "admin,nhanvien")]
        public async Task<IActionResult> Index()
        {
            ViewData["lst"] = await _contactApiClien.GetAll();
            if (TempData["res"] != null)
            {
                ViewBag.message = TempData["res"];
            }
            return View();
        }
        [Authorize(Roles = "admin,nhanvien")]
        public async Task<IActionResult> Add(ContactAddRequest contactsViewModel)
        {
            if (ModelState.IsValid)
            {
                if (await _contactApiClien.Add(contactsViewModel))
                {
                    TempData["res"] = "thành công";
                    return RedirectToAction("Index");
                }
            }


            TempData["res"] = "thất bại";
            return RedirectToAction("Index");
        }
        [Authorize(Roles = "admin,nhanvien")]
        [Route("/Contact/Delete/{id}")]
        public async Task<IActionResult> Delete(int id)
        {
            if (await _contactApiClien.Delete(id))
            {
                TempData["res"] = "thành công";
                return RedirectToAction("Index");
            }

            TempData["res"] = "thất bại";
            return RedirectToAction("Index");
        }
        [Authorize(Roles = "admin,nhanvien")]
        [HttpGet]
        [Route("/Contact/Edit/{id}")]
        public async Task<IActionResult> Edit(int id)
        {
            var contact = await _contactApiClien.GetById(id);
            ContactEditRequest request = new ContactEditRequest()
            {
                Id = contact.Id,
                Name = contact.Name,
                Email = contact.Email,
                PhoneNumber = contact.PhoneNumber,
                Message = contact.Message,
            };

            return View(request);
        }
        [Authorize(Roles = "admin,nhanvien")]
        [HttpPost]
        public async Task<IActionResult> Edit(ContactEditRequest contact)
        {
            if (ModelState.IsValid)
            {
                if (await _contactApiClien.Edit(contact.Id,contact))
                {
                    TempData["res"] = "thành công";
                    return RedirectToAction("Index");
                }
            }


            TempData["res"] = "thất bại";
            return RedirectToAction("Index");
        }
    }
}
