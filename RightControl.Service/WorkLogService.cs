using RightControl.Common;
using RightControl.IRepository;
using RightControl.IService;
using RightControl.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RightControl.Service
{
    public class WorkLogService : BaseService<WorkLogModel>, IWorkLogService
    {
        public IWorkLogRepository repository { get; set; }

        public WorkLogModel GetDetail(int Id)
        {
            return repository.GetDetail(Id);
        }

        public dynamic GetListByFilter(WorkLogModel filter, PageInfo pageInfo, OperatorModel Operator)
        {
            pageInfo.prefix = "log.";
            string _where = " t_workLog log INNER JOIN t_user us on log.CreateBy=us.Id";
            if (!string.IsNullOrEmpty(filter.wk_title))//标题
            {
                _where += string.Format(" and {0}wk_title like '%@wk_title'", pageInfo.prefix);
            }
            if (filter.CreateBy != 0)//发布人
            {
                _where += string.Format(" and {0}CreateBy=@CreateBy", pageInfo.prefix);
            }
            if (filter.wk_ReadStatus != 0)//阅读状态
            {
                _where += string.Format(" and {0}wk_ReadStatus=@wk_ReadStatus", pageInfo.prefix);
            }
            if (!string.IsNullOrEmpty(pageInfo.field))
            {
                pageInfo.field = pageInfo.prefix + pageInfo.field;
            }
            pageInfo.returnFields = string.Format(@"{0}Id,{0}wk_title,{0}wk_content,{0}Status,{0}CreateOn,{0}UpdateOn,{0}CreateBy,{0}UpdateBy,
                                                    us.RealName", pageInfo.prefix);
            return GetPageUnite(baseRepository, pageInfo, _where, filter);
        }
    }
}
