######### Not meant to be run ######### 

## Computed column 
-- col TYPE GENERATED ALWAYS AS (expr) [VIRTUAL|STORED]
# This is one line inside a CREATE TABLE, written just like any other column.

# col == The name you give the column (e.g. line_total)

# TYPE == Its data type (e.g. DECIMAL(12,2))

# GENERATED ALWAYS AS == Tells MySQL: “don’t let me type a value, you calculate it”

# (expr) ==	The formula, using other columns from the same row (e.g. (quantity * unit_price))

# [VIRTUAL|STORED]	== VIRTUAL: calculated each time you SELECT. STORED: calculated once and saved. If you leave it out, it’s VIRTUAL.


-- Trigger skeleton
-- DELIMITER $$
-- CREATE TRIGGER name
## Choose between if you want it to happen BEFORE or AFTER
-- {BEFORE|AFTER} {INSERT|UPDATE|DELETE} ON tbl 
## Choose INSERT, UPDATE, or DELETE

# This answers when and what it reacts to. You pick one from each group:
	# BEFORE runs before the change is saved, so you can check or fix the data.
	# AFTER runs after it’s saved, so you can log it or update other tables.
	# INSERT, UPDATE, or DELETE is the action that sets it off.
	# ON tbl is the table being watched (e.g. ON products).

-- FOR EACH ROW
-- BEGIN
-- 	...
## Add whatever is necessary here.
-- END$$
-- DELIMITER ;

## Reject a row
-- SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'message';

## Manage
-- SHOW TRIGGERS;
-- DROP TRIGGER IF EXISTS name;