using ManagementSystem.Models;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;
using static ManagementSystem.Startup;

namespace ManagementSystem.Controllers
{
    public class LoginController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
         [HttpPost]  
        [ValidateAntiForgeryToken]  
        public ActionResult Login(LoginViewModel objUser)   
        {  
            if (ModelState.IsValid)   
            {
                using var con = new SqlConnection(ShareConnectionString.Value);
                {  
                    var obj = from s select Doc_Master_Login where/*(a => a.UserName.Equals(objUser.UserName) && a.Password.Equals(objUser.Password)).FirstOrDefault();*/
                    if (obj != null)  
                    {  
                        Session["UserID"] = obj.UserId.ToString();  
                        Session["UserName"] = obj.UserName.ToString();  
                        return RedirectToAction("UserDashBoard");  
                    }  
                }  
            }  
            return View(objUser);  
        }  
    }
}
