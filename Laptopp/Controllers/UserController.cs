using Laptopp.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;


namespace Laptopp.Controllers
{
    public class UserController : Controller
    {
        // GET: User
        DataClasses1DataContext db = new DataClasses1DataContext();
        public ActionResult Index()
        {
            return View();
        }

        [HttpGet]
        public ActionResult DangNhap()
        {
            return View();
        }
        [HttpPost]
        public ActionResult DangNhap(FormCollection collection)
        {

            var sTenDN = collection["TenDN"];
            var sMatKhau = collection["Password"];
            if (string.IsNullOrEmpty(sTenDN))
            {
                ViewData["Err1"] = "Bạn chưa nhập tên đăng nhập";
            }
            else if (string.IsNullOrEmpty(sMatKhau))
            {
                ViewData["Err2"] = "Phải nhập mật khẩu";
            }
            else
            {
                NguoiDung kh = db.NguoiDungs.SingleOrDefault(n => n.UserName == sTenDN && n.Password == sMatKhau);
                if (kh != null)
                {
                    ViewBag.ThongBao = "Chúc mừng đăng nhập thành công";
                    Session["Taikhoan"] = kh;
                    return RedirectToAction("Index", "Laptop");
                }
                else
                {
                    ViewBag.ThongBao = "Tên đăng nhập hoặc mật khẩu không đúng";
                }
            }
            return View();
        }

        [HttpGet]
        public ActionResult DangKy()
        {
            return View();
        }

        [HttpPost]
        public ActionResult DangKy(FormCollection f, NguoiDung kh)
        {
            //Gan cac gia tri nguoi dung nhap du lieu cho cac bien
            var sUserName = f["TaiKhoan"];
            var sMatKhau = f["Password"];
            var sMatKhauNhapLai = f["MatKhauNL"];
            var sAddress = f["Address"];
            var sEmail = f["Email"];
            var sPhone = f["Phone"];          
            if (String.IsNullOrEmpty(sMatKhauNhapLai))
            {
                ViewData["err4"] = "Phải nhập lại mật khẩu";
            }
            else if (sMatKhau != sMatKhauNhapLai)
            {
                ViewData["err4"] = "Mật khẩu nhập lại không khớp";
            }
            else if (db.NguoiDungs.SingleOrDefault(n => n.UserName == sUserName) != null)
            {
                ViewBag.ThongBao = "Tên đăng nhập đã tồn tại";
            }
            else if (db.NguoiDungs.SingleOrDefault(n => n.Email == sEmail) != null)
            {
                ViewBag.ThongBao = "Email đã được sử dụng";
            }
            else if (ModelState.IsValid)
            {
                //Gán giá trị cho đối tượng được tạo mới (kh)
                
                kh.UserName = sUserName;
                kh.Password = sMatKhau;
                kh.Email = sEmail;
                kh.Address = sAddress;
                kh.Phone = sPhone;
                kh.Cust_Balance = 0;
                db.NguoiDungs.InsertOnSubmit(kh);
                db.SubmitChanges();
                return RedirectToAction("DangNhap");
            }
            return this.DangKy();
        }
        public ActionResult DangXuat()
        {
            Session["TaiKhoan"] = null;
            Session.Abandon();
            return RedirectToAction("Index", "Laptop");
        }
    }
}