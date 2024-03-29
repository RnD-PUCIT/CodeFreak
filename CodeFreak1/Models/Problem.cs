﻿using System;
using System.Collections.Generic;

namespace CodeFreak1.Models
{
    public partial class Problem
    {
        public Problem()
        {
            Comment = new HashSet<Comment>();
            Editorial = new HashSet<Editorial>();
            EventProblems = new HashSet<EventProblems>();
            ProblemTestCase = new HashSet<ProblemTestCase>();
            Rating = new HashSet<Rating>();
            Submission = new HashSet<Submission>();
        }

        public Guid ProblemId { get; set; }
        public Guid AuthorId { get; set; }
        public int ProblemTypeId { get; set; }
        public int DifficultyId { get; set; }
        public string Description { get; set; }
        public int? MaxScore { get; set; }
        public int NoOfSubmission { get; set; }
        public DateTime? PostDateTime { get; set; }
        public int? NoOfTestCaseFiles { get; set; }
        public string Title { get; set; }
        public bool IsPublic { get; set; }

        public Users Author { get; set; }
        public Difficulty Difficulty { get; set; }
        public ProblemType ProblemType { get; set; }
        public ICollection<Comment> Comment { get; set; }
        public ICollection<Editorial> Editorial { get; set; }
        public ICollection<EventProblems> EventProblems { get; set; }
        public ICollection<ProblemTestCase> ProblemTestCase { get; set; }
        public ICollection<Rating> Rating { get; set; }
        public ICollection<Submission> Submission { get; set; }
    }
}
