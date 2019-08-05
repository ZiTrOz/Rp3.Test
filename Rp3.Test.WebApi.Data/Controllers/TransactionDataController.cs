using Rp3.Test.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace Rp3.Test.WebApi.Data.Controllers
{
    public class TransactionDataController : ApiController
    {
        [HttpGet]
        public IHttpActionResult Get()
        {
            List<Rp3.Test.Common.Models.TransactionView> commonModel = new List<Common.Models.TransactionView>();

            using (DataService service = new DataService())
            {
                IEnumerable<Rp3.Test.Data.Models.Transaction>
                    dataModel = service.Transactions.Get(
                    includeProperties: "Category,TransactionType",
                    orderBy: p => p.OrderByDescending(o => o.RegisterDate));

                //Para incluir una condición, puede usar el primer parametro de Get
                /*
                 * Ejemplo
                 IEnumerable<Rp3.Test.Data.Models.Transaction>
                    dataModel = service.Transactions.Get(p=> p.TransactionId > 0
                    includeProperties: "Category,TransactionType",
                    orderBy: p => p.OrderByDescending(o => o.RegisterDate));

                 */

                commonModel = dataModel.Select(p => new Common.Models.TransactionView()
                {
                    CategoryId = p.CategoryId,
                    CategoryName = p.Category.Name,
                    Notes = p.Notes,
                    Amount = p.Amount,
                    RegisterDate = p.RegisterDate,
                    ShortDescription = p.ShortDescription,
                    TransactionId = p.TransactionId,
                    TransactionType = p.TransactionType.Name,
                    TransactionTypeId = p.TransactionTypeId
                }).ToList();
            }

            return Ok(commonModel);
        }
        [HttpGet]
        public IHttpActionResult GetById(int transactionId)
        {
            Rp3.Test.Common.Models.Transaction commonModel = null;
            using (DataService service = new DataService())
            {
                var model = service.Transactions.GetByID(transactionId);

                commonModel = new Common.Models.Transaction()
                {
                    TransactionId = model.TransactionId,
                    TransactionTypeId = model.TransactionTypeId,
                    CategoryId = model.CategoryId,
                    RegisterDate = model.RegisterDate,
                    ShortDescription = model.ShortDescription,
                    Amount = model.Amount,
                    Notes = model.Notes,
                    UserId = model.UserId,
                    DateUpdate = model.DateUpdate
                };
            }
            return Ok(commonModel);
        }
        [HttpGet]
        public IHttpActionResult GetByUserId(int UserId)
        {
            List<Rp3.Test.Common.Models.TransactionView> commonModel = new List<Common.Models.TransactionView>();
            using (DataService service = new DataService())
            {
                IEnumerable<Rp3.Test.Data.Models.Transaction>
                    dataModel = service.Transactions.Get(t => t.UserId == UserId,
                    includeProperties: "Category,TransactionType",
                    orderBy: p => p.OrderByDescending(o => o.RegisterDate));

                //Para incluir una condición, puede usar el primer parametro de Get
                /*
                 * Ejemplo
                 IEnumerable<Rp3.Test.Data.Models.Transaction>
                    dataModel = service.Transactions.Get(p=> p.TransactionId > 0
                    includeProperties: "Category,TransactionType",
                    orderBy: p => p.OrderByDescending(o => o.RegisterDate));

                 */

                commonModel = dataModel.Select(p => new Common.Models.TransactionView()
                {
                    CategoryId = p.CategoryId,
                    CategoryName = p.Category.Name,
                    Notes = p.Notes,
                    Amount = p.Amount,
                    RegisterDate = p.RegisterDate,
                    ShortDescription = p.ShortDescription,
                    TransactionId = p.TransactionId,
                    TransactionType = p.TransactionType.Name,
                    TransactionTypeId = p.TransactionTypeId
                }).ToList();

            }
            return Ok(commonModel);
        }

        [HttpPost]
        public IHttpActionResult Update(Rp3.Test.Common.Models.Transaction transaction)
        {
            using (DataService service = new DataService())
            {
                Rp3.Test.Data.Models.Transaction transactionModel = new Test.Data.Models.Transaction();
                transactionModel.RegisterDate = transaction.RegisterDate;
                transactionModel.Amount = transaction.Amount;
                transactionModel.Notes = transaction.Notes;
                transactionModel.TransactionTypeId = transaction.TransactionTypeId;
                transactionModel.CategoryId = transaction.CategoryId;
                transactionModel.TransactionId = transaction.TransactionId;
                transactionModel.ShortDescription = transaction.ShortDescription;
                transactionModel.DateUpdate = transaction.DateUpdate;
                transactionModel.UserId = transaction.UserId;

                service.Transactions.Update(transactionModel);
                service.SaveChanges();
            }

            return Ok(true);
        }

        public IHttpActionResult Insert(Rp3.Test.Common.Models.Transaction transaction)
        {
            //Complete the code
            using (DataService service = new DataService())
            {
                Rp3.Test.Data.Models.Transaction model = new Test.Data.Models.Transaction();
                model.TransactionId = service.Transactions.GetMaxValue<int>(p => p.TransactionId, 0) + 1;
                model.Amount = transaction.Amount;
                model.CategoryId = transaction.CategoryId;
                model.Notes = transaction.Notes;
                model.RegisterDate = transaction.RegisterDate;
                model.ShortDescription = transaction.ShortDescription;
                model.TransactionTypeId = transaction.TransactionTypeId;
                model.UserId = transaction.UserId;


                service.Transactions.Insert(model);
                service.SaveChanges();
            }

            return Ok(true);
        }

        public IHttpActionResult GetBalance(int UserId)
        {
            using (DataService service = new DataService())
            {
                var balance = service.Transactions.DataBase.SqlQuery<Rp3.Test.Data.Models.Balance>(string.Format("EXEC spBALANCE @userId = {0}", UserId)).ToList();
                return Ok(balance);
            }
        }

    }
}
