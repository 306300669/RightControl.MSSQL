using RightControl.Common;
using RightControl.IService;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Reflection;
using System.Web.Mvc;

namespace RightControl.WebApp.Areas.Admin.Controllers
{
    [HandlerLogin]
    public class BaseController : Controller
    {
        protected const string SuccessText = "操作成功！";
        protected const string ErrorText = "操作失败！";
        public ILogService logService { get; set; }
        public IActionService actionService { get; set; }
        public OperatorModel Operator
        {
            get
            {
                return OperatorProvider.Provider.GetCurrent();
            }
        }

        // GET: Admin/Base
        public virtual ActionResult Index(int? id)
        {
            var _menuId = id == null ? 0 : id.Value;
            var _roleId = Operator.RoleId;
            if (id != null)
            {
                ViewData["ActionList"] = actionService.GetActionListByMenuIdRoleId(_menuId, _roleId, PositionEnum.FormInside);
                ViewData["ActionFormRightTop"] = actionService.GetActionListByMenuIdRoleId(_menuId, _roleId, PositionEnum.FormRightTop);
            }
            return View();
        }
        /// <summary>
        /// 操作成功
        /// </summary>
        /// <param name="message">提示文本</param>
        /// <returns></returns>
        protected virtual AjaxResult SuccessTip(string message = SuccessText)
        {
            return new AjaxResult { state = ResultType.success.ToString(), message = message };
        }
        /// <summary>
        /// 操作失败
        /// </summary>
        /// <param name="message">提示文本</param>
        /// <returns></returns>
        protected virtual AjaxResult ErrorTip(string message = ErrorText)
        {
            return new AjaxResult { state = ResultType.error.ToString(), message = message };
        }
        protected WebSiteModel GetWebSiteInfo()
        {
            return new WebSiteModel
            {
                SiteName = Configs.GetValue("SiteName"),
                SiteDomain = Configs.GetValue("SiteDomain"),
                CacheTime = Configs.GetValue("CacheTime"),
                MaxFileUpload = Configs.GetValue("MaxFileUpload"),
                UploadFileType = Configs.GetValue("UploadFileType"),
                HomeTitle = Configs.GetValue("HomeTitle"),
                MetaKey = Configs.GetValue("MetaKey"),
                MetaDescribe = Configs.GetValue("MetaDescribe"),
                CopyRight = Configs.GetValue("CopyRight")
            };
        }

        /// <summary>
        /// 获取全部的枚举项的值及描述
        /// </summary>
        /// <param name="obj">任意一个枚举值</param>
        /// <returns></returns>
        public static Dictionary<int, string> GetAllEnums<T>(T obj)
        {
            Type enumType = obj.GetType();
            Dictionary<int, string> results = new Dictionary<int, string>();
            foreach (var item in Enum.GetValues(enumType))
            {
                int value = Convert.ToInt32(item);
                string name = item.ToString();
                var enumValue = Enum.Parse(enumType, name);
                string s = GetObjDescription(enumValue);
                if (!string.IsNullOrEmpty(s)) name = s;
                results.Add(value, name);
            }
            return results;
        }

        public static string GetObjDescription(object obj)
        {
            if (obj == null) { return string.Empty; }

            string objName = obj.ToString();
            Type t = obj.GetType();
            FieldInfo fi = t.GetField(objName);
            if (fi == null) return objName;
            DescriptionAttribute[] arrDesc = (DescriptionAttribute[])fi.GetCustomAttributes(typeof(DescriptionAttribute), false);
            if (arrDesc.Length > 0)
                return arrDesc[0].Description;
            return objName;
        }
    }
}