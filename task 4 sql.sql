1) select * from employee
   where Department='IT' and salary > 50000;

2) select order_id,Customer_name, Contact_number from orders o 
   join customers c on o.Customer_id=c.customer_id;

3) select s.productId,count(QuantitySold) as Total_Quantity_Sold
   from Sales
   group by ProductId;

4) Select extract( month from S.SaleDate) as Month ,
   avg(S.QuantitySold)as Average_Sold_Quantity
   from  Sales S
   group by extract( month from S.SaleDate);

5) select upper(ProductName) from products;


6) SELECT EventID, EventName, EventDate
   FROM Events
   WHERE EventDate between current_date  and  current_date + INTERVAL '30 days';

7)select * from employee where salary >
  (select avg(salary) from employee);

8) create or replace function update_modi()
   returns trigger as $$
   begin
   if New.lastModified not in OLD.lastModified then
   update Products
   set OLD.lastModitied=now();
   end if;
   return new;
   end;
   $$ language plpgsql;

   create trigger Upd_modified
   after update on Products
   for each row
   execute function update_modi();


 9) create view ActiveCustomer as 
    select * from customers
 where extract(year from order_date)=2023;

10) select * from Sales
    where ToaolAmount=Null;

11)select p.*,rank()over(order by p.score) from Participants p;

12) select s.employeeId,s.salary,s.department,sum(s.salary)
    over(partition by s.department order by s.department) 
 from Salaries s group by department;

13) select s.SalesId,s.ProductId,s.SalesDate,sum(s.quantity)
    over(partition by ProductId order by ProductId ) as runningQtty 
 from Sales;

14) update products set price=price*0.1 
    where Category='Electronics';

15)delete from Customers 
where city='Delhi';