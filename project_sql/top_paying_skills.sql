-- What are the top skills based on salary?


SELECT
    skills,
    ROUND(AVG(salary_year_avg), 2) AS avg_salary,
    job_postings_fact.job_title_short AS designation
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
WHERE
    job_title_short LIKE '%Analyst%' AND
    salary_year_avg IS NOT NULL
GROUP BY
    skills,
    designation
ORDER BY
    avg_salary DESC
LIMIT 30;


SELECT
    skills,
    ROUND(AVG(salary_year_avg), 2) AS avg_salary,
    job_postings_fact.job_title_short AS designation
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
WHERE
    job_title_short LIKE '%Engineer%' AND
    salary_year_avg IS NOT NULL
GROUP BY
    skills,
    designation
ORDER BY
    avg_salary DESC
LIMIT 30;