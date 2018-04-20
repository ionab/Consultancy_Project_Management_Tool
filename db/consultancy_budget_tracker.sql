DROP TABLE expenses;
DROP TABLE time_units;
DROP TABLE employees;
DROP TABLE projects;

CREATE TABLE employees(
  id SERIAL8 primary key,
  name VARCHAR(255),
  hourly_rate FLOAT
);

CREATE TABLE projects(
  id SERIAL8 primary key,
  name VARCHAR(255),
  client VARCHAR(255),
  time_budget FLOAT,
  expenses_budget FLOAT
);

CREATE TABLE time_units(
  id SERIAL8 primary key,
  hours FLOAT,
  category VARCHAR(255),
  project_id INT8 references projects(id),
  employee_id INT8 references employees(id)
);

CREATE TABLE expenses(
  id SERIAL8 primary key,
  cost_excluding_vat FLOAT,
  vat FLOAT,
  category VARCHAR(255),
  project_id INT8 references projects(id),
  employee_id INT8 references employees(id)
);
