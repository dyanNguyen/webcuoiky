using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Laptopp.Models;
using PagedList;
using PagedList.Mvc;
using System.IO;

namespace Laptopp.Areas.Admin.Views.Admin
{
    public class SanPhamController : Controller
    {
        DataClasses1DataContext db = new DataClasses1DataContext();
        // GET: Admin/Lap
        public ActionResult Index(int? page)
        {
            int iPageNum = (page ?? 1);
            int iPageSize = 7;
            return View(db.Games.ToList().OrderBy(n => n.Game_ID).ToPagedList(iPageNum, iPageSize));
        }
        [HttpGet]
        public ActionResult Create()
        {
            ViewBag.Game_ID = new SelectList(db.Games.ToList().OrderBy(n => n.Game_Name), "Game_ID", "Game_Name");
            ViewBag.idLoaiGame = new SelectList(db.TheLoaiGames.ToList().OrderBy(n => n.TenLoaiGame), "idLoaiGame", "TenLoaiGame");
            return View();
        }

        [ValidateInput(false)]
        public ActionResult Create(Game game, FormCollection f, HttpPostedFileBase fFileUpload)
        {

            if (fFileUpload == null)
            {
                ViewBag.ThongBao = "Hãy chọn ảnh bìa.";
                ViewBag.Game_Name = f["lGame_Name"];
                ViewBag.MoTa = f["lMoTa"];
                ViewBag.Quantity = int.Parse(f["Quantity"]);
                ViewBag.Price = decimal.Parse(f["mPrice"]);
                return View();
            }
            else
            {
                if (ModelState.IsValid)
                {
                    var sFileName = Path.GetFileName(fFileUpload.FileName);
                    var path = Path.Combine(Server.MapPath("~/Images"), sFileName);
                    if (!System.IO.File.Exists(path))
                    {
                        fFileUpload.SaveAs(path);
                    }
                    game.Game_Name = f["lGame_Name"];
                    //Game.MoTa = f["lMoTa"].Replace("<p>", "").Replace("</p>", "\n");
                    //Game.AnhBia = sFileName;                   
                    game.Quantity = int.Parse(f["Quantity"]);
                    game.Price = double.Parse(f["mPrice"]);
                    db.Games.InsertOnSubmit(game);
                    db.SubmitChanges();
                    return RedirectToAction("Index");

                }
                return View();
            }

        }
        public ActionResult Details(int id)
        {
            var Game = db.Games.SingleOrDefault(n => n.Game_ID == id);
            if (Game == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(Game);
        }
        [HttpGet]
        public ActionResult Delete(int id)
        {
            var Game = db.Games.SingleOrDefault(n => n.Game_ID == id);
            if (Game == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(Game);
        }
        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirm(int id, FormCollection f)
        {
            var Game = db.Games.SingleOrDefault(n => n.Game_ID == id);

            if (Game == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            var ctdh = db.OrderDetails.Where(ct => ct.Game_ID == id);
            if (ctdh.Count() > 0)
            {

                ViewBag.ThongBao = "Sản phẩm này đang có trong bảng Chi tiết đặt hàng <br>" + " Nếu muốn xóa thì phải xóa hết mã sản phẩm này trong bảng Chi tiết đặt hàng";
                return View(Game);
            }
            db.Games.DeleteOnSubmit(Game);
            db.SubmitChanges();
            return RedirectToAction("Index");
        }

        [HttpGet]
        public ActionResult Edit(int id)
        {
            var Game = db.Games.SingleOrDefault(n => n.Game_ID == id);
            if (Game == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(Game);
        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Edit(FormCollection f, HttpPostedFileBase fFileUpload)
        {
            var Game = db.Games.SingleOrDefault(n => n.Game_ID == Convert.ToInt32(f["GameID"]));
            if (ModelState.IsValid)
            {
                if (fFileUpload != null) //Kiểm tra để xác nhận cho thay đổi ảnh bìa
                {
                    //Lấy tên file (Khai báo thư viện: System.IO)
                    var sFileName = Path.GetFileName(fFileUpload.FileName);
                    //Lấy đường dẫn lưu file
                    var path = Path.Combine(Server.MapPath("~/Images"), sFileName);
                    //Kiểm tra file đã tồn tại chưa
                    if (!System.IO.File.Exists(path))
                    {
                        fFileUpload.SaveAs(path);
                    }

                    //Game.AnhBia = sFileName;
                }
                //Lưu Game vào CSDL
                Game.Game_Name = f["Game_Name"];
                //Game.MoTa = f["sMoTa"].Replace("<p>", "").Replace("</p>", "\n");
                Game.Quantity = int.Parse(f["Quantity"]);
                Game.Price = double.Parse(f["mPrice"]);
                db.SubmitChanges();
                //Về lại trang Quản lý sách
                return RedirectToAction("Index");
            }
            return View(Game);
        }


    }
}