select customers.customerNumber, customerName, phone, paymentDate, amount
from customers inner join payments
on customers.customerNumber = payments.customerNumber
where city = 'Las Vegas'

//tim tat ca cac don hang thuoc tung khach hang
select customers.customerNumber, customers.customerName, orders.orderNumber, orders.status
from customers
left join orders
on customers.customerNumber = orders.customerNumber

//Để tìm tất cả khách hàng chưa đặt hàng bất kỳ sản phẩm nào
select customers.customerNumber, customers.customerName, orders.orderNumber, orders.status
from customers left join orders
on customers.customerNumber = orders.customerNumber
where orderNumber is null