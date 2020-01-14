using Dapper;
using RightControl.IRepository;
using RightControl.Model;
using System.Linq;

namespace RightControl.Repository
{
    public class WorkLogRepository : BaseRepository<WorkLogModel>, IWorkLogRepository
    {
        public WorkLogModel GetDetail(int Id)
        {
            using (var conn = SqlHelper.SqlConnection())
            {
                //var sql = "select u.*,r.RoleName from t_User u INNER JOIN t_role r on u.RoleId=r.Id AND u.Id=@Id";
                var sql = "select log.*,us.RealName,us.UserName from t_worklog log INNER JOIN t_user us on log.CreateBy=us.Id AND log.Id=@Id";
                return conn.Query<WorkLogModel>(sql, new { Id }).FirstOrDefault();
            }
        }
    }
}
