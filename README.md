# Introduction
📊 Dive into the data job market data collected by Luke Barousse for his [datanerd.tech](https://datanerd.tech/) website. Focusing on the data analyst roles, this project explores 💸 top-paying jobs in United States, 🚀 in-demand skills for those jobs and states with 📈 high demand for data analysts.

SQL Queries? Check them out here: [project_sql_folder](/project_sql/)
# Background
Motivated to better understand the data analyst job market. By doing this project I found some really good insights for in-demand skills and top states with opportunities, helping me to optimize job search process 

The questions I wanted to answer through my SQL queries were:

1. What are the top-paying data analyst jobs in United States?
2. What skills are required for these top-paying jobs?
3. Which states has more opportunities for Data Analyst roles in United States?

# Tools I Used
For my deep dive into the data analyst job market, I harnessed the power of several key tools:

- **SQL:** The backbone of my analysis, allowing me to query the database and unearth critical insights.
- **PostgreSQL:** The chosen database management system, ideal for handling the job posting data.
- **Visual Studio Code:** My go-to for database management and executing SQL queries.
- **Git & GitHub:** Essential for version control and sharing my SQL scripts and analysis, ensuring collaboration and project tracking.
# The Analysis
Each query for this project aimed at investigating specific aspects of the data analyst job market. Here’s how I approached each question:

1.Top Paying Data Analyst Jobs

To identify the highest-paying roles, I filtered data analyst positions by average yearly salary and location, focusing on jobs in US. This query highlights the high paying opportunities in the field.

```sql
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

```
Here's the breakdown of the top data analyst jobs in United States:
- **Salary Range:** Top 10 paying data analyst roles span from $254,000 to $375,000, indicating significant salary potential in the field.
- **Diverse Employers:** Companies like Illuminate Mission Solutions, Torc Robotics, and Illuminate Mission Solutions are among those offering high salaries.
- **Job Title Variety:** There's a high diversity in job titles, from HC Data Analyst to Director of Safety Data Analysis, reflecting varied roles and specializations within data analytics.


2.Skills for Top Paying Jobs

To understand what skills are required for the top-paying jobs, I joined the job postings with the skills data, providing insights into what employers value for high-compensation roles.

```sql
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

```
| SKILLS       | COUNT     | 
|--------------|-----------|
| **SQL**      | 5         | 
| **Python**   | 5         | 
| **Excel**    | 4         | 
| **R**        | 4         | 
| **Tableau**  | 4         | 
| **Power BI** | 4         | 


 Here's the breakdown of the most demanded skills for data analysts in United States, based on job postings:
 - **SQL** and **Python** are leading with a count of 5.
 - **Excel**, **R**, **Tableau** and **Power BI** follows closely with a count of 4.

3.Top States With Most Job Openings

To identify what states has more opportunities I counted job_id along with job location, filtering by job_country only United States and onsite jobs.

```sql
SELECT
    job_location,
    COUNT(job_id) AS job_openings
FROM job_postings_fact
WHERE
    job_country = 'United States' AND 
    job_location <> 'Anywhere' AND 
    job_location <> 'United States' AND
    job_title_short = 'Data Analyst'
GROUP BY 
    job_location
ORDER BY
    job_openings DESC
LIMIT 10;

```
| STATES            | JOB COUNT     | 
|-------------------|---------------|
| New York, NY      | **3038**      | 
| Atlanta, GA       | **2734**      | 
| Chicago, IL       | **2359**      | 
| Austin, TX        | 1917          | 
| Dallas, TX        | 1874          | 
| Washington, DC    | 1600          | 
| Charlotte, NC     | 1437          | 
| Tampa, FL         | 1429          | 
| Los Angeles, CA   | 1339          | 
| San Francisco, CA | **1148**      |  


 Here's the breakdown of the top-ten states with most job openings for Data Analysts in United States.
 - Top three of those are **New York, NY** , **Atlanta, GA** , **Chicago, IL** being on the eastern side of United States.
 - Openings range: lowest 1148 jobs in **San Francisco, CA** and highest  3038 jobs in **New York, NY**
# What I Learned

Throughout this adventure, I've turbocharged my SQL toolkit with some serious firepower:

- 🧩 **Crafting Complex Queries:** I've become skilled at merging tables and using temporary tables effectively with WITH clauses.
- 📊 **Data Aggregation:** I've learned how to use GROUP BY and aggregate functions like COUNT() and AVG() to summarize data efficiently.
- 💡 **Analytical Wizardry:** Leveled up my real-world puzzle-solving skills, turning questions into actionable, insightful SQL queries.

# Conclusions

### Insights
From the analysis, several general insights emerged:

- **Top-Paying Data Analyst Jobs:** The highest-paying jobs in United States for Data Analysts offer a wide range of salaries, the highest at $375,000!
- **Skills for Top-Paying Jobs:** High-paying data analyst jobs require advanced proficiency in SQL, suggesting it’s a critical skill for earning a top salary.
- **Top States with Most Opportunities:** New York, NY, Atlanta, GA and Chicago, IL are top states with most jobs for Data Analysts.

### Closing Thoughts

This project enhanced my SQL skills and provided valuable insights into the data analyst job market. The findings from the analysis serve as a guide to prioritizing skill development and job search efforts. As a Aspiring data analysts I can better position myself in a competitive job market by focusing on high-demand, high-salary skills. This exploration highlights the importance of continuous learning and adaptation to emerging trends in the field of data analytics.