
/*
Question: What skills are required for the top-paying data analyst jobs?
- Use the top 10 highest-paying Data Analyst jobs from first query
- Add the specific skills required for these roles
- Why? It provides a detailed look at which high-paying jobs demand certain skills, 
    helping job seekers understand which skills to develop that align with top salaries
*/

WITH top_paying_jobs AS (
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
  LIMIT 10
)

SELECT 
    top_paying_jobs.*,
    skills
FROM top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
    salary_year_avg DESC;

/*
    Here's the breakdown of the most demanded skills for data analysts in United States, based on job postings:
    SQL and Python are leading with a count of 5.
    Excel, R, Tableau and Power BI follows closely with a count of 4.
 


    RESULT
=============


[
  {
    "job_id": 1110602,
    "job_title": "HC Data Analyst , Senior",
    "job_location": "Bethesda, MD",
    "salary_year_avg": "375000.0",
    "company_name": "Illuminate Mission Solutions",
    "skills": "python"
  },
  {
    "job_id": 1110602,
    "job_title": "HC Data Analyst , Senior",
    "job_location": "Bethesda, MD",
    "salary_year_avg": "375000.0",
    "company_name": "Illuminate Mission Solutions",
    "skills": "r"
  },
  {
    "job_id": 1110602,
    "job_title": "HC Data Analyst , Senior",
    "job_location": "Bethesda, MD",
    "salary_year_avg": "375000.0",
    "company_name": "Illuminate Mission Solutions",
    "skills": "vba"
  },
  {
    "job_id": 1110602,
    "job_title": "HC Data Analyst , Senior",
    "job_location": "Bethesda, MD",
    "salary_year_avg": "375000.0",
    "company_name": "Illuminate Mission Solutions",
    "skills": "excel"
  },
  {
    "job_id": 1110602,
    "job_title": "HC Data Analyst , Senior",
    "job_location": "Bethesda, MD",
    "salary_year_avg": "375000.0",
    "company_name": "Illuminate Mission Solutions",
    "skills": "tableau"
  },
  {
    "job_id": 229253,
    "job_title": "Director of Safety Data Analysis",
    "job_location": "Austin, TX",
    "salary_year_avg": "375000.0",
    "company_name": "Torc Robotics",
    "skills": "sql"
  },
  {
    "job_id": 229253,
    "job_title": "Director of Safety Data Analysis",
    "job_location": "Austin, TX",
    "salary_year_avg": "375000.0",
    "company_name": "Torc Robotics",
    "skills": "python"
  },
  {
    "job_id": 229253,
    "job_title": "Director of Safety Data Analysis",
    "job_location": "Austin, TX",
    "salary_year_avg": "375000.0",
    "company_name": "Torc Robotics",
    "skills": "r"
  },
  {
    "job_id": 229253,
    "job_title": "Director of Safety Data Analysis",
    "job_location": "Austin, TX",
    "salary_year_avg": "375000.0",
    "company_name": "Torc Robotics",
    "skills": "sas"
  },
  {
    "job_id": 229253,
    "job_title": "Director of Safety Data Analysis",
    "job_location": "Austin, TX",
    "salary_year_avg": "375000.0",
    "company_name": "Torc Robotics",
    "skills": "matlab"
  },
  {
    "job_id": 229253,
    "job_title": "Director of Safety Data Analysis",
    "job_location": "Austin, TX",
    "salary_year_avg": "375000.0",
    "company_name": "Torc Robotics",
    "skills": "spark"
  },
  {
    "job_id": 229253,
    "job_title": "Director of Safety Data Analysis",
    "job_location": "Austin, TX",
    "salary_year_avg": "375000.0",
    "company_name": "Torc Robotics",
    "skills": "airflow"
  },
  {
    "job_id": 229253,
    "job_title": "Director of Safety Data Analysis",
    "job_location": "Austin, TX",
    "salary_year_avg": "375000.0",
    "company_name": "Torc Robotics",
    "skills": "excel"
  },
  {
    "job_id": 229253,
    "job_title": "Director of Safety Data Analysis",
    "job_location": "Austin, TX",
    "salary_year_avg": "375000.0",
    "company_name": "Torc Robotics",
    "skills": "tableau"
  },
  {
    "job_id": 229253,
    "job_title": "Director of Safety Data Analysis",
    "job_location": "Austin, TX",
    "salary_year_avg": "375000.0",
    "company_name": "Torc Robotics",
    "skills": "power bi"
  },
  {
    "job_id": 229253,
    "job_title": "Director of Safety Data Analysis",
    "job_location": "Austin, TX",
    "salary_year_avg": "375000.0",
    "company_name": "Torc Robotics",
    "skills": "sas"
  },
  {
    "job_id": 641501,
    "job_title": "Head of Infrastructure Management & Data Analytics - Financial...",
    "job_location": "Jacksonville, FL",
    "salary_year_avg": "375000.0",
    "company_name": "Citigroup, Inc",
    "skills": "excel"
  },
  {
    "job_id": 641501,
    "job_title": "Head of Infrastructure Management & Data Analytics - Financial...",
    "job_location": "Jacksonville, FL",
    "salary_year_avg": "375000.0",
    "company_name": "Citigroup, Inc",
    "skills": "word"
  },
  {
    "job_id": 1059665,
    "job_title": "Data Analyst",
    "job_location": "San Francisco, CA",
    "salary_year_avg": "350000.0",
    "company_name": "Anthropic",
    "skills": "sql"
  },
  {
    "job_id": 1059665,
    "job_title": "Data Analyst",
    "job_location": "San Francisco, CA",
    "salary_year_avg": "350000.0",
    "company_name": "Anthropic",
    "skills": "python"
  },
  {
    "job_id": 101757,
    "job_title": "Head of Data Analytics",
    "job_location": "Austin, TX",
    "salary_year_avg": "350000.0",
    "company_name": "Care.com",
    "skills": "sql"
  },
  {
    "job_id": 101757,
    "job_title": "Head of Data Analytics",
    "job_location": "Austin, TX",
    "salary_year_avg": "350000.0",
    "company_name": "Care.com",
    "skills": "python"
  },
  {
    "job_id": 101757,
    "job_title": "Head of Data Analytics",
    "job_location": "Austin, TX",
    "salary_year_avg": "350000.0",
    "company_name": "Care.com",
    "skills": "r"
  },
  {
    "job_id": 101757,
    "job_title": "Head of Data Analytics",
    "job_location": "Austin, TX",
    "salary_year_avg": "350000.0",
    "company_name": "Care.com",
    "skills": "bigquery"
  },
  {
    "job_id": 101757,
    "job_title": "Head of Data Analytics",
    "job_location": "Austin, TX",
    "salary_year_avg": "350000.0",
    "company_name": "Care.com",
    "skills": "snowflake"
  },
  {
    "job_id": 101757,
    "job_title": "Head of Data Analytics",
    "job_location": "Austin, TX",
    "salary_year_avg": "350000.0",
    "company_name": "Care.com",
    "skills": "tableau"
  },
  {
    "job_id": 101757,
    "job_title": "Head of Data Analytics",
    "job_location": "Austin, TX",
    "salary_year_avg": "350000.0",
    "company_name": "Care.com",
    "skills": "power bi"
  },
  {
    "job_id": 101757,
    "job_title": "Head of Data Analytics",
    "job_location": "Austin, TX",
    "salary_year_avg": "350000.0",
    "company_name": "Care.com",
    "skills": "looker"
  },
  {
    "job_id": 894135,
    "job_title": "Research Scientist",
    "job_location": "San Francisco, CA",
    "salary_year_avg": "285000.0",
    "company_name": "OpenAI",
    "skills": "github"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "job_location": "Anywhere",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T",
    "skills": "sql"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "job_location": "Anywhere",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T",
    "skills": "python"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "job_location": "Anywhere",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T",
    "skills": "r"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "job_location": "Anywhere",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T",
    "skills": "azure"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "job_location": "Anywhere",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T",
    "skills": "databricks"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "job_location": "Anywhere",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T",
    "skills": "aws"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "job_location": "Anywhere",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T",
    "skills": "pandas"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "job_location": "Anywhere",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T",
    "skills": "pyspark"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "job_location": "Anywhere",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T",
    "skills": "jupyter"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "job_location": "Anywhere",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T",
    "skills": "excel"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "job_location": "Anywhere",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T",
    "skills": "tableau"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "job_location": "Anywhere",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T",
    "skills": "power bi"
  },
  {
    "job_id": 552322,
    "job_title": "Associate Director- Data Insights",
    "job_location": "Anywhere",
    "salary_year_avg": "255829.5",
    "company_name": "AT&T",
    "skills": "powerpoint"
  },
  {
    "job_id": 285766,
    "job_title": "Partner Technology Manager, Data Analytics and AI",
    "job_location": "Austin, TX",
    "salary_year_avg": "254000.0",
    "company_name": "Google",
    "skills": "gcp"
  }
]

*/