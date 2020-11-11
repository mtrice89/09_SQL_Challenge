-- 1) Employee and Salary
Select emp.emp_no,
       emp.last_name,
       emp.first_name,
       emp.sex,
       sal.salary
From employees as emp
    Left Join salaries as sal
    On (emp.emp_no = sal.emp_no)
Order By emp.emp_no;

-- 2) Employees hired in 1986
Select first_name, last_name, hire_date
From employees
Where hire_date Between '1986-01-01' And '1986-12-31';

-- 3) Manager of each Department
Select dm.dept_no,
       d.dept_name,
       dm.emp_no,
       e.last_name,
	   e.first_name 
From dept_manager as dm
    Left Join departments as d
    On (dm.dept_no = d.dept_no)
	Left Join employees as e
    On (dm.emp_no = e.emp_no);

-- 4) Department of each Employee
Select emp.emp_no,
       emp.last_name,
       emp.first_name,
       d.dept_name
From employees as emp
    Left Join dept_emp as de
    On (emp.emp_no = de.emp_no)
	Left Join departments as d
    On (de.dept_no = d.dept_no)
Order By emp.emp_no;

-- 5) Employee name = 'Hercules' & last name starts with 'B'
Select first_name, last_name, sex
From employees
Where first_name = 'Hercules' And last_name Like 'B%';

-- 6) All Employees in Sales Department
Select emp.emp_no,
       emp.last_name,
       emp.first_name,
       d.dept_name
From employees as emp
    Left Join dept_emp as de
    On (emp.emp_no = de.emp_no)
	Left Join departments as d
    On (de.dept_no = d.dept_no)
Where d.dept_name = 'Sales'
Order By emp.emp_no;

-- 7) All Employees in Sales & Development Department
Select emp.emp_no,
       emp.last_name,
       emp.first_name,
       d.dept_name
From employees as emp
    Left Join dept_emp as de
    On (emp.emp_no = de.emp_no)
	Left Join departments as d
    On (de.dept_no = d.dept_no)
Where d.dept_name = 'Sales' Or d.dept_name = 'Development'
Order By emp.emp_no;

-- 8) Count of employee Last Name
Select last_name, Count(last_name)
From employees
Group By last_name
Order By Count (last_name) Desc;

