/*
 1. Используя операторы языка SQL,
создайте таблицу “sales”. Заполните ее данными.
 */

CREATE TABLE sales(
                      id serial primary key,
                      order_date date not null,
                      count_product int not null
);

INSERT INTO sales (order_date, count_product)
VALUES
    ('2022-01-01', 156),
    ('2022-01-02', 180),
    ('2022-01-03', 21),
    ('2022-01-04', 124),
    ('2022-01-05', 341);

SELECT * from sales;

/*
2.  Для данных таблицы “sales” укажите тип заказа в зависимости от кол-ва :
меньше 100  -    Маленький заказ
от 100 до 300 - Средний заказ
больше 300  -     Большой заказ
 */

select *,
       case
           when count_product < 100 then'small'
           when count_product > 100 and count_product < 300 then 'middle'
           when count_product > 300 then 'big'
           end
           as type_size
from sales
ORDER BY id;

/*
 Создайте таблицу “orders”, заполните ее значениями.
 Покажите “полный” статус заказа, используя оператор CASE
 */
CREATE TYPE status as ENUM ('OPEN', 'CLOSED', 'CANCELLED');

CREATE TABLE employee(
                         id varchar(5) primary key,
                         first_name varchar(20),
                         last_name varchar(30)
);
CREATE TABLE orders(
                       id serial primary key,
                       employee_id varchar(5),
                       FOREIGN KEY (employee_id) REFERENCES employee(id),
                       amount decimal not null,
                       order_status status not null
);


INSERT INTO employee (id, first_name, last_name)
VALUES
    ('e01', 'test1', 'test1'),
    ('e02', 'test2', 'test2'),
    ('e03', 'test3', 'test3'),
    ('e04', 'test4', 'test4'),
    ('e05', 'test5', 'test5');

INSERT INTO orders (employee_id, amount, order_status)
VALUES
    ('e03', 15.00, 'OPEN'),
    ('e01', 25.50, 'OPEN'),
    ('e05', 100.70, 'CLOSED'),
    ('e02', 22.18, 'OPEN'),
    ('e04', 9.50, 'CANCELLED');

/*
 Выберите все заказы.
 В зависимости от поля order_status выведите столбец full_order_status:
OPEN – «Order is in open state» ; CLOSED - «Order is closed»;
 CANCELLED -  «Order is cancelled»
 */

select *,
       case
           when order_status = 'OPEN' then 'Order is in open state'
           when order_status = 'CLOSED' then 'Order is closed'
           when order_status = 'CANCELLED' then 'Order is cancelled'
           end
           as full_order_status
from orders
ORDER BY id;