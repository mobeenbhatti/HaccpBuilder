using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Update;

namespace SchoolHaccp.BusinessLogic
{
    
    public class ProcessSetProceduralResponse : IBusinessLogic
    {
        private ProceduralResponse m_ProceduralResponse;

        public ProcessSetProceduralResponse()
        {
        }

        public void Invoke()
        {
            SetProceduralResponse setProceduralResponse = new SetProceduralResponse();
            setProceduralResponse.ProceduralResponse = this.m_ProceduralResponse;
            setProceduralResponse.Update();
        }

        public ProceduralResponse ProceduralResponse
        {
            get { return m_ProceduralResponse; }
            set { m_ProceduralResponse = value; }
        }
    }
}
