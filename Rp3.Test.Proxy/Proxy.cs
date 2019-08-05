using Newtonsoft.Json;
using Rp3.Test.Common.Models;
using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Linq;
using System.Net;
using System.Threading.Tasks;
using System.Web;


namespace Rp3.Test.Proxies
{
    public class Proxy : BaseProxy
    {
        private const string UriGetCategory = "api/categoryData/get?active={0}";
        private const string UriGetCategoryById = "api/categoryData/getById?categoryId={0}";
        private const string UriInsertCategory = "api/categoryData/insert";
        private const string UriUpdateCategory = "api/categoryData/update";

        private const string UriGetTransactionType = "api/transactionTypeData/get";

        private const string UriGetTransactions = "api/transactionData/get";

        private const string UriGetTransactionById = "api/transactionData/getById?TransactionId={0}";
        private const string UriUpdateTransaction = "api/transactionData/update";
        private const string UriInsertTransaction = "api/transactionData/insert";
        private const string UriGetTransactionByUser = "api/transactionData/GetByUserId?UserId={0}";
        private const string UriGetBalance = "api/transactionData/GetBalance?UserId={0}";

        private const string UriGetUser = "api/userData/get";

        private const string UriGetUserById = "api/userData/getById?UserId={0}";
        private const string UriUpdateUser = "api/userData/update";
        private const string UriInsertUser = "api/userData/insert";
        private const string UriLoginUser = "api/userData/login";

        /// <summary>
        /// Obtiene el Listado de Tipos de Transacción
        /// </summary>
        /// <returns></returns>
        public List<TransactionType> GetTransactionTypes()
        {
            return HttpGet<List<TransactionType>>(UriGetTransactionType);
        }

        #region Category Services

        /// <summary>
        /// Obtiene el Listado de Categorías
        /// </summary>
        /// <param name="active">especifica si la consulta es sobre categorías activas o Inactivas</param>
        /// <returns></returns>
        public List<Category> GetCategories(bool? active = null)
        {
            return HttpGet<List<Category>>(UriGetCategory, active);
        }

        /// <summary>
        /// Obtiene una Categoría por Id
        /// </summary>
        /// <param name="categoryId">Id de la Categoría</param>
        /// <returns></returns>
        public Category GetCategory(int categoryId)
        {
            return HttpGet<Category>(UriGetCategoryById, categoryId);
        }

        /// <summary>
        /// Método para Insertar Categorías
        /// </summary>
        /// <param name="category"></param>
        /// <returns></returns>
        public bool InsertCategory(Rp3.Test.Common.Models.Category category)
        {
            return HttpPostAsJson<bool>(UriInsertCategory, category);
        }

        public bool UpdateCategory(Rp3.Test.Common.Models.Category category)
        {
            return HttpPostAsJson<bool>(UriUpdateCategory, category);
        }

        #endregion

        /// <summary>
        /// Obtiene el Listado de Transacciones
        /// </summary>
        /// <returns></returns>
        public List<TransactionView> GetTransactions()
        {
            return HttpGet<List<TransactionView>>(UriGetTransactions);
        }

        public List<TransactionView> GetTransactionsByUser(int userId)
        {
            return HttpGet<List<TransactionView>>(UriGetTransactionByUser, userId);
        }

        public List<Balance> GetBalance(int userId)
        {
            return HttpGet<List<Balance>>(UriGetBalance, userId);
        }

        public Transaction GetTransactionById(int? TransactionId)
        {
            return HttpGet<Transaction>(UriGetTransactionById, TransactionId);
        }

        public bool UpdateTransaction(Rp3.Test.Common.Models.Transaction transaction)
        {
            return HttpPostAsJson<bool>(UriUpdateTransaction, transaction);
        }

        public bool InsertTransaction(Rp3.Test.Common.Models.Transaction transaction)
        {
            return HttpPostAsJson<bool>(UriInsertTransaction, transaction);
        }

        public List<User> GetUsers()
        {
            return HttpGet<List<User>>(UriGetUser);
        }

        public User GetUserById(int? userId)
        {
            return HttpGet<User>(UriGetUserById, userId);
        }

        public bool UpdateUser(Rp3.Test.Common.Models.User user)
        {
            return HttpPostAsJson<bool>(UriUpdateUser, user);
        }

        public bool InsertUser(Rp3.Test.Common.Models.User User)
        {
            return HttpPostAsJson<bool>(UriInsertUser, User);
        }

        public User LoginUser(Rp3.Test.Common.Models.User User)
        {
            return HttpPostAsJson<User>(UriLoginUser, User);
        }
    }
}