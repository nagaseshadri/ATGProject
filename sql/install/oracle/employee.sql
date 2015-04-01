CREATE TABLE atgproj_department (
	id 			varchar2(254)	NOT NULL,
	name 			varchar2(254)	NULL,
	PRIMARY KEY(id)
);

CREATE TABLE atgproj_address (
	id 			varchar2(254)	NOT NULL,
	address1 		varchar2(254)	NULL,
	address2 		varchar2(254)	NULL,
	city 			varchar2(254)	NULL,
	state 			varchar2(254)	NULL,
	country 		varchar2(254)	NULL,
	zip_code 		varchar2(254)	NULL,
	PRIMARY KEY(id)
);

CREATE TABLE atgproj_employee (
	id 			varchar2(254)	NOT NULL,
	first_name 		varchar2(254)	NULL,
	last_name 		varchar2(254)	NULL,
	dob 			date	NULL,
	doj 			date	NULL,
	dept_id 		varchar2(254)	NULL REFERENCES atgproj_department(id),
	PRIMARY KEY(id)
);

CREATE TABLE atgproj_emp_salary (
	emp_id 			varchar2(254)	NOT NULL REFERENCES atgproj_employee(id),
	basic 			number(28, 20)	NULL,
	hra 			number(28, 20)	NULL,
	da 			number(28, 20)	NULL,
	cca 			number(28, 20)	NULL,
	ta 			number(28, 20)	NULL,
	PRIMARY KEY(emp_id)
);

CREATE TABLE atgproj_emp_interests (
	emp_id 			varchar2(254)	NOT NULL REFERENCES atgproj_employee(id),
	interest 		varchar2(254)	NOT NULL,
	PRIMARY KEY(emp_id, interest)
);

CREATE TABLE atgproj_emp_address (
	emp_id 			varchar2(254)	NOT NULL REFERENCES atgproj_employee(id),
	tag 			varchar2(254)	NOT NULL,
	address_id 		varchar2(254)	NULL REFERENCES atgproj_address(id),
	PRIMARY KEY(emp_id, tag)
);

CREATE TABLE atgproj_emp_projects (
	emp_id 			varchar2(254)	NOT NULL REFERENCES atgproj_employee(id),
	idx 			INTEGER	NOT NULL,
	project 		varchar2(254)	NULL,
	PRIMARY KEY(emp_id, idx)
);

CREATE INDEX atgproj_emp_salary_emp_idx ON atgproj_emp_salary(emp_id);

CREATE INDEX atgproj_emp_interests_emp_idx ON atgproj_emp_interests(emp_id, interest);

CREATE INDEX atgproj_emp_address_emp_idx ON atgproj_emp_address(emp_id, tag);

CREATE INDEX atgproj_emp_projects_emp_idx ON atgproj_emp_projects(emp_id, idx);


