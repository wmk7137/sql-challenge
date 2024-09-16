
CREATE TABLE "departments" (
    "dept_no" VARCHAR PRIMARY KEY NOT NULL,
    "dept_name" VARCHAR NOT NULL
);

CREATE TABLE "dept_emp" (
    "emp_no" INT NOT NULL,
    "dept_no" VARCHAR,
    PRIMARY KEY ("emp_no", "dept_no")
);

CREATE TABLE "dept_manager" (
    "dept_no" VARCHAR NOT NULL,
    "emp_no" INT NOT NULL,
    PRIMARY KEY ("dept_no", "emp_no")
);

CREATE TABLE "employees" (
    "emp_no" INT PRIMARY KEY NOT NULL,
    "emp_title" VARCHAR NOT NULL,
    "birth_date" DATE NOT NULL,
    "first_name" VARCHAR NOT NULL,
    "last_name" VARCHAR NOT NULL,
    "sex" VARCHAR NOT NULL,
    "hire_date" DATE NOT NULL
);

CREATE TABLE "salaries" (
    "emp_no" INT NOT NULL,
    "salary" INT NOT NULL,
    PRIMARY KEY ("emp_no", "salary") 

CREATE TABLE "titles" (
    "title_id" VARCHAR PRIMARY KEY NOT NULL,
    "title" VARCHAR NOT NULL
);

ALTER TABLE "dept_emp" 
ADD CONSTRAINT "fk_dept_emp_dept_no"
FOREIGN KEY ("dept_no") 
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_emp" 
ADD CONSTRAINT "fk_dept_emp_emp_no"
FOREIGN KEY ("emp_no") 
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_manager" 
ADD CONSTRAINT "fk_dept_manager_dept_no"
FOREIGN KEY ("dept_no") 
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" 
ADD CONSTRAINT "fk_dept_manager_emp_no"
FOREIGN KEY ("emp_no") 
REFERENCES "employees" ("emp_no");

ALTER TABLE "salaries" 
ADD CONSTRAINT "fk_salaries_emp_no"
FOREIGN KEY ("emp_no") 
REFERENCES "employees" ("emp_no");

SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees e
JOIN salaries s ON e.emp_no = s.emp_no;

SELECT first_name, last_name, hire_date
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986;

SELECT dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
FROM dept_manager dm
JOIN departments d ON dm.dept_no = d.dept_no
JOIN employees e ON dm.emp_no = e.emp_no;

SELECT de.dept_no, e.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp de
JOIN employees e ON de.emp_no = e.emp_no
JOIN departments d ON de.dept_no = d.dept_no;

SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

SELECT e.emp_no, e.last_name, e.first_name
FROM dept_emp de
JOIN departments d ON de.dept_no = d.dept_no
JOIN employees e ON de.emp_no = e.emp_no
WHERE d.dept_name = 'Sales';

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp de
JOIN departments d ON de.dept_no = d.dept_no
JOIN employees e ON de.emp_no = e.emp_no
WHERE d.dept_name IN ('Sales', 'Development');

SELECT last_name, COUNT(*) AS frequency
FROM employees
GROUP BY last_name
ORDER BY frequency DESC;