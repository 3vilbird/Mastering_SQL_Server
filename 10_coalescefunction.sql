


-- COALESCE FUNCTION

--- COAL ESC E FUNCTION --> returns the first non null value.


-- select id COALESCE(fname,middlename,lastname) as name from tblemp

-- here if the fname is null it picks middle name
-- if fname and middlename are empty it will pick up tha last name as the name

-- hence it picks up the first non null value