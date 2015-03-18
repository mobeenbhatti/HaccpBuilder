using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SchoolHaccp.Common
{
    public enum DistrictTypeEnum : int
    {
        /// <summary>
        /// HaccpBuilder 
        /// </summary>
        HaccpBuilder = 1,
        /// <summary>
        /// HacpBuilder & CTPAT 
        /// </summary>
        HaccpCtpat = 4,
        /// <summary>
        ///  CTPAT 
        /// </summary>
        Ctpat = 5
    }
}
