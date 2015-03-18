using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Delete;

namespace SchoolHaccp.BusinessLogic
{
    public class ProcessDeleteKitchenCtpatGroup : IBusinessLogic
    {
        private KitchenCtpatGroup m_KitchenCtpatGroup;

        public ProcessDeleteKitchenCtpatGroup()
        {
        }

        public void Invoke()
        {
            DeleteKitchenCtpatGroup deleteKitchenCtpatGroup = new DeleteKitchenCtpatGroup();
            deleteKitchenCtpatGroup.KitchenCtpatGroup = this.m_KitchenCtpatGroup;
            deleteKitchenCtpatGroup.Delete();
        }


        public KitchenCtpatGroup KitchenCtpatGroup
        {
            get { return m_KitchenCtpatGroup; }
            set { m_KitchenCtpatGroup = value; }
        }
    }
}
