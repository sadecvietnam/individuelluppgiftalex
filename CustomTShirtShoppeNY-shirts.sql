CREATE view tshirts AS 
SELECT product.*, order_rows.text, order_rows.image FROM product, order_rows where product.id = order_rows.product_id 