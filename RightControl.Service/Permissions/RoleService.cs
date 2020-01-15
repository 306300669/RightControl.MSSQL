using RightControl.Common;
using RightControl.IRepository;
using RightControl.IService;
using RightControl.Model;
using RightControl.Repository;
using System.Collections.Generic;

namespace RightControl.Service
{
    public class RoleService : BaseService<RoleModel>, IRoleService
    {
        public IRoleRepository repository { get; set; }
        public IEnumerable<RoleModel> GetRoleList()
        {
            return repository.GetRoleList();
        }
        public dynamic GetListByFilter(RoleModel filter, PageInfo pageInfo, OperatorModel Operator)
        {
            string _where = " where 1=1";
            if (!string.IsNullOrEmpty(filter.RoleName))
            {
                _where += " and RoleName=@RoleName";
            }
            if (filter.Status != null)
            {
                _where += " and Status=@Status";
            }
            RoleModel roleModel= GetRoleModel(Operator);

            if (!string.IsNullOrEmpty(roleModel.Role_List))//角色范围
            {
                _where += string.Format(" and Id in({0})", roleModel.Role_List);
            }
            if(roleModel.Self)//是否个人
            {
                _where += string.Format(" and Id =-1");
            }
            return GetListByFilter(filter, pageInfo, _where);
        }

        public bool DeleteRoleAllByRoleId(int roleId)
        {
            return repository.DeleteRoleAllByRoleId(roleId);
        }

        /// <summary>
        /// 根据用户ID获取角色信息
        /// </summary>
        /// <param name="filter"></param>
        /// <param name="Operator"></param>
        /// <returns></returns>
        //public RoleModel GetRoleInfoByRoleId(RoleModel filter, OperatorModel Operator)
        //{
        //    using (var conn = SqlHelper.SqlConnection())
        //    {
        //        var sql = @"[Id]      ,[RoleCode]      ,[RoleName]      ,[Remark]      ,[Status]      ,[CreateOn]      ,[UpdateOn]      ,[CreateBy]      ,[UpdateBy]      ,[Role_List]      ,[Self] from t_role where 1=1 ";
        //        if (Operator.UserId!=0)
        //        {
        //            sql += " and Id=@Id and Status=1";
        //        }
        //        return conn.<RoleModel>(sql, new { Id = Operator.UserId }).FirstOrDefault();
        //    }
        //}

        public RoleModel GetRoleModel(OperatorModel Operator)
        {
            return repository.Read(Operator.RoleId);
        }

    }
}
