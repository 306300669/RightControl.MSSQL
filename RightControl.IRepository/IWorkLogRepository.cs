using RightControl.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RightControl.IRepository
{
    public interface IWorkLogRepository : IBaseRepository<WorkLogModel>
    {
        WorkLogModel GetDetail(int Id);
    }
}
