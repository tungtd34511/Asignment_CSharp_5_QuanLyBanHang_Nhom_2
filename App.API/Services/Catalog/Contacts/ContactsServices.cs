using App.API.Infrastructure.ViewModels.Catalog.Contacts;
using Data.DbContext;
using Data.Entities;

namespace App.API.Services.Catalog.Contacts
{
    public class ContactsServices : IContactsServices
    {
        private readonly QLBHContext _db;

        public ContactsServices(QLBHContext db)
        {
            _db = db;
        }

        public async Task<bool> Add(ContactAddRequest contacts)
        {
            if (contacts == null) return false;

            var ct = new Contact()
            {
                Name = contacts.Name,
                Email = contacts.Email,
                PhoneNumber = contacts.PhoneNumber,
                Message = contacts.Message,
            };

            _db.Contacts.Add(ct);
            _db.SaveChanges();
            return true;
        }

        public async Task<bool> Delete(int id)
        {
            var ct = _db.Contacts.FirstOrDefault(c => c.Id == id);

            if (ct == null) return false;

            _db.Contacts.Remove(ct);
            _db.SaveChanges();
            return true;
        }

        public async Task<bool> Edit(Contact contacts)
        {
            if (contacts == null) return false;

            _db.Contacts.Update(contacts);
            _db.SaveChanges();
            return true;
        }

        public async Task<List<Contact>>  GetAll()
        {
            return _db.Contacts.ToList();
        }

        public async Task<Contact>  GetById(int id)
        {
            return _db.Contacts.FirstOrDefault(c => c.Id == id);
        }
    }
}
