﻿using CodeFreak1.Models;
using CodeFreak1.Repositories;
using CodeFreak1.ViewModel;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Linq;
using System.Net.Mail;

// For more information on enabling MVC for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860


namespace CodeFreak1.Controllers
{

    [Route("api/[controller]")]
    public class ProfileController : Controller
    {

        UserRepository userRepository = new UserRepository();

        [HttpPost]
        [Route("UploadImage")]
        [AllowAnonymous]

        public IActionResult UploadImage(IFormFile Image )
        {


           // var httpRequest = System.Web.HttpContext.Current.Request;
           // var postedFile = httpRequest.Files[file];
           // var filePath = HttpContext.Current.Server.MapPath("~/" + postedFile.FileName);
           // postedFile.SaveAs(filePath);


            return Ok();

        }

        [HttpPost]
        [Route("SendEmail")]
        [AllowAnonymous]

        public IActionResult sendEmail([FromBody] ProfileEmailViewModel profileEmailViewModel)
        {
            
            Random r = new Random();
            int randNum = r.Next(1000000);
            string sixDigitNumber = randNum.ToString("D6");

            
            profileEmailViewModel.Code = sixDigitNumber;

            string FromMail = "Your_Gmail";
            string FromEmailPassword = "Your_Password";
            string emailTo = profileEmailViewModel.Email;

            string subject = "Password Reset Code";
            string body = "Your Password Reset Code is " + sixDigitNumber;

            try
            {
                MailMessage mail = new MailMessage();
                SmtpClient SmtpServer = new SmtpClient();
                mail.From = new MailAddress(FromMail);
                mail.To.Add(emailTo);
                mail.Subject = subject;
                mail.Body = body;
                SmtpServer.Port = 25;
                SmtpServer.Host = "smtp.gmail.com";
                SmtpServer.Credentials = new System.Net.NetworkCredential(FromMail, FromEmailPassword);
                SmtpServer.EnableSsl = true;
                SmtpServer.Send(mail);
                profileEmailViewModel.Success = true;
                profileEmailViewModel.Code = sixDigitNumber;
            }
            catch (Exception e)
            {
                profileEmailViewModel.Success = false;
                profileEmailViewModel.Error = "Error in Sending Email";

            }

            return Ok(profileEmailViewModel);

        }
        [HttpPost]
        [Route("ChangePassword")]
        [AllowAnonymous]

        public IActionResult ChangePassword([FromBody] String Password)
        {


            Users user = new Users();

            user = getApplicationUser();
            user.Password = Password;


            this.userRepository.UpdateUserPassword(user);

            return Ok();

        }

        [HttpPost]
        [Route("ChangePersonalInfo")]
        [AllowAnonymous]

        public IActionResult ChangePersonalInfo([FromBody] ProfileViewModel profile)
        {

            Users user = new Users();

            user = getApplicationUser();

            user.Name = profile.Name;
            user.Email = profile.Email;


            this.userRepository.UpdateUserPersonalInfo(user);

            return Ok();

        }

        [HttpPost]
        [Route("Test")]
        [AllowAnonymous]

        public IActionResult Test()
        {



            //Users user = new Users();

            //user = getApplicationUser();
            //user.Password = "123";


//            this.userRepository.UpdateUserPassword(user);



            // var httpRequest = System.Web.HttpContext.Current.Request;
            // var postedFile = httpRequest.Files[file];
            // var filePath = HttpContext.Current.Server.MapPath("~/" + postedFile.FileName);
            // postedFile.SaveAs(filePath);


            return Ok();

        }
        public Users getApplicationUser()
        {
            var identity = User.Identities.FirstOrDefault(s => s.Name.ToLower() == "user");
            var claims = identity.Claims;
            string id = null;
            foreach (var c in claims)
            {
                if (c.Type == "userId")
                {
                    id = c.Value;
                }
            }
            Users user = null;
            if (id != null)
            {
                user = userRepository.getUserById(new Guid(id));
            }

            return user;
        }



    }
}
