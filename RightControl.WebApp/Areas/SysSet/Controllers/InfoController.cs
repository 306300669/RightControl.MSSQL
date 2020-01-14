using RightControl.Common;
using RightControl.IService;
using RightControl.Model;
using RightControl.WebApp.Areas.Admin.Controllers;
using System;
using System.IO;
using System.Web;
using System.Web.Mvc;

namespace RightControl.WebApp.Areas.SysSet.Controllers
{
    public class InfoController : BaseController
    {
        public IUserService userService { get; set; }
        // GET: SysSet/Info
        public override ActionResult Index(int? id)
        {
            base.Index(id);
            ViewBag.MaxFileUpload = Configs.GetValue("MaxFileUpload");
            ViewBag.UploadFileType = Configs.GetValue("UploadFileType");
            var _userId = Operator.UserId;
            var model = userService.GetDetail(_userId);
            return View(model);
        }
        [HttpPost]
        public ActionResult Index(UserModel model)
        {
            model.UpdateOn = DateTime.Now;
            model.UpdateBy = Operator.UserId;
            model.Id = Operator.UserId;
            var result = userService.UpdateModel(model, "UpdateOn,UpdateBy,RealName,Gender,HeadShot,Phone,Email,Remark") ? SuccessText : ErrorText;
            ViewBag.Msg = result;
            return View("Index", model);
        }
        /// <summary>
        /// 上传文件
        /// </summary>
        /// <returns></returns>
        public JsonResult ExportFile()
        {
            uploadFile _uploadFile = new uploadFile();
            try
            {
                var file = Request.Files[0]; //获取选中文件
                var filecombin = file.FileName.Split('.');
                if (file == null || string.IsNullOrEmpty(file.FileName) || file.ContentLength == 0 || filecombin.Length < 2)
                {
                    _uploadFile.code = -1;
                    _uploadFile.src = "";
                    _uploadFile.msg = "上传出错!请检查文件名或文件内容";
                    return Json(_uploadFile);
                }
                //定义本地路径位置
                string localPath = Server.MapPath("~/Upload/img/");
                string filePathName = string.Empty;

                string tmpName = Server.MapPath("~/Upload/img/");
                var tmp = file.FileName;
                var tmpIndex = 0;
                //判断是否存在相同文件名的文件 相同累加1继续判断  
                while (System.IO.File.Exists(tmpName + tmp))
                {
                    tmp = filecombin[0] + "_" + ++tmpIndex + "." + filecombin[1];
                }
                //不带路径的最终文件名  
                filePathName = tmp;

                if (!System.IO.Directory.Exists(localPath))
                    System.IO.Directory.CreateDirectory(localPath);

                file.SaveAs(Path.Combine(tmpName, filePathName));   //保存图片（文件夹）  

                _uploadFile.code = 0;
                _uploadFile.src = Path.Combine("/Upload/img/", filePathName); //name = Path.GetFileNameWithoutExtension(file.FileName),   // 获取文件名不含后缀名  
                _uploadFile.msg = "上传成功";

                //{
                //      "code": 0 //0表示成功，其它失败
                //      ,"msg": "" //提示信息 //一般上传失败后返回
                //      ,"data": {
                //                            "src": "图片路径"
                //        ,"title": "图片名称" //可选
                //      }
                //}


                return Json(_uploadFile);
            }
            catch (Exception)
            {
                return Json(_uploadFile, JsonRequestBehavior.AllowGet);
            }
        }

        public JsonResult LayEditUploadFile()
        {
            Rootobject info = new Rootobject();
            info.data = new Data();
            try
            {
                var file = Request.Files[0]; //获取选中文件
                var filecombin = file.FileName.Split('.');
                if (file == null || string.IsNullOrEmpty(file.FileName) || file.ContentLength == 0 || filecombin.Length < 2)
                {
                    info.code = -1;
                    info.msg = "上传出错!请检查文件名或文件内容";
                    info.data.src = "";
                    info.data.title = "";
                    return Json(info);
                }
                //定义本地路径位置
                string UpImgPath=string.Format("/Upload/LayEdit/{0}",DateTime.Now.ToShortDateString());
                string localPath = Server.MapPath(UpImgPath);
                string filePathName = string.Empty;

                string tmpName = Server.MapPath(UpImgPath);
                var tmp = file.FileName;
                var tmpIndex = 0;
                //判断是否存在相同文件名的文件 相同累加1继续判断  
                while (System.IO.File.Exists(tmpName + tmp))
                {
                    tmp = filecombin[0] + "_" + ++tmpIndex + "." + filecombin[1];
                }
                //不带路径的最终文件名  
                filePathName = tmp;

                if (!System.IO.Directory.Exists(localPath))
                    System.IO.Directory.CreateDirectory(localPath);

                file.SaveAs(Path.Combine(tmpName, filePathName));   //保存图片（文件夹）  

                info.code = 0;
                info.msg = "上传成功";
                info.data.src = Path.Combine(UpImgPath, filePathName);
                info.data.title = "";

                #region 编辑器返回json格式
                //{
                //      "code": 0 //0表示成功，其它失败
                //      ,"msg": "" //提示信息 //一般上传失败后返回
                //      ,"data": 
                //      {
                //          "src": "图片路径"
                //          ,"title": "图片名称" //可选
                //      }
                //}
                #endregion

                return Json(info);
            }
            catch (Exception ex)
            {
                info.code = -1;
                info.msg = ex.Message;
                return Json(info, JsonRequestBehavior.AllowGet);
            }
        }

        public class Rootobject
        {
            public int code { get; set; }
            public string msg { get; set; }
            public Data data { get; set; }
        }

        public class Data
        {
            public string src { get; set; }
            public string title { get; set; }
        }
        

    }
}