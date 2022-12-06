using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Laptopp.Models;
using PagedList;
using PagedList.Mvc;

namespace Laptopp.Controllers
{
    public class LaptopController : Controller
    {
        DataClasses1DataContext data = new DataClasses1DataContext();
        private List<Game> LayLapMoi()
        {
            return data.Games.OrderByDescending(a => a.Game_Name).Take(6).ToList();
        }
        // GET: Laptop
        public ActionResult Index()
        {
            var listLapMoi = data.Games.OrderByDescending(a => a.Game_Name).Take(6).ToList();
            return View(listLapMoi);
        }
          
        public ActionResult LapBanNhieuPartial()
        {
            var listLapBanNhieu = data.Games.OrderByDescending(a => a.Game_Name).Take(6).ToList();
            return PartialView(listLapBanNhieu);
        }
        public ActionResult TheLoaiPartial()
        {
            var listTheLoai = from th in data.TheLoaiGames select th;
            return PartialView(listTheLoai);
        }

        public ActionResult GameTheoTheLoai(int iMaTL, int? page)
        {
            ViewBag.idLoaiGame = iMaTL;
            int iSize = 3;
            int iPageNum = (page ?? 1);
            var lap = from l in data.Games where l.idLoaiGame == iMaTL select l;
            return View(lap.ToPagedList(iPageNum, iSize));
        }

        public ActionResult ChiTietLap(int id)
        {
            var Game = from s in data.Games where s.Game_ID == id select s;
            return View(Game.Single());
        }
        public ActionResult LoginLogout()
        {
            return PartialView("LoginLogoutPartial");
        }
        public ActionResult GioiThieu()
        {
            return View();
        }
        public ActionResult _NavbarPartial()
        {
            //var listThuongHieu = from cd in data.THUONGHIEUs select cd;
            //return PartialView(listThuongHieu);
            return PartialView();

        }
    }
}