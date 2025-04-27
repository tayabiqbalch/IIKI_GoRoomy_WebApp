using System;
using System.IO;
using System.Security.Cryptography;
using System.Text;

namespace IIKI.GoRoomy.WebApp.Utility
{
    public class CryptographyManager
    {
        /// <summary> 
        /// Hash enum value 
        /// </summary> 
        public enum HashName
        {
            SHA1 = 1,
            MD5 = 2,
            SHA256 = 4,
            SHA384 = 8,
            SHA512 = 16
        }

        private byte[] _keyByte = { };
        //Default Key
        private static string _key = "Pass@123#";
        //Default initial vector
        private byte[] _ivByte = { 0x01, 0x12, 0x23, 0x34, 0x45, 0x56, 0x67, 0x78 };

        /// &lt;summary> 
        /// Encrypt text 
        /// &lt;/summary> 
        /// &lt;param name="value">plain text&lt;/param> 
        /// &lt;returns>encrypted text&lt;/returns> 
        public string Encrypt(string value)
        {
            return Encrypt(value, string.Empty);
        }

        /// &lt;summary> 
        /// Encrypt text by key 
        /// &lt;/summary> 
        /// &lt;param name="value">plain text&lt;/param> 
        /// &lt;param name="key"> string key&lt;/param> 
        /// &lt;returns>encrypted text&lt;/returns> 
        public string Encrypt(string value, string key)
        {
            return Encrypt(value, key, string.Empty);
        }

        /// &lt;summary> 
        /// Encrypt text by key with initialization vector 
        /// &lt;/summary> 
        /// &lt;param name="value">plain text&lt;/param> 
        /// &lt;param name="key"> string key&lt;/param> 
        /// &lt;param name="iv">initialization vector&lt;/param> 
        /// &lt;returns>encrypted text&lt;/returns> 
        public string Encrypt(string value, string key, string iv)
        {
            string encryptValue = string.Empty;
            MemoryStream ms = null;
            CryptoStream cs = null;
            if (!string.IsNullOrEmpty(value))
            {
                try
                {
                    if (!string.IsNullOrEmpty(key))
                    {
                        _keyByte = Encoding.UTF8.GetBytes
                                (key.Substring(0, 8));
                        if (!string.IsNullOrEmpty(iv))
                        {
                            _ivByte = Encoding.UTF8.GetBytes
                                (iv.Substring(0, 8));
                        }
                    }
                    else
                    {
                        _keyByte = Encoding.UTF8.GetBytes(_key);
                    }
                    using (DESCryptoServiceProvider des =
                            new DESCryptoServiceProvider())
                    {
                        byte[] inputByteArray =
                            Encoding.UTF8.GetBytes(value);
                        ms = new MemoryStream();
                        cs = new CryptoStream(ms, des.CreateEncryptor
                        (_keyByte, _ivByte), CryptoStreamMode.Write);
                        cs.Write(inputByteArray, 0, inputByteArray.Length);
                        cs.FlushFinalBlock();
                        encryptValue = Convert.ToBase64String(ms.ToArray());
                    }
                }
                catch
                {
                    //TODO: write log 
                }
                finally
                {
                    cs.Dispose();
                    ms.Dispose();
                }
            }
            return encryptValue;
        }

        /// &lt;summary> 
        /// Decrypt text 
        /// &lt;/summary> 
        /// &lt;param name="value">encrypted text&lt;/param> 
        /// &lt;returns>plain text&lt;/returns> 
        public string Decrypt(string value)
        {
            return Decrypt(value, string.Empty);
        }

        /// &lt;summary> 
        /// Decrypt text by key 
        /// &lt;/summary> 
        /// &lt;param name="value">encrypted text&lt;/param> 
        /// &lt;param name="key">string key&lt;/param> 
        /// &lt;returns>plain text&lt;/returns> 
        public string Decrypt(string value, string key)
        {
            return Decrypt(value, key, string.Empty);
        }

        /// &lt;summary> 
        /// Decrypt text by key with initialization vector 
        /// &lt;/summary> 
        /// &lt;param name="value">encrypted text&lt;/param> 
        /// &lt;param name="key"> string key&lt;/param> 
        /// &lt;param name="iv">initialization vector&lt;/param> 
        /// &lt;returns>encrypted text&lt;/returns> 
        public string Decrypt(string value, string key, string iv)
        {
            string decrptValue = string.Empty;
            if (!string.IsNullOrEmpty(value))
            {
                MemoryStream ms = null;
                CryptoStream cs = null;
                value = value.Replace(" ", "+");
                byte[] inputByteArray = new byte[value.Length];
                try
                {
                    if (!string.IsNullOrEmpty(key))
                    {
                        _keyByte = Encoding.UTF8.GetBytes
                                (key.Substring(0, 8));
                        if (!string.IsNullOrEmpty(iv))
                        {
                            _ivByte = Encoding.UTF8.GetBytes
                                (iv.Substring(0, 8));
                        }
                    }
                    else
                    {
                        _keyByte = Encoding.UTF8.GetBytes(_key);
                    }
                    using (DESCryptoServiceProvider des =
                            new DESCryptoServiceProvider())
                    {
                        inputByteArray = Convert.FromBase64String(value);
                        ms = new MemoryStream();
                        cs = new CryptoStream(ms, des.CreateDecryptor
                        (_keyByte, _ivByte), CryptoStreamMode.Write);
                        cs.Write(inputByteArray, 0, inputByteArray.Length);
                        cs.FlushFinalBlock();
                        Encoding encoding = Encoding.UTF8;
                        decrptValue = encoding.GetString(ms.ToArray());
                    }
                }
                catch
                {
                    //TODO: write log 
                }
                finally
                {
                    cs.Dispose();
                    ms.Dispose();
                }
            }
            return decrptValue;
        }
    }
}