using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Laptopp.Models
{
    public class ReportInfo
    {
        public int id { get; set; }
        public string Name { get; set; }
        public Nullable<int> Sum { get; set; }
        public Nullable<int> Count { get; set; }
        public Nullable<decimal> Avg { get; set; }
        public Nullable<decimal> Max { get; set; }
        public Nullable<decimal> Min { get; set; }

    }
}