using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace Rp3.Test.Mvc.Controllers
{
    public class UserController : Controller
    {

        public ActionResult Index()
        {
            Proxies.Proxy proxy = new Proxies.Proxy();

            var data = proxy.GetUsers();

            List<Rp3.Test.Mvc.Models.UserViewModel> model = new List<Models.UserViewModel>();

            foreach(var item in data)
            {
                model.Add(new Models.UserViewModel()
                {
                    PersonName = item.PersonName,
                    AccountNumber = item.AccountNumber,
                    RegisterDate = item.RegisterDate,      
                    UserId = item.UserId,
                    DateUpdate = item.DateUpdate
                });
            }
            
            return View(model);
        }

        public ActionResult Create()
        {            
            return View();
        }

        [HttpPost]
        public ActionResult Create(Rp3.Test.Mvc.Models.UserViewModel editModel)
        {
            Rp3.Test.Proxies.Proxy proxy = new Proxies.Proxy();

            Rp3.Test.Common.Models.User commonModel = new Common.Models.User();

            commonModel.PersonName = editModel.PersonName;
            commonModel.AccountNumber = editModel.AccountNumber;
            commonModel.RegisterDate = DateTime.Now;


            bool respondeOk = proxy.InsertUser(commonModel);

            if (respondeOk)
                return RedirectToAction("Index");
            else
                return View(editModel);
        }

        public ActionResult Edit(int? id)
        {
            Rp3.Test.Proxies.Proxy proxy = new Proxies.Proxy();

            Rp3.Test.Mvc.Models.UserEditModel editModel = new Models.UserEditModel();

            var commonModel = proxy.GetUserById(id);

            editModel.PersonName = commonModel.PersonName;
            editModel.AccountNumber = commonModel.AccountNumber;
            editModel.UserId = commonModel.UserId;
            editModel.RegisterDate = commonModel.RegisterDate;

            return View(editModel);
        }
        [HttpPost]
        public ActionResult Edit(Rp3.Test.Mvc.Models.UserEditModel editModel)
        {
            Rp3.Test.Proxies.Proxy proxy = new Proxies.Proxy();

            Rp3.Test.Common.Models.User commonModel = new Common.Models.User();

            commonModel.PersonName = editModel.PersonName;
            commonModel.AccountNumber = editModel.AccountNumber;
            commonModel.UserId = editModel.UserId;
            commonModel.RegisterDate = editModel.RegisterDate;
            commonModel.DateUpdate = DateTime.Now;


            bool respondeOk = proxy.UpdateUser(commonModel);

            if (respondeOk)
                return RedirectToAction("Index");
            else
                return View(editModel);
        }

        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Login(Rp3.Test.Mvc.Models.UserViewModel user)
        {
            string message = string.Empty;
            if(user.UserName != null && user.Password != null)
            {
                Rp3.Test.Proxies.Proxy proxy = new Proxies.Proxy();
                Rp3.Test.Common.Models.User commonModel = new Common.Models.User();
                commonModel.UserName = user.UserName;
                commonModel.Password = user.Password;
                commonModel = proxy.LoginUser(commonModel);
                if (commonModel != null)
                {
                    Session["UserId"] = commonModel.UserId.ToString();
                    Session["UserName"] = commonModel.UserName.ToString();
                    FormsAuthentication.SetAuthCookie(commonModel.UserName, true);
                    if (!string.IsNullOrEmpty(Request.Form["ReturnUrl"]))
                    {
                        return RedirectToAction(Request.Form["ReturnUrl"].Split('/')[2]);
                    }
                    else
                    {
                        return RedirectToAction("Index", "Home");
                    }
                }
                else
                {
                    message = "Username and/or password is incorrect.";
                }
            }
            else
            {
                message = "Username and/or password is incorrect.";
            }

            ViewBag.Message = message;
            return View(user);
        }

        [HttpGet]
        public ActionResult Logout()
        {
            FormsAuthentication.SignOut();
            Session["UserId"] = null;
            Session["UserName"] = null;
            return RedirectToAction("Login");
        }

    }
}
