<<<<<<< HEAD
﻿using System.Web.Mvc;
=======
﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
>>>>>>> 2b00939ddbec22f2dcf9ae366ed9f1ce95d9139f
using System.Web.Security;

namespace Allocat.UserInterface.Controllers
{
    public class ResponseController : Controller
    {
        public ActionResult TissueBankUser_SignUp_Successful()
        {
            return View();
        }

        public ActionResult TissueBank_Registration_Successful()
        {
            FormsAuthentication.SignOut();
            return RedirectToAction("Index", "Account", new { area = "" ,Status= "TissueBank_Registration_Successful" });
        }
<<<<<<< HEAD

        public ActionResult AccessDenied()
        {
            return View();
        }

=======
>>>>>>> 2b00939ddbec22f2dcf9ae366ed9f1ce95d9139f
    }
}