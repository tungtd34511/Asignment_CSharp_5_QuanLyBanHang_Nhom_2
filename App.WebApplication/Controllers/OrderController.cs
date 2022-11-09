using Microsoft.AspNetCore.Mvc;

namespace App.WebApplication.Controllers
{
    public class OrderController : BaseController
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
