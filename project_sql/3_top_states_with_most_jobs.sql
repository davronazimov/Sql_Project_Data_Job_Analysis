
/*
Question: What are the top-states with most data analyst job openings?
- Identify the top 10 states for most job openings in United States.
- Focus on job postings where job-site mentioned (remove remote jobs).
- Exlude the jobs where job-location is United States instead of the state name
*/

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


/*
    Here's the breakdown of the top-ten states with most job openings for Data Analysts in United States.
    Top three of those are New York, NY , Atlanta, GA , Chicago, IL being on the eastern side of United States.
    Openings range: lowest 1148 jobs in San Francisco, CA and highest  3038 jobs in New York, NY


    RESULT
==============


[
  {
    "job_location": "New York, NY",
    "job_openings": "3038"
  },
  {
    "job_location": "Atlanta, GA",
    "job_openings": "2734"
  },
  {
    "job_location": "Chicago, IL",
    "job_openings": "2359"
  },
  {
    "job_location": "Austin, TX",
    "job_openings": "1917"
  },
  {
    "job_location": "Dallas, TX",
    "job_openings": "1874"
  },
  {
    "job_location": "Washington, DC",
    "job_openings": "1600"
  },
  {
    "job_location": "Charlotte, NC",
    "job_openings": "1437"
  },
  {
    "job_location": "Tampa, FL",
    "job_openings": "1429"
  },
  {
    "job_location": "Los Angeles, CA",
    "job_openings": "1339"
  },
  {
    "job_location": "San Francisco, CA",
    "job_openings": "1148"
  }
]

*/