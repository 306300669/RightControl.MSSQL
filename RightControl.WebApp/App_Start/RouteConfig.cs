using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace RightControl.WebApp
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Admin", action = "Login", id = UrlParameter.Optional },
                //defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional },//前台默认
                namespaces:new string[] {"RightControl.WebApp.Controllers" }
            );
        }
    }
}
