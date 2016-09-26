﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer.Interfaces
{
    interface IStatisticService
    {
        Statistic GetStatistics(DateTime orderDate, DateTime shippedDate);
    }
}
