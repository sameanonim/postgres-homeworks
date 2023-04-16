-- SQL-команды для создания таблиц
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    title VARCHAR(100),
    birth_date DATE,
    notes TEXT
);

CREATE TABLE customers(
    customers_id int PRIMARY KEY,
    company_name VARCHAR(100) NOT NULL,
    contact_name text
);

CREATE TABLE orders (
  order_id INT PRIMARY KEY,
  customers_id INT,
  employee_id INT,
  order_date DATE DEFAULT CURRENT_DATE,
  ship_city VARCHAR(50),
  CONSTRAINT fk_customers FOREIGN KEY (customers_id) REFERENCES customers (customers_id),
  CONSTRAINT fk_employees FOREIGN KEY (employee_id) REFERENCES employees (employee_id)
);