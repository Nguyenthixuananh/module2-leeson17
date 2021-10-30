select status from orders group by status

select status, count(*) as 'So luong status' from orders
group by status

--     Sử dụng group by với hàm tập hợp truy vấn trên hai bảng.
select status, sum(quantityOrdered * priceEach) as amount
from orders
inner join orderdetails on orders.ordernumber = orderdetails.ordernumber
group by status

--     Một yêu cầu khác là tính tổng tiền của từng đơn hàng
select orderNumber, sum(quantityOrdered * priceEach) as total
from orderdetails
group by orderNumber;

-- GROUP BY với mệnh đề HAVING

select year(orderDate) as year, sum(quantityOrdered * priceEach) as total
from orders
inner join orderdetails on orders.orderNumber = orderdetails.orderNumber
group by year
having year > 2003
