using Microsoft.AspNetCore.Mvc;

namespace PolicyApp.Controllers
{
    public class PolicyController : Controller
    {
        [HttpGet]
        public IActionResult Index()
        {
            return View("Views/webapp/index.html");
        }
    }
}
