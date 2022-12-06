using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Laptopp.Models;

namespace Laptopp.Controllers
{
    public class GioHangController : Controller
    {
        DataClasses1DataContext db = new DataClasses1DataContext();
        // GET: GioHang
        public List<GioHang> LayGioHang()
        {
            List<GioHang> lstGioHang = Session["GioHang"] as List<GioHang>;
            if (lstGioHang == null)
            {
                //Khởi tạo giỏ hàng ( giỏ hàng chưa tồn tại )
                lstGioHang = new List<GioHang>();
                Session["GioHang"] = lstGioHang;
            }
            return lstGioHang;
        }
        public ActionResult ThemGioHang(int ml, string url)
        {
            //Lấy giỏ hiện tại
            List<GioHang> lstGioHang = LayGioHang();
            //Kiểm tra nếu sản phẩm chưa có trong giỏ thì thêm vào, nếu đã có thì tăng số lượng
            GioHang sp = lstGioHang.Find(n => n.GameID == ml);
            if (sp == null)
            {
                sp = new GioHang(ml);
                lstGioHang.Add(sp);
            }
            else
            {
                sp.Quantity++;
            }
            return Redirect(url);
        }
        //Tính số lượng
        private int TongSoLuong()
        {
            int iTongSoLuong = 0;
            List<GioHang> lstGioHang = Session["GioHang"] as List<GioHang>;
            if (lstGioHang != null)
            {
                iTongSoLuong = lstGioHang.Sum(n => n.Quantity);
            }
            return iTongSoLuong;

        }
        //Tính tổng tiền
        private double TongTien()
        {
            double dTongTien = 0;
            List<GioHang> lstGioHang = Session["GioHang"] as List<GioHang>;
            if (lstGioHang != null)
            {
                dTongTien = lstGioHang.Sum(n => n.dThanhTien);
            }
            return dTongTien;
        }
        //Action trả về view GioHang
        public ActionResult GioHang()
        {
            List<GioHang> lstGioHang = LayGioHang();
            if (lstGioHang.Count == 0)
            {
                return RedirectToAction("Index", "Laptop");
            }
            ViewBag.TongSoLuong = TongSoLuong();
            ViewBag.TongTien = TongTien();
            return View(lstGioHang);
        }
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult GioHangPartial()
        {
            ViewBag.TongSoLuong = TongSoLuong();
            ViewBag.TongTien = TongTien();
            return PartialView();
        }
        public ActionResult XoaSPKhoiGioHang(int gameID)
        {
            List<GioHang> lstgioHang = LayGioHang();

            GioHang sp = lstgioHang.SingleOrDefault(n => n.GameID == gameID);

            if (sp != null)
            {
                lstgioHang.RemoveAll(n => n.GameID == gameID);
                if (lstgioHang.Count == 0)
                {
                    return RedirectToAction("Index", "Laptop");
                }
            }
            return RedirectToAction("GioHang");
        }
        public ActionResult CapNhatGioHang(int gameID, FormCollection f)
        {
            List<GioHang> lstGioHang = LayGioHang();
            GioHang sp = lstGioHang.SingleOrDefault(n => n.GameID == gameID);

            if (sp != null)
            {
                sp.Quantity = int.Parse(f["txtSoLuong"].ToString());
            }
            return RedirectToAction("GioHang");
        }
        public ActionResult XoaGioHang()
        {
            List<GioHang> lstGioHang = LayGioHang();
            lstGioHang.Clear();
            return RedirectToAction("Index", "Laptop");
        }
        [HttpGet]
        public ActionResult DatHang()
        {
            //Check đn yes or no
            if (Session["TaiKhoan"] == null || Session["TaiKhoan"].ToString() == "")
            {
                return Redirect("~/User/DangNhap?id=2");
            }
            //Check có sp trong giỏ ko
            if (Session["GioHang"] == null)
            {
                return RedirectToAction("Index", "Laptop");
            }
            //Lấy hàng từ Session
            List<GioHang> lstGioHang = LayGioHang();
            ViewBag.TongSoLuong = TongSoLuong();
            ViewBag.TongTien = TongTien();
            return View(lstGioHang);
        }
        [HttpPost]
        public ActionResult DatHang(FormCollection f)
        {
            //Thêm đơn hàng
            ThanhToan ddh = new ThanhToan();
            NguoiDung kh = (NguoiDung)Session["TaiKhoan"];
            List<GioHang> lstGioHang = LayGioHang();
            ddh.CustID = kh.CustID;          
            ddh.DaThanhToan = false;
            //db.ThanhToans.InsertOnSubmit(ddh);
            //db.SubmitChanges();
            //Thêm chi tiết đơn hàng
            foreach (var item in lstGioHang)
            {
                OrderDetail ctdh = new OrderDetail();
                ctdh.Order_ID = ddh.Order_ID;
                ctdh.Game_ID = Convert.ToInt32(item.GameID);
                ctdh.Price = item.Price;
                //db.OrderDetails.InsertOnSubmit(ctdh);
            }
            //db.SubmitChanges();
            Session["GioHang"] = null;
            return RedirectToAction("XacNhanDonHang", "GioHang");
        }
        public ActionResult XacNhanDonHang()
        {
            return View();
        }
        public ActionResult XoaMotSanPham(int gameID)
        {
            List<GioHang> GioHang = Session["GioHang"] as List<GioHang>;
            GioHang itemXoa = GioHang.FirstOrDefault(m => m.GameID == gameID);
            if (itemXoa!=null)
            {
                GioHang.Remove(itemXoa);
            }
            return RedirectToAction("GioHang", "GioHang");
        }
    }
}