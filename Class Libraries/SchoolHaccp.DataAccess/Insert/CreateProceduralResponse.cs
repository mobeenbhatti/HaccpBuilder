using System;
using System.Collections.Generic;
using System.Text;
using SchoolHaccp.Common;
namespace SchoolHaccp.DataAccess.Insert
{
    public class CreateProceduralResponse : DataAccessBase
    {
        private ProceduralResponse m_ProceduralResponse;

        public CreateProceduralResponse()
        {
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_InsertProceduralResponse.ToString();
        }

        public void Insert()
        {
            // int ProceduralResponseId = 0;
            CreateProceduralResponseDataParameters createParameters = new CreateProceduralResponseDataParameters(this.m_ProceduralResponse);
            DataServices dataServices = new DataServices(base.StoredProcedureName);

            object returnValue = dataServices.ExecuteScalar(createParameters.Parameters);

            //using (DataServices dataServices = new DataServices(base.StoredProcedureName))
            //{
            //try
            //{
            //    object returnValue = dataServices.ExecuteScalar(createParameters.Parameters);
            //    if (!int.TryParse(returnValue.ToString(), out ProceduralResponseId))
            //    {
            //        throw new Exception("Failed to retrieve ID value.");
            //    }
            //}
            //catch (Exception ex)
            //{
            //    throw ex;
            //}
            //	this.m_WebBenefits.WebBenefitsId = webBenefitsId;
            //}
        }
        public void Insert(string strMode)
        {
            object[] parameters = new object[5];
            parameters[0] = this.m_ProceduralResponse.KitchenId;
            parameters[1] = this.m_ProceduralResponse.QuestionId;
            parameters[2] = this.m_ProceduralResponse.Response;
            parameters[3] = this.m_ProceduralResponse.CorrectiveAction;
           
            DataServices dataServices = new DataServices("uspAdm_InsertProceduralResponsePHP");
            object returnValue = dataServices.ExecuteScalar(parameters);

        }

        public ProceduralResponse ProceduralResponse
        {
            get { return m_ProceduralResponse; }
            set { m_ProceduralResponse = value; }
        }
    }

    public class CreateProceduralResponseDataParameters
    {
        private ProceduralResponse m_ProceduralResponse;
        object[] m_Parameters;

        public CreateProceduralResponseDataParameters(ProceduralResponse ProceduralResponse)
        {
            this.m_ProceduralResponse = ProceduralResponse;
            Build();
        }

        private void Build()
        {
            object[] parameters = new object[4];
            parameters[0] = this.m_ProceduralResponse.Response;
            parameters[1] = this.m_ProceduralResponse.QuestionId;
            parameters[2] = this.m_ProceduralResponse.CorrectiveAction;
            parameters[3] = this.m_ProceduralResponse.KitchenId;
            this.m_Parameters = parameters;
        }

        public ProceduralResponse ProceduralResponse
        {
            get { return m_ProceduralResponse; }
            set { m_ProceduralResponse = value; }
        }

        public object[] Parameters
        {
            get { return m_Parameters; }
            set { m_Parameters = value; }
        }
    }
}
