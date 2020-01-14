using DapperExtensions;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RightControl.Model
{
    [Table("t_worklog")]
    public class WorkLogModel:Entity
    {
        /// <summary>
        /// 日志标题
        /// </summary>
        [Display(Name = "日志标题")]
        public string wk_title { get; set; }

        /// <summary>
        /// 日志内容
        /// </summary>
        [Display(Name = "日志内容")]
        public string wk_content { get; set; }

        /// <summary>
        /// 阅读状态
        /// </summary>
        [Display(Name = "阅读状态")]
        public int wk_ReadStatus { get; set; }

        [Display(Name = "所属项目")]
        public int project_id { get; set; }

        [Display(Name = "所属部门")]
        public int department_id { get; set; }

        [Computed]
        [Display(Name = "添加人")]
        public string RealName { get; set; }
    }
}
