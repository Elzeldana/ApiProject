using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http;
using System.Web.Routing;

namespace HotelApi
{
    public class WebApiApplication : System.Web.HttpApplication
    {
        protected void Application_Start()
        {
            // Web API configuration and services
            log4net.Config.XmlConfigurator.Configure();

            GlobalConfiguration.Configure(WebApiConfig.Register);
        }
    }
}