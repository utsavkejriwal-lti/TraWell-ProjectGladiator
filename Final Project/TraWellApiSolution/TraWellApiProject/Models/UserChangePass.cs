﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TraWellApiProject.Models
{
    public class UserChangePass
    {
        public string Email { get; set; }
        public string Password { get; set; }
        public string NewPassword { get; set; }
    }
}