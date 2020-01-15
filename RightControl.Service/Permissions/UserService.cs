using RightControl.Common;
using RightControl.IRepository;
using RightControl.IService;
using RightControl.Model;

namespace RightControl.Service
{
    public class UserService : BaseService<UserModel>, IUserService
    {
        public IUserRepository repository { get; set; }
        public IRoleRepository rolesitory { get; set; }
        public UserModel GetDetail(int Id)
        {
            return repository.GetDetail(Id);
        }
        public UserModel CheckLogin(string username, string password)
        {
            return repository.CheckLogin(username, password);
        }
        /// <summary>
        /// 修改密码
        /// </summary>
        /// <param name="model">密码实体</param>
        /// <returns></returns>
        public bool ModifyPwd(PassWordModel model)
        {
            model.OldPassword = Md5.md5(model.OldPassword, 32);
            model.Password = Md5.md5(model.Password, 32);
            return repository.ModifyPwd(model) > 0 ? true : false;
        }
        /// <summary>
        /// 重置密码
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public bool InitPwd(UserModel model)
        {
            return repository.Update(model, "PassWord") > 0 ? true : false;
        }

        public dynamic GetListByFilter(UserModel filter, PageInfo pageInfo, OperatorModel Operator)
        {
            pageInfo.prefix = "u.";
            string _where = " t_User u INNER JOIN t_role r on u.RoleId=r.Id";
            if (!string.IsNullOrEmpty(filter.UserName))
            {
                _where += string.Format(" and {0}UserName=@UserName", pageInfo.prefix);
            }
            if (filter.RoleId != 0)
            {
                _where += string.Format(" and {0}RoleId=@RoleId", pageInfo.prefix);
            }
            if (filter.Status != null)
            {
                _where += string.Format(" and {0}Status=@Status", pageInfo.prefix);
            }
            RoleModel roleInfo=GetRoleModel(Operator);
            if (roleInfo.Self)//如果是个人
            {
                _where += string.Format(" and {0}Id=-1", pageInfo.prefix);
            }
            if(!string.IsNullOrEmpty(roleInfo.Role_List))
            {
                _where += string.Format(" and {0}RoleId in({1})", pageInfo.prefix,roleInfo.Role_List);
            }
            if (!string.IsNullOrEmpty(pageInfo.field))
            {
                pageInfo.field = pageInfo.prefix + pageInfo.field;
            }
            pageInfo.returnFields = string.Format("{0}Id,{0}UserName,{0}RealName,{0}CreateOn,{0}PassWord,{0}Status,{0}RoleId,r.RoleName", pageInfo.prefix);
            return GetPageUnite(baseRepository, pageInfo, _where, filter);
        }

        public RoleModel GetRoleModel(OperatorModel Operator)
        {
            RoleModel info=rolesitory.Read(Operator.RoleId);
            return info;
        }
    }
}
