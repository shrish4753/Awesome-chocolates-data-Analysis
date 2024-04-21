show tables;
describe sales;
select * from sales;
select SaleDate,Amount,Customers from sales;
select Amount, Customers,GeoID  from sales;
select Amount,SaleDate,Boxes,Amount/Boxes as"amount per box" from sales;
select * from sales
where Amount>10000;

select * from sales
where Amount>10000
order by Amount;
select * from sales
where Amount>10000
order by Amount desc;

select * from sales
where GeoID='G1'
order by PID, Amount desc;

select * from sales
where Amount > 10000 and SaleDate>='2022-01-01';

select Amount, SaleDate  from sales
where Amount>10000 and year(saledate)=2022;
select * from sales
where Boxes between 0 and 50;


select SaleDate, Amount , Boxes ,weekday(saledate) as "day of week" 
from sales
where weekday(saledate)=4; 

select * from people;

select * from people
where Team= "delish" or Team="Jucies";

select * from people
where Team in ('delish' , 'jucies');

select * from people
where Salesperson like "B%";

select * from people
where Salesperson like "%B%";

select * from people
where Salesperson like "%B";

select * from sales;

select saledate , amount ,
		case  when amount<1000 then 'Under 1k'
			  when amount < 5000 then 'Under 5k'
              when amount <7000 then 'Under 7k'
              when amount <10000 then 'Under 10k'
			else'10k or More'
		end  as "Amount Category"
from sales;

select s.Amount,s.SaleDate,p.Salesperson,s.SPID,p.SPID
from sales s
join people p on s.SPID=p.SPID;

select s.saledate,s.amount,pr.product
from sales s 
left join products pr
on s.PID=pr.PID;

select s.SaleDate, p.Salesperson, s.Amount,pr.Product, p.Team
from sales s 
join people p on p.SPID=s.SPID
join products pr on pr.PID=s.PID;


select s.SaleDate, p.Salesperson, s.Amount,pr.Product, p.Team
from sales s 
join people p on p.SPID=s.SPID
join products pr on pr.PID=s.PID
where Amount<1000
and p.Team="delish";


select s.SaleDate, p.Salesperson, s.Amount,pr.Product, p.Team
from sales s 
join people p on p.SPID=s.SPID
join products pr on pr.PID=s.PID
where Amount<1000
and p.Team= '';

select s.SaleDate, p.Salesperson, s.Amount,pr.Product, p.Team,g.geo
from sales s 
join people p on p.SPID=s.SPID
join products pr on pr.PID=s.PID
join geo g on g.GeoID=s.GeoID
where Amount<1000
and g.geo in ("india", "new zealand");


select s.SaleDate, p.Salesperson, s.Amount,pr.Product, p.Team,g.geo
from sales s 
join people p on p.SPID=s.SPID
join products pr on pr.PID=s.PID
join geo g on g.GeoID=s.GeoID
where Amount<1000
and g.geo in ("india", "new zealand")
order by SaleDate;


SELECT g.geo, g.GeoID, 
       SUM(s.Amount) AS TotalAmount, 
       AVG(s.Amount) AS AverageAmount, 
       SUM(s.Boxes) AS TotalBoxes
FROM sales s
JOIN geo g ON g.GeoID = s.GeoID
GROUP BY g.geo, g.GeoID;

SELECT 
    pr.Category,
    p.Team,
    SUM(s.boxes) AS total_boxes,
    SUM(s.amount) AS total_amount
FROM 
    sales s
JOIN 
    products pr ON p.SPID = s.SPID
JOIN 
    people p ON pr.pid = s.pid
    where p.Team<> ''
GROUP BY 
    pr.Category, 
    p.Team;
    
select pr.Product, sum(s.Amount) as "total amount"
from sales s
join products pr
on pr.pid=s.pid
order by 'total amount' desc 
limit 10;










        








