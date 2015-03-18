using System;
using System.Collections.Generic;
using System.Text;

using SchoolHaccp.Common;
using SchoolHaccp.DataAccess.Insert;

namespace SchoolHaccp.BusinessLogic
{
    
    public class ProcessCreateProceduralResponse : IBusinessLogic
    {
        private ProceduralResponse m_ProceduralResponse;

        public ProcessCreateProceduralResponse()
        {
        }

        public void Invoke()
        {
            CreateProceduralResponse createProceduralResponse = new CreateProceduralResponse();
            createProceduralResponse.ProceduralResponse = this.m_ProceduralResponse;
            createProceduralResponse.Insert();
            this.m_ProceduralResponse = createProceduralResponse.ProceduralResponse;
        }
        public void Invoke(string strMode)
        {
            CreateProceduralResponse createProceduralResponse = new CreateProceduralResponse();
            createProceduralResponse.ProceduralResponse = this.m_ProceduralResponse;
            createProceduralResponse.Insert("php");
        }

        public ProceduralResponse ProceduralResponse
        {
            get { return m_ProceduralResponse; }
            set { m_ProceduralResponse = value; }
        }
    }
}
