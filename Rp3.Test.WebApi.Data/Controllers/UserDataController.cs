using Rp3.Test.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace Rp3.Test.WebApi.Data.Controllers
{
    public class UserDataController : ApiController
    {
        [HttpGet]
        public IHttpActionResult Get()
        {            
            List<Rp3.Test.Common.Models.User> commonModel = new List<Common.Models.User>();

            using (DataService service = new DataService())
            {
                IEnumerable<Rp3.Test.Data.Models.User> 
                    dataModel = service.Users.Get(orderBy: p=> p.OrderByDescending(o=>o.PersonName) );

                //Para incluir una condición, puede usar el primer parametro de Get
                /*
                 * Ejemplo
                 IEnumerable<Rp3.Test.Data.Models.Transaction>
                    dataModel = service.Transactions.Get(p=> p.TransactionId > 0
                    includeProperties: "Category,TransactionType",
                    orderBy: p => p.OrderByDescending(o => o.RegisterDate));

                 */

                commonModel = dataModel.Select(p => new Common.Models.User()
                {
                    UserId = p.UserId,
                    PersonName = p.PersonName,
                    AccountNumber = p.AccountNumber,
                    RegisterDate = p.RegisterDate,
                    DateUpdate = p.DateUpdate
                }).ToList();
            }

            return Ok(commonModel);
        }
        [HttpGet]
        public IHttpActionResult GetById(int userId)
        {
            Rp3.Test.Common.Models.User commonModel = null;
            using (DataService service = new DataService())
            {
                var model = service.Users.GetByID(userId);

                commonModel = new Common.Models.User()
                {
                    UserId = model.UserId,
                    AccountNumber = model.AccountNumber,
                    PersonName = model.PersonName
                };
            }
            return Ok(commonModel);
        }

        [HttpPost]
        public IHttpActionResult Update(Rp3.Test.Common.Models.User user)
        {
            using (DataService service = new DataService())
            {
                Rp3.Test.Data.Models.User userModel = new Test.Data.Models.User();
                userModel.PersonName = user.PersonName;
                userModel.AccountNumber = user.AccountNumber;
                userModel.UserId = user.UserId;
                userModel.RegisterDate = user.RegisterDate;

                service.Users.Update(userModel);
                service.SaveChanges();
            }

            return Ok(true);
        }

        public IHttpActionResult Insert(Rp3.Test.Common.Models.User user)
        {
            //Complete the code
            using (DataService service = new DataService())
            {
                Rp3.Test.Data.Models.User model = new Test.Data.Models.User();
                model.UserId = service.Users.GetMaxValue<int>(p => p.UserId, 0) + 1;
                model.PersonName = user.PersonName;
                model.AccountNumber = user.AccountNumber;
                model.RegisterDate = user.RegisterDate;



                service.Users.Insert(model);
                service.SaveChanges();
            }

            return Ok();
        }
        [HttpPost]
        public IHttpActionResult Login(Rp3.Test.Common.Models.User User)
        {
            Rp3.Test.Common.Models.User commonModel = null;
            using (DataService service = new DataService())
            {
                var model = service.Users.GetQueryable();

                model = model.Where(u => (u.UserName == User.UserName && u.Password == User.Password));

                commonModel = model.Select(p => new Common.Models.User()
                {
                    UserId = p.UserId,
                    AccountNumber = p.AccountNumber,
                    PersonName = p.PersonName,
                    UserName = p.UserName
                }).FirstOrDefault();

            }
            return Ok(commonModel);
        }

    }
}
