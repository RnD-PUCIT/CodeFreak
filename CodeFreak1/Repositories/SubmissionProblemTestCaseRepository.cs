﻿using CodeFreak1.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace CodeFreak1.Repositories
{
    public class SubmissionProblemTestCaseRepository
    {

        private DBCodeFreakContext db;

        public SubmissionProblemTestCaseRepository()
        {
            db = new DBCodeFreakContext();

        }
        public int addSubmissionProblemTestCase(SubmissionProblemTestCase submissionprobTest)
        {
            int status = 0;

            db.SubmissionProblemTestCase.Add(submissionprobTest);
            db.SaveChanges();

            return status;
        }

        public List<SubmissionProblemTestCase> getSubmissionProblemTestCase(Guid sId)
        {
            List<SubmissionProblemTestCase> lit = new List<SubmissionProblemTestCase>();

            lit=db.SubmissionProblemTestCase.Where(s => s.SubmissionId == sId).ToList<SubmissionProblemTestCase>();


            return lit;
        }



    }
}
