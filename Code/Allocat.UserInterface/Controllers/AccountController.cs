using System;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using Newtonsoft.Json;
using Allocat.Web.Models;
using Allocat.Web.Security;
using Allocat.DataModel;

namespace Allocat.UserInterface.Controllers
{
    //[RouteArea("Common")]
    public class AccountController : Controller
    {
        AllocatDbEntities Context = new AllocatDbEntities();

        [AllowAnonymous]
        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Index(LoginViewModel model, string returnUrl = "")
        {
            if (ModelState.IsValid)
            {
                var demo = Context.UserRole.ToList();
                var user = Context.User.Where(u => u.UserName == model.Username && u.Password == model.Password).FirstOrDefault();
                if (user != null)
                {
                    //var roles=user.Roles.Select(m => m.RoleName).ToArray();
                    var roles = Context.sp_User_GetRoleByUserName(model.Username).ToArray();
                    var EntityInfo = Context.sp_User_GetEntityInfoByUserName(model.Username).ToArray();

                    CustomPrincipalSerializeModel serializeModel = new CustomPrincipalSerializeModel();
                    serializeModel.UserId = user.UserId;
                    serializeModel.FullName = user.FullName;
                    serializeModel.roles = roles;
                    serializeModel.InfoType = EntityInfo[0].InfoType;
                    serializeModel.InfoId= (int)EntityInfo[0].InfoId;
                    serializeModel.InfoName = EntityInfo[0].InfoName;

                   string userData = JsonConvert.SerializeObject(serializeModel);
                    FormsAuthenticationTicket authTicket = new FormsAuthenticationTicket(
                             1,
                            user.FullName,
                             DateTime.Now,
                             DateTime.Now.AddMinutes(1),
                             false,
                             userData);

                    string encTicket = FormsAuthentication.Encrypt(authTicket);
                    HttpCookie faCookie = new HttpCookie(FormsAuthentication.FormsCookieName, encTicket);
                    Response.Cookies.Add(faCookie);

                    if (EntityInfo[0].InfoType.Equals("HOSPITAL"))
                    {
                        return RedirectToAction("Index", "Home", new { area = "Hospital" });
                    }
                    else if (EntityInfo[0].InfoType.Equals("TISSUEBANK"))
                    {
                        return RedirectToAction("Index", "Home", new { area = "TissueBank" });
                    }
                    else
                    {
                        return RedirectToAction("Index", "Home", new { area = "Admin" });
                    }
                }

                ModelState.AddModelError("", "Incorrect username and/or password");
            }

            return View(model);
        }

        [AllowAnonymous]
        public ActionResult LogOut()
        {
            FormsAuthentication.SignOut();
            return RedirectToAction("Index", "Account",new { area=""});
        }
    }
}