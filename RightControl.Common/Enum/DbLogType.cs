using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RightControl.Common
{
    public enum DbLogType
    {
        [Description("其他")]
        Other = 0,
        [Description("登录")]
        Login = 1,
        [Description("退出")]
        Exit = 2,
        [Description("访问")]
        Visit = 3,
        [Description("新增")]
        Create = 4,
        [Description("删除")]
        Delete = 5,
        [Description("修改")]
        Update = 6,
        [Description("提交")]
        Submit = 7,
        [Description("异常")]
        Exception = 8
    }

    public enum Project
    {
        //[Description("项目")]
        //project = 0,
        [Description("郑州")]
        zhengzhou = 1,
        [Description("其他")]
        other = 2,
    }

    public enum Department
    {
        //[Description("项目")]
        //project = 0,
        [Description("程序部")]
        chengxu = 1,
        [Description("策划部")]
        cehua = 2,        
        [Description("人事部")]
        hr = 3,
        [Description("客服部")]
        kefu = 4,
        [Description("品牌管理部")]
        pinpaiguanli = 5,
        [Description("其他")]
        other = 6,
    }
}
