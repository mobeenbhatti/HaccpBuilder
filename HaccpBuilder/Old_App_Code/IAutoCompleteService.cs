﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;

// NOTE: If you change the interface name "IAutoCompleteService" here, you must also update the reference to "IAutoCompleteService" in Web.config.
[ServiceContract]
public interface IAutoCompleteService
{   

    [OperationContract]
    string[] GetMenuItems(string prefixText);
}
