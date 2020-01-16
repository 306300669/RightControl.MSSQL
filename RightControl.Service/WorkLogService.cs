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
        public IRoleRepository role_repository { get; set; }
        public IUserRepository user_repository { get; set; }


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
            RoleModel roleInfo = GetRoleModel(Operator);
            if (roleInfo.Self)
            {
                _where += string.Format(" and {0}CreateBy={1}", pageInfo.prefix, Operator.UserId);
            }
            string UserArea=GetUserIdStr(Operator);
            if (!string.IsNullOrEmpty(UserArea))
            {
                _where += string.Format(" and {0}CreateBy in ({1})", pageInfo.prefix, UserArea);
            }
            if (!string.IsNullOrEmpty(pageInfo.field))
            {
                pageInfo.field = pageInfo.prefix + pageInfo.field;
            }
            pageInfo.returnFields = string.Format(@"{0}Id,{0}wk_title,{0}wk_content,{0}Status,{0}CreateOn,{0}UpdateOn,{0}CreateBy,{0}UpdateBy,
                                                    us.RealName", pageInfo.prefix);
            return GetPageUnite(baseRepository, pageInfo, _where, filter);
        }
        public RoleModel GetRoleModel(OperatorModel Operator)
        {
            RoleModel info = role_repository.Read(Operator.RoleId);
            return info;
        }
        public string GetUserIdStr(OperatorModel Operator)
        {
            RoleModel info = GetRoleModel(Operator);
            StringBuilder userStr = new StringBuilder();
            if (!string.IsNullOrEmpty(info.Role_List))
            {
                string[] roleArr = info.Role_List.Split(',');
                foreach (string item in roleArr)
                {
                    IEnumerable<UserModel> list = user_repository.GetByWhere(string.Format(" where RoleId={0}", item));
                    if (list.Count() > 0)
                    {
                        foreach (UserModel itemInfo in list)
                        {
                            userStr.AppendFormat("{0},", itemInfo.Id);
                        }
                    }

                }
            }
            string res = userStr.ToString();
            if (!string.IsNullOrEmpty(res))
                return res.Trim(',');
            else return "";
        }

    }
}
