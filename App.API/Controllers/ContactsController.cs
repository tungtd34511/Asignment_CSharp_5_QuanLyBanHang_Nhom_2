using App.API.Infrastructure.ViewModels.Catalog.Contacts;
using App.API.Services.Catalog.Contacts;
using Data.DbContext;
using Data.Entities;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace App.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ContactsController : ControllerBase
    {
        private readonly IContactsServices _contactsServices;

        public ContactsController(IContactsServices contactsServices)
        {
            _contactsServices = contactsServices;
        }

        [HttpGet]
        public async Task<List<Contact>> GetAll()
        {
            return await _contactsServices.GetAll();
        }

        [HttpGet("{id}")]
        public async Task<Contact> GetById(int id)
        {
            return await _contactsServices.GetById(id);
        }

        [HttpPost]
        public async Task<IActionResult> Add(ContactAddRequest contacts)
        {
            if (await _contactsServices.Add(contacts)) return Ok(contacts);
            return BadRequest();
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> Edit(int id,ContactEditRequest contacts)
        {
            var ct = new Contact()
            {
                Id = id,
                Name = contacts.Name,
                Email = contacts.Email,
                PhoneNumber = contacts.PhoneNumber,
                Message = contacts.Message,
            };

            if (await _contactsServices.Edit(ct)) return Ok(ct);
            return BadRequest();
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete(int id)
        {
            if (await _contactsServices.Delete(id)) return Ok();
            return BadRequest();
        }
    }
}
