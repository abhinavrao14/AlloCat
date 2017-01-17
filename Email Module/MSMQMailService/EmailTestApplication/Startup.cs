using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(EmailTestApplication.Startup))]
namespace EmailTestApplication
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
