/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
 select categories.Name, products.Name from products
inner join categories on products.CategoryID = categories.CategoryID 
where categories.name = "Computers";
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
 select products.Name, products.Price, reviews.Rating from products 
 inner join reviews on products.ProductID = reviews.ProductID 
 where reviews.Rating = 5;
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
select employees.FirstName, employees.LastName, sum(sales.Quantity) as Total_Sales from sales  -- get sum of sales to order by
inner join employees on employees.EmployeeID = sales.EmployeeID 
group by employees.FirstName, employees.LastName -- get list of employees
order by sum(sales.Quantity) desc limit 2;  -- display only the top sales
/* joins: find the name of the department, and the name of the category for Appliances and Games */
select departments.Name as DepartmentName, categories.Name as CategoryName from departments
inner join categories on departments.DepartmentID = categories.DepartmentID 
where categories.Name = "Appliances" or categories.name = "Games";
/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
select products.Name, sum(sales.Quantity) as AmountSold, products.price * sum(sales.Quantity) as TotalSales from products 
inner join sales on products.ProductID = sales.ProductID where products.ProductID = 97; 
/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
select products.name, reviews.Reviewer, reviews.Rating, reviews.Comment from reviews
inner join products on reviews.ProductID = products.ProductID where reviews.ProductID = 857 and reviews.Rating = 1;
-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return the employeeID, the employee's first and last name, the name of each product, how many of that product they sold */
select employees.EmployeeID, employees.FirstName, employees.LastName, products.name, sum(sales.Quantity) as TotalSold from sales
join employees on employees.EmployeeID = sales.EmployeeID
join products on products.ProductID = sales.ProductID
group by employees.EmployeeID, products.ProductID
order by employees.LastName;
-- order by is how to display, group by actually createsn the table grouped together on a certain condition