using Autofac;
using Autofac.Integration.WebApi;
using log4net;
using System.Reflection;
using System.Web.Http;
using ClassLibrary.Repository;
using ClassLibrary.Services;
using Bookingservices;
using Hotel.ClassLibrary.Services;
using HotelApi.Filters;


namespace HotelApi
{
    public static class WebApiConfig
    {
        public static void Register(HttpConfiguration config)
        {
            // Web API configuration and services

            
            // DI
            var builder = new ContainerBuilder();

            // Register all dependencies here
            builder.RegisterApiControllers(Assembly.GetExecutingAssembly());
            builder.RegisterType<DatabaseRepo>().As<IDatabaseRepo>();
            builder.RegisterType<GuestService>().As<IGuestService>();
            builder.RegisterType<BookingsService>().As<IBookingsService>();
            builder.Register(c => LogManager.GetLogger(typeof(object))).As<ILog>();
            builder.RegisterType<LoginDataService>().As<ILoginDataService>();

            var container = builder.Build();
            config.DependencyResolver = new AutofacWebApiDependencyResolver(container);

            
            // Enable Basic Authentication for entire web application
            config.Filters.Add(new BasicAuthenticationAttribute(container.Resolve<ILoginDataService>()));
            // Web API routes
            
            
            config.MapHttpAttributeRoutes();

            config.Routes.MapHttpRoute(
                name: "DefaultApi",
                routeTemplate: "api/{controller}/{id}",
                defaults: new { id = RouteParameter.Optional }
            );
        }
    }
}
