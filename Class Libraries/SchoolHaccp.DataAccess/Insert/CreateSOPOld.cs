using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Insert 
{
  public  class CreateSOPOld : DataAccessBase
    {
        private SOPOld m_SOP;

		public CreateSOPOld()
		{
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_InsertSOPByGroupId.ToString();
		}

		public void Insert()
		{

            CreateSOPOldDataParameters createParameters = new CreateSOPOldDataParameters(this.m_SOP);
            DataServices dataServices = new DataServices(base.StoredProcedureName);
            object returnValue = dataServices.ExecuteScalar(createParameters.Parameters); 
           
		}
        //public void Insert(int nNew)
        //{

        //    object[] parameters = new object[45];
        //    parameters[0] = this.SOP.CorrectiveAction1;
        //    parameters[1] = this.SOP.CorrectiveAction2;
        //    parameters[2] = this.SOP.CorrectiveAction3;
        //    parameters[3] = this.SOP.CorrectiveAction4;
        //    parameters[4] = this.SOP.CorrectiveAction5;
        //    parameters[5] = this.SOP.CustomSOP;
        //    parameters[6] = this.SOP.DistrictId;
        //    parameters[7] = this.SOP.FacilityLocation;
        //    parameters[8] = this.SOP.GlobalSOPId;
        //    parameters[9] = this.SOP.Instructions1;
        //    parameters[10] = this.SOP.Instructions2;
        //    parameters[11] = this.SOP.Instructions3;
        //    parameters[12] = this.SOP.Instructions4;
        //    parameters[13] = this.SOP.Instructions5;
        //    parameters[14] = this.SOP.Instructions6;
        //    parameters[15] = this.SOP.Instructions7;
        //    parameters[16] = this.SOP.Instructions8;
        //    parameters[17] = this.SOP.Instructions9;
        //    parameters[18] = this.SOP.Instructions10;
        //    parameters[19] = this.SOP.Instructions11;
        //    parameters[20] = this.SOP.Instructions12;
        //    parameters[21] = this.SOP.Instructions13;
        //    parameters[22] = this.SOP.Instructions14;
        //    parameters[23] = this.SOP.Instructions15;
        //    parameters[24] = this.SOP.Instructions16;
        //    parameters[25] = this.SOP.Instructions17;
        //    parameters[26] = this.SOP.Instructions18;
        //    parameters[27] = this.SOP.Instructions19;
        //    parameters[28] = this.SOP.Instructions20;
        //    parameters[29] = this.SOP.Keywords;
        //    parameters[30] = this.SOP.KitchenGroupId;
        //    parameters[31] = this.SOP.Monitoring1;
        //    parameters[32] = this.SOP.Monitoring2;
        //    parameters[33] = this.SOP.Monitoring3;
        //    parameters[34] = this.SOP.Monitoring4;
        //    parameters[35] = this.SOP.Monitoring5;
        //    parameters[36] = this.SOP.Monitoring6;
        //    parameters[37] = this.SOP.Monitoring7;
        //    parameters[38] = this.SOP.Purpose;
        //    parameters[39] = this.SOP.Scope;
        //    parameters[40] = this.SOP.SOPId;
        //    parameters[41] = this.SOP.SOPKey;
        //    parameters[42] = this.SOP.Title;
        //    parameters[43] = this.SOP.Verification;
        //    parameters[44] = this.SOP.IsAdded;
        //    DataServices dataServices = new DataServices(base.StoredProcedureName);
        //    object returnValue = dataServices.ExecuteScalar("uspAdm_InsertSOP",parameters);

        //}

        public SOPOld SOP
		{
            get { return m_SOP; }
            set { m_SOP = value; }
		}
	}

	public class CreateSOPOldDataParameters
	{
		private SOPOld m_SOP;
		object[] m_Parameters;

        public CreateSOPOldDataParameters(SOPOld SOP)
		{
            this.m_SOP = SOP;
			Build();
		}

		private void Build()
		{
            object[] parameters = new object[46];
            parameters[0] = this.SOP.CorrectiveAction1;
            parameters[1] = this.SOP.CorrectiveAction2;
            parameters[2] = this.SOP.CorrectiveAction3;
            parameters[3] = this.SOP.CorrectiveAction4;
            parameters[4] = this.SOP.CorrectiveAction5;
            parameters[5] = this.SOP.CustomSOP;
            parameters[6] = this.SOP.DistrictId;
            parameters[7] = this.SOP.FacilityLocation;
            parameters[8] = this.SOP.GlobalSOPId;
            parameters[9] = this.SOP.Instructions1;
            parameters[10] = this.SOP.Instructions2;
            parameters[11] = this.SOP.Instructions3;
            parameters[12] = this.SOP.Instructions4;
            parameters[13] = this.SOP.Instructions5;
            parameters[14] = this.SOP.Instructions6;
            parameters[15] = this.SOP.Instructions7;
            parameters[16] = this.SOP.Instructions8;
            parameters[17] = this.SOP.Instructions9;
            parameters[18] = this.SOP.Instructions10;
            parameters[19] = this.SOP.Instructions11;
            parameters[20] = this.SOP.Instructions12;
            parameters[21] = this.SOP.Instructions13;
            parameters[22] = this.SOP.Instructions14;
            parameters[23] = this.SOP.Instructions15;
            parameters[24] = this.SOP.Instructions16;
            parameters[25] = this.SOP.Instructions17;
            parameters[26] = this.SOP.Instructions18;
            parameters[27] = this.SOP.Instructions19;
            parameters[28] = this.SOP.Instructions20;
            parameters[29] = this.SOP.Keywords;
            parameters[30] = this.SOP.KitchenGroupId;
            parameters[31] = this.SOP.Monitoring1;
            parameters[32] = this.SOP.Monitoring2;
            parameters[33] = this.SOP.Monitoring3;
            parameters[34] = this.SOP.Monitoring4;
            parameters[35] = this.SOP.Monitoring5; 
            parameters[36] = this.SOP.Monitoring6;
            parameters[37] = this.SOP.Monitoring7;
            parameters[38] = this.SOP.Purpose;
            parameters[39] = this.SOP.Scope;
            parameters[40] = this.SOP.SOPId;
            parameters[41] = this.SOP.SOPKey;
            parameters[42] = this.SOP.Title;
            parameters[43] = this.SOP.Verification;
            parameters[44] = this.SOP.IsAdditional;
            parameters[45] = this.SOP.Removed;
            Parameters = parameters;
		}

        public SOPOld SOP
		{
            get { return m_SOP; }
            set { m_SOP = value; }
		}

		public object[] Parameters
		{
			get { return m_Parameters; }
			set { m_Parameters = value; }
		}
	}
}
