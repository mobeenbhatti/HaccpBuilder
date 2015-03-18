using System;
using System.Collections.Generic;
using System.Text;
using SchoolHaccp.Common;

namespace SchoolHaccp.DataAccess.Update
{
    
    public class SetProceduralResponse : DataAccessBase
    {
        private ProceduralResponse m_ProceduralResponse;

        public SetProceduralResponse()
        {
            //Yet to set store procedure
            base.StoredProcedureName = StoredProcedure.Name.uspAdm_UpdateProceduralResponses.ToString();
        }

        public void Update()
        {
            SetProceduralResponseParameters setParameters = new SetProceduralResponseParameters(this.m_ProceduralResponse);
            DataServices dataServices = new DataServices(base.StoredProcedureName);
            dataServices.ExecuteNonQuery(setParameters.Parameters);
        }

        public ProceduralResponse ProceduralResponse
        {
            get { return m_ProceduralResponse; }
            set { m_ProceduralResponse = value; }
        }
    }

    public class SetProceduralResponseParameters
    {
        private ProceduralResponse m_ProceduralResponse;
        object[] m_Parameters;

        public SetProceduralResponseParameters(ProceduralResponse Proceduralresponse)
        {
            this.m_ProceduralResponse = Proceduralresponse;
            Build();
        }

        private void Build()
        {
            object[] parameters = new object[5];
            parameters[0] = this.m_ProceduralResponse.ResponseId;
            parameters[1] = this.m_ProceduralResponse.Response;
            parameters[2] = this.m_ProceduralResponse.QuestionId;
            parameters[3] = this.m_ProceduralResponse.CorrectiveAction;
            parameters[4] = this.m_ProceduralResponse.KitchenId;
           

            Parameters = parameters;
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
