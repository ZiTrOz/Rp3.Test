using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;

namespace Rp3.Test.Mvc.Controllers
{
    public class TransactionController : Controller
    {

        public ActionResult Index()
        {
            return View();
            //Proxies.Proxy proxy = new Proxies.Proxy();

            //if(Session["UserId"] != null)
            //{
            //    var userId = int.Parse(Session["UserId"].ToString());
            //    var data = proxy.GetTransactionsByUser(userId);

            //    List<Rp3.Test.Mvc.Models.TransactionViewModel> model = new List<Models.TransactionViewModel>();

            //    foreach (var item in data)
            //    {
            //        model.Add(new Models.TransactionViewModel()
            //        {
            //            Amount = item.Amount,
            //            CategoryId = item.CategoryId,
            //            CategoryName = item.CategoryName,
            //            Notes = item.Notes,
            //            RegisterDate = item.RegisterDate,
            //            ShortDescription = item.ShortDescription,
            //            TransactionId = item.TransactionId,
            //            TransactionType = item.TransactionType,
            //            TransactionTypeId = item.TransactionTypeId
            //        });
            //    }

            //    return View(model);
            //}
            //else
            //{
            //    return RedirectToAction("Login", "User");
            //}
            
        }

        public ActionResult GetByUserId()
        {
            Proxies.Proxy proxy = new Proxies.Proxy();
            var userId = int.Parse(Session["UserId"].ToString());
            var data = proxy.GetTransactionsByUser(userId);

            List<Rp3.Test.Mvc.Models.TransactionViewModel> model = new List<Models.TransactionViewModel>();

            foreach (var item in data)
            {
                model.Add(new Models.TransactionViewModel()
                {
                    Amount = item.Amount,
                    CategoryId = item.CategoryId,
                    CategoryName = item.CategoryName,
                    Notes = item.Notes,
                    RegisterDate = item.RegisterDate,
                    ShortDescription = item.ShortDescription,
                    TransactionId = item.TransactionId,
                    TransactionType = item.TransactionType,
                    TransactionTypeId = item.TransactionTypeId
                });
            }

            return Json(model, JsonRequestBehavior.AllowGet);
        }

        public ActionResult GetById(int id)
        {
            Proxies.Proxy proxy = new Proxies.Proxy();
            var data = proxy.GetTransactionById(id);
           

            return Json(data, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public ActionResult Store()
        {
            var _t = Request.Params["transaction"];
            var editModel = JsonConvert.DeserializeObject<Rp3.Test.Mvc.Models.TransactionViewModel>(_t);
            Rp3.Test.Proxies.Proxy proxy = new Proxies.Proxy();

            Rp3.Test.Common.Models.Transaction commonModel = new Common.Models.Transaction();

            var userId = int.Parse(Session["UserId"].ToString());

            commonModel.Amount = editModel.Amount;
            commonModel.CategoryId = editModel.CategoryId;
            commonModel.Notes = editModel.Notes;
            commonModel.ShortDescription = editModel.ShortDescription;
            commonModel.TransactionTypeId = editModel.TransactionTypeId;
            commonModel.UserId = userId;
            commonModel.RegisterDate = DateTime.Now;

            bool respondeOk = proxy.InsertTransaction(commonModel);
            if (respondeOk)
            {
                var data = proxy.GetTransactionsByUser(userId);

                List<Rp3.Test.Mvc.Models.TransactionViewModel> model = new List<Models.TransactionViewModel>();

                foreach (var item in data)
                {
                    model.Add(new Models.TransactionViewModel()
                    {
                        Amount = item.Amount,
                        CategoryId = item.CategoryId,
                        CategoryName = item.CategoryName,
                        Notes = item.Notes,
                        RegisterDate = item.RegisterDate,
                        ShortDescription = item.ShortDescription,
                        TransactionId = item.TransactionId,
                        TransactionType = item.TransactionType,
                        TransactionTypeId = item.TransactionTypeId
                    });
                }

                return Json(model, JsonRequestBehavior.AllowGet);
            }
            else
            {
                Response.StatusCode = 500;
                return Json("ERROR", JsonRequestBehavior.AllowGet);
            }
        }
        [HttpPost]
        public ActionResult EditTran()
        {
            var _t = Request.Params["transaction"];
            var editModel = JsonConvert.DeserializeObject<Rp3.Test.Mvc.Models.TransactionEditModel>(_t);
            Rp3.Test.Proxies.Proxy proxy = new Proxies.Proxy();

            Rp3.Test.Common.Models.Transaction commonModel = new Common.Models.Transaction();

            commonModel.RegisterDate = editModel.RegisterDate;
            commonModel.Amount = editModel.Amount;
            commonModel.Notes = editModel.Notes;
            commonModel.TransactionTypeId = editModel.TransactionTypeId;
            commonModel.CategoryId = editModel.CategoryId;
            commonModel.TransactionId = editModel.TransactionId;
            commonModel.ShortDescription = editModel.ShortDescription;
            commonModel.UserId = editModel.UserId;
            commonModel.DateUpdate = DateTime.Now;


            bool respondeOk = proxy.UpdateTransaction(commonModel);
            if (respondeOk)
            {
                var userId = int.Parse(Session["UserId"].ToString());
                var data = proxy.GetTransactionsByUser(userId);

                List<Rp3.Test.Mvc.Models.TransactionViewModel> model = new List<Models.TransactionViewModel>();

                foreach (var item in data)
                {
                    model.Add(new Models.TransactionViewModel()
                    {
                        Amount = item.Amount,
                        CategoryId = item.CategoryId,
                        CategoryName = item.CategoryName,
                        Notes = item.Notes,
                        RegisterDate = item.RegisterDate,
                        ShortDescription = item.ShortDescription,
                        TransactionId = item.TransactionId,
                        TransactionType = item.TransactionType,
                        TransactionTypeId = item.TransactionTypeId
                    });
                }

                return Json(model, JsonRequestBehavior.AllowGet);
            }
            else
            {
                Response.StatusCode = 500;
                return Json("ERROR", JsonRequestBehavior.AllowGet);
            }
        }

        public ActionResult Balance()
        {
            //var userId = int.Parse(Session["UserId"].ToString());
            //Rp3.Test.Proxies.Proxy proxy = new Proxies.Proxy();
            //var balance = proxy.GetBalance(userId);
            return View();
        }

        public ActionResult GetBalance()
        {
            var userId = int.Parse(Session["UserId"].ToString());
            Rp3.Test.Proxies.Proxy proxy = new Proxies.Proxy();
            var balance = proxy.GetBalance(userId);
            return Json(balance, JsonRequestBehavior.AllowGet);
        }


    }
}
