using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

#region Added Namespaces

using MSMQ_MailRely;
using MailSenderLibrary;
using System.Net.Mail;
using System.IO;
using System.Net.Mime;

#endregion

namespace TestApplication
{
    class Consumer
    {
       static void Main(string[] args)
        {
            ConfigurationReader configurationReader = new ConfigurationReader();
            if(string.Equals(configurationReader.EmailTurnOn.ToLower(),"true"))
            {
                EmailSender objEmailSender = new EmailSender(@".\Private$\EmailQueue");
                MailMessage objMailMessage = new MailMessage();

                objMailMessage.From = new MailAddress(configurationReader.EmailFrom);
                char[] delimiters = new[] { ',', ';' };
                bool mailSent = default(bool);

                // EmailTo list
                if (!string.IsNullOrEmpty(configurationReader.EmailTo))
                {
                    if (configurationReader.EmailTo.Contains(',') || configurationReader.EmailTo.Contains(';'))
                    {
                        string[] emailToList = configurationReader.EmailTo.Split(delimiters, StringSplitOptions.RemoveEmptyEntries);
                        foreach (var emailToItem in emailToList)
                        {
                            objMailMessage.To.Add(emailToItem);
                        }
                    }
                    else
                    {
                        objMailMessage.To.Add(configurationReader.EmailTo);
                    }
                }

                //EmailCC List
                if (!string.IsNullOrEmpty(configurationReader.EmailCC))
                {
                    if (configurationReader.EmailCC.Contains(',') || configurationReader.EmailCC.Contains(';'))
                    {
                        string[] emailCCList = configurationReader.EmailCC.Split(delimiters, StringSplitOptions.RemoveEmptyEntries);
                        foreach (var emailCCItem in emailCCList)
                        {
                            objMailMessage.CC.Add(emailCCItem);
                        }
                    }
                    else
                    {
                        objMailMessage.CC.Add(configurationReader.EmailCC);
                    }
                }

                //EmailBCC List 
                if (!string.IsNullOrEmpty(configurationReader.EmailBcc))
                {
                    if (configurationReader.EmailBcc.Contains(',') || configurationReader.EmailBcc.Contains(';'))
                    {
                        string[] emailBCCList = configurationReader.EmailBcc.Split(delimiters, StringSplitOptions.RemoveEmptyEntries);
                        foreach (var emailBCCItem in emailBCCList)
                        {
                            objMailMessage.To.Add(emailBCCItem);
                        }
                    }
                    else
                    {
                        objMailMessage.Bcc.Add(configurationReader.EmailBcc);
                    }
                }

                //if (!string.IsNullOrEmpty(configurationReader.EmailSubject))
                //{
                //    objMailMessage.Subject = configurationReader.EmailSubject;
                //}              

                objMailMessage.Subject = "Sample message";
                objMailMessage.IsBodyHtml = true;
                objMailMessage.Body = @"<h1>This is sample</h1><a href=""https://www.codeproject.com"">See this link</a>";

                //FileStream fs = new FileStream(@"C:\Windows\Microsoft.NET\Framework\v4.0.30319\SetupCache\Client\SplashScreen.bmp", FileMode.Open, FileAccess.Read);
                //Attachment a = new Attachment(fs, "image.bmp", MediaTypeNames.Application.Octet);
                //objMailMessage.Attachments.Add(a);

                //string str = "<html><body><h1>Picture</h1><br/><img src=\"cid:image1\"></body></html>";
                //AlternateView av = AlternateView.CreateAlternateViewFromString(str, null, MediaTypeNames.Text.Html);
                //LinkedResource lr = new LinkedResource(@"C:\Windows\Microsoft.NET\Framework\v4.0.30319\ASP.NETWebAdminFiles\Images\ASPdotNET_logo.jpg", MediaTypeNames.Image.Jpeg);
                //lr.ContentId = "image1";
                //av.LinkedResources.Add(lr);
                //objMailMessage.AlternateViews.Add(av);

                objEmailSender.QueueMessage(objMailMessage);
            }
        }
    }
}
