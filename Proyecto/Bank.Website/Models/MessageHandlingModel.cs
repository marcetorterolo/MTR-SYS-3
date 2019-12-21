using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Bank.Website
{
    public class MessageHandlingModel
    {
        public String ErrorMessage { get; set; }
        public Int32 ErrorCode { get; set; }

        public MessageHandlingModel()
        {
            ErrorMessage = String.Empty;
            ErrorCode = 0;
        }
    }
}