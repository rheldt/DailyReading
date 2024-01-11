using System.Web.Mvc;

namespace DailyReading.Web.Controllers
{
    public class EmailController : Controller
    {
        public ActionResult Send()
        {
            return Content("Process complete.");
        }
    }
}