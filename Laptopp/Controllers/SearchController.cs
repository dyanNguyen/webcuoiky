using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Laptopp.Models;

namespace Laptopp.Controllers
{
    public class SearchController : Controller
    {
        DataClasses1DataContext db = new DataClasses1DataContext();
        public ActionResult Search(string strSearch)
        {

            ViewBag.Search = strSearch;
            if (!string.IsNullOrEmpty(strSearch))
            {

                var kq = from x in db.Games where x.Game_Name.Contains(strSearch) select x;
                return View(kq);
            }
            return View();
        }
        public ActionResult Group()
        {
            ///
            var kq = db.Games.GroupBy(x => x.Game_ID);
            return View(kq);
        }
        
    }
}