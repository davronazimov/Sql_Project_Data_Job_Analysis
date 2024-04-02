/*
Question: What are the top-paying data analyst jobs?
- Identify the top 10 highest-paying Data Analyst roles in United States.
- Focus on job postings with specified salaries (remove nulls).
- BONUS: Include company names of top 10 roles
*/

SELECT
    job_id,
    job_title,
    job_location,
    salary_year_avg,
    name AS company_name
FROM job_postings_fact
LEFT JOIN company_dim 
    ON job_postings_fact.company_id = company_dim.company_id
WHERE 
    job_title_short = 'Data Analyst' AND
    job_country = 'United States' AND 
    salary_year_avg IS NOT NULL
ORDER BY 
    salary_year_avg DESC
LIMIT 10;


/*
 Here's the breakdown of the top data analyst jobs in United States:
Salary Range: Top 10 paying data analyst roles span from $254,000 to $375,000, indicating significant salary potential in the field.
Diverse Employers: Companies like Illuminate Mission Solutions, Torc Robotics, and Illuminate Mission Solutions are among those offering high salaries.
Job Title Variety: There's a high diversity in job titles, from HC Data Analyst to Director of Safety Data Analysis, 
reflecting varied roles and specializations within data analytics.


    RESULT
===============

[
  {
    "job_id": 1110602,
    "job_title": "HC Data Analyst , Senior",
    "job_location": "Bethesda, MD",
    "salary_year_avg": "375000.0",
    "company_name": "Illuminate Mission Solutions"
  },
  {
    "job_id": 229253,
    "job_title": "Director of Safety Data Analysis",
    "job_location": "Austin, TX",
    "salary_year_avg": "375000.0",
    "company_name": "Torc Robotics"
  },
  {
    "job_id": 1147675,
    "job_title": "Sr Data Analyst",
    "job_location": "Bethesda, MD",
    "salary_year_avg": "375000.0",
    "company_name": "Illuminate Mission Solutions"
  },
  {
    "job_id": 641501,
    "job_title": "Head of Infrastructure Management & Data Analytics - Financial...",
    "job_location": "Jacksonville, FL",
    "salary_year_avg": "375000.0",
    "company_name": "Citigroup, Inc"
  },
  {
    "job_id": 101757,
    "job_title": "Head of Data Analytics",
    "job_location": "Austin, TX",
    "salary_year_avg": "350000.0",
    "company_name": "Care.com"
  },
  {
    "job_id": 1059665,
    "job_title": "Data Analyst",
    "job_location": "San Francisco, CA",
    "salary_year_avg": "350000.0",
    "company_name": "Anthropic"
  },
  {
    "job_id": 547382,
    "job_title": "Director of Analytics",
    "job_location": "Anywhere",
    "salary_year_avg": "336500.0",
    "company_name": "Meta"
  },
  {
    "job_id": 894135,
    "job_title": "Research Scientist",
    "job_location": "San Francisco, CA",
    "salary_year_avg": "285000.0",
    "company_name": "OpenAI"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "job_location": "Anywhere",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T"
  },
  {
    "job_id": 285766,
    "job_title": "Partner Technology Manager, Data Analytics and AI",
    "job_location": "Austin, TX",
    "salary_year_avg": "254000.0",
    "company_name": "Google"
  }
]

*/