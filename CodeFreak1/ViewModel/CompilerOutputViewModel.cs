﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace CodeFreak1.ViewModel
{
    public class CompilerOutputViewModel:RequestStatus
    {
        public List<SubmissionProblemTestCaseViewModel> TestcasesResult { get; set; }
    }
}
