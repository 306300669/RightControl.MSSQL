using RightControl.IService;
using RightControl.Model;
using RightControl.WebApp.Areas.Admin.Controllers;
using System;
using System.Collections.Generic;
using System.Web.Mvc;

namespace RightControl.WebApp.Areas.Permissions.Controllers
{
    public class RoleController : BaseController
    {
        public IRoleService service { get; set; }
        // GET: Permissions/Role
        public override ActionResult Index(int? id)
        {
            base.Index(id);
            return View();
        }
        [HttpGet]
        public JsonResult List(PageInfo pageInfo, RoleModel filter)
        {
            var result = service.GetListByFilter(filter, pageInfo, Operator);
            return Json(result, JsonRequestBehavior.AllowGet);
        }
        public ActionResult Detail(int Id)
        {
            var model = service.ReadModel(Id);
            return View(model);
        }
        public ActionResult Edit(int Id)
        {
            var model = service.ReadModel(Id);
            return View(model);
        }
        [HttpPost]
        public ActionResult Edit(RoleModel model)
        {
            model.UpdateOn = DateTime.Now;
            model.UpdateBy = Operator.UserId;
            var result = service.UpdateModel(model) ? SuccessTip() : ErrorTip();
            return Json(result);
        }
        public ActionResult Add()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Add(RoleModel model)
        {
            model.CreateOn = DateTime.Now;
            model.CreateBy = Operator.UserId;
            model.UpdateOn = DateTime.Now;
            model.UpdateBy = Operator.UserId;
            var result = service.CreateModel(model) ? SuccessTip() : ErrorTip();
            return Json(result);
        }
        /// <summary>
        /// 删除角色
        /// </summary>
        /// <param name="Id"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult Delete(int Id)
        {
            //删除角色时,同时删除菜单角色权限记录
            var result = service.DeleteRoleAllByRoleId(Id) ? SuccessTip() : ErrorTip();
            return Json(result);
        }
        public ActionResult Assign(int Id)
        {
            ViewBag.RoleId = Id;
            return View();
        }



        public ActionResult Role_List(int Id)
        {
            var model = service.ReadModel(Id);
            //所有角色   列表
            ViewData["All_Role_List"] = service.GetAll();

            //拥有的角色 列表
            ViewData["Have_Role_List"] = null;
            if (!string.IsNullOrEmpty(model.Role_List))
            {
                ViewData["Have_Role_List"] = service.GetByWhere(string.Format("where Id in({0})", model.Role_List));
            }
            else
            {
                ViewData["Have_Role_List"] = service.GetByWhere(" where Id =0");
            }
            return View(model);
        }



        [HttpPost]
        //public ActionResult Update_Role_List(IEnumerable<RoleModel> list, int RoleId)
        public ActionResult Update_Role_List(string role_id_str, int RoleId)
        {
            if(!string.IsNullOrEmpty(role_id_str))
            {
                RoleModel info = service.ReadModel(RoleId);
                info.Role_List = role_id_str.TrimEnd(',');
                var result = service.UpdateModel(info) == true ? SuccessTip() : ErrorTip();
                return Json(result);
            }
            else
            {
                return Json(ErrorTip());
            }

        }
    }
}