using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace IIKI.GoRoomy.WebApi.Models
{
    public class ApiResponse<T>
    {
        public int code { get; set; }
        public string message { get; set; }
        public T data { get; set; }

        public ApiResponse(int code, string message, T data)
        {
            code = code;
            message = message;
            data = data;
        }
    }
}