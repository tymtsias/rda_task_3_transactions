-- Use our database
USE ShopDB; 

-- Some data should be created outside the transaction (here)

-- Start the transaction 
START TRANSACTION; 
INSERT INTO Orders VALUES (DEFAULT, 1, '2023-01-01');
SET @order_id = LAST_INSERT_ID();

INSERT INTO OrderItems VALUES (DEFAULT, @order_id, 1, 1);
UPDATE Products SET WarehouseAmount = WarehouseAmount - 1 WHERE ID = '1';
-- And some data should be created inside the transaction 

COMMIT; 