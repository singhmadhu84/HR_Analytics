use hr_analytics;
select * from hr_data;

-- 1. Average Attrition rate for all Departments

select department, concat(format(Avg(
case when Attrition = "Yes" then 1
Else 0
End)*100,2),"%") as Attrition_rate from hr_data group by department;

-- 2. Average Hourly rate of Male Research Scientist

select jobrole, format(avg(hourlyrate),2) as Avg_Hourlyrate, Gender from hr_data where jobrole = "Research Scientist" and Gender = "Male"
group by jobrole, Gender;

-- 3. Attrition rate Vs Monthly income stats

select department, concat(format(Avg(
case when Attrition = "Yes" then 1
Else 0
End)*100,2),"%") as Avg_Attrition_rate,
format(avg(`hr_2.monthlyincome`),2) as Avg_monthly_income
from hr_data group by department;

-- 4. Average working years for each Department

select department, format(Avg(`hr_2.Totalworkingyears`),2) as Avg_Workingyears
from hr_data group by Department;

-- 5. Job Role Vs Work life balance

select jobrole, format(Avg(`hr_2.worklifebalance`),2) as Avg_worklifebalance
from hr_data group by jobrole;

-- 6. Attrition rate Vs Year since last promotion relation

select department, concat(format(avg(
case when Attrition = "Yes" then 1
Else 0
End)*100,2),"%") as Attrition_rate,
format(avg(`hr_2.yearssincelastpromotion`),2) as Avg_years_sincelastpromotion
from hr_data group by department;

