using RightControl.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RightControl.IService
{
    public interface IWorkLogService : IBaseService<WorkLogModel>
    {
        WorkLogModel GetDetail(int Id);
    }
}
