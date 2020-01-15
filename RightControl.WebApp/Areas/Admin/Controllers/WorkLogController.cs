using RightControl.Common;
using RightControl.IService;
using RightControl.Model;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace RightControl.WebApp.Areas.Admin.Controllers
{
    public class WorkLogController : BaseController
    {
        public IWorkLogService workLogService { get; set; }

        #region 工作日志视图
        // GET: Admin/WorkLog 

        //列表视图
        public override ActionResult Index(int? id)
        {
            base.Index(id);
            return View();
        }

        //添加视图
        public ActionResult Add()
        {
            var all_project = GetAllEnums<Project>(Project.zhengzhou);//项目
            ViewBag.sys_project = all_project;

            var all_Department = GetAllEnums<Department>(Department.hr);//部门
            ViewBag.sys_department = all_Department;

            ViewBag.Operator = Operator;
            return View();
        }

        //编辑视图
        public ActionResult Edit(int Id)
        {
            var all_project = GetAllEnums<Project>(Project.zhengzhou);//项目
            ViewBag.sys_project = all_project;

            var all_Department = GetAllEnums<Department>(Department.hr);//部门
            ViewBag.sys_department = all_Department;

            ViewBag.Operator = Operator;

            ViewBag.department_id = 3;

            var model = workLogService.ReadModel(Id);
            return View(model);
        }

        //详细视图
        public ActionResult Detail(int Id)
        {
            var model = workLogService.GetDetail(Id);
            return View(model);
        }

        #endregion

        #region 方法
        /// <summary>
        /// 添加
        /// </summary>
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Add(WorkLogModel model)
        {
            model.CreateOn = DateTime.Now;
            model.CreateBy = Operator.UserId;//发布人
            model.UpdateOn = DateTime.Now;
            var result = workLogService.CreateModel(model) ? SuccessTip() : ErrorTip();
            return Json(result);
            
        }
        /// <summary>
        /// 删除
        /// </summary>
        [HttpPost]
        public ActionResult Delete(int Id)
        {
            var result = workLogService.DeleteModel(Id) ? SuccessTip() : ErrorTip();
            return Json(result);
        }
        /// <summary>
        /// 修改
        /// </summary>
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Edit(WorkLogModel model)
        {
            model.UpdateOn = DateTime.Now;
            model.UpdateBy = Operator.UserId;
            var result = workLogService.UpdateModel(model, "wk_title,wk_content,UpdateOn,UpDateBy") ? SuccessTip() : ErrorTip();
            return Json(result);
        }
        /// <summary>
        /// 数据列表
        /// </summary>
        [HttpGet]
        public JsonResult List(WorkLogModel filter, PageInfo pageInfo)
        {
            var result = workLogService.GetListByFilter(filter, pageInfo,Operator);
            return Json(result, JsonRequestBehavior.AllowGet);
        }
        #endregion

        //model.Status = true;
        //model.CreateOn = DateTime.Now;
        //model.IPAddress = Net.Ip;
        //model.IPAddressName = Net.GetLocation(model.IPAddress);
        public JsonResult GetModel(string Id)
        {
            WorkLogModel info = new WorkLogModel();
            if (!string.IsNullOrEmpty(Id))
            {
                info=workLogService.GetDetail(int.Parse(Id));
            }

            var jsonstr = new
            {
                count = 1,
                code = 0,
                msg = "",
                data = info
            };
            return Json(jsonstr, JsonRequestBehavior.AllowGet);
        }
    }
}