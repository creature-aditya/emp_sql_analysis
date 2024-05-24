-- Databricks notebook source
-- DBTITLE 1,Table Preview
select *
from emp
limit 10

-- COMMAND ----------

-- DBTITLE 1,Check for duplicate data
select
count(*) as total_count,
count(distinct *) as unique_count
from emp

-- COMMAND ----------

-- DBTITLE 1,Total Employee
select
count(EmployeeNumber) as total_emp
from emp

-- COMMAND ----------

-- DBTITLE 1,Employee Attrition
select
attrition,
count(EmployeeNumber) as emp_poll
from emp
group by 1

-- COMMAND ----------

-- DBTITLE 1,Age group analysis for attrition
select 
(case when age <=24 then '18-24' when age >= 25 and age <= 31 then '25-31' when age >= 32 and age <= 38 then '32-38' when age >= 39 and age <= 45 then '39-45' when age >= 46 and age <= 52 then '46-52' else '52+' end) as age,
count(EmployeeNumber) as emp_count
from emp
where Attrition = 'Yes'
group by 1 
order by 1

-- COMMAND ----------

-- DBTITLE 1,Atrition per department
select
department,
count(EmployeeNumber) as emp_count
from emp
group by 1
order by 2


-- COMMAND ----------

-- DBTITLE 1,Attrition per age group
select 
(case when education = 1 then 'below college' when education = 2 then 'college' when education = 3 then 'bachelor' when education = 4 then 'Masters' when education = 5 then 'doctor' end) as education,
count(EmployeeNumber) as emp_count
from emp
where Attrition = 'Yes'
group by 1 
order by 1

-- COMMAND ----------

-- DBTITLE 1,Environment Satisfaction
select 
EnvironmentSatisfaction,
count(EmployeeNumber) as emp_count
from emp
where attrition = 'Yes'
group by 1
order by 2

-- COMMAND ----------

-- MAGIC %md
-- MAGIC
-- MAGIC Analysis: 
-- MAGIC 1. Employees of age group 26-32 are leaving organization
-- MAGIC 2. Research and development department employees leaving is huge number.
-- MAGIC 3. 41.8% employees with bachelor degree leaving organization.
-- MAGIC 4. 72 employees are not satisfied with environment location and left the organization.
-- MAGIC  

-- COMMAND ----------



