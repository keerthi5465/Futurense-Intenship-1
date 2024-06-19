-- CHAR_LENGTH(str): Returns the number of characters in a string
SELECT CHAR_LENGTH('Hello World'); 

-- ASCII(str): Returns the ASCII value of the leftmost character of the string
SELECT ASCII('L'); 

-- INSTR(str, substr): Returns the position of the first occurrence of substring within a string
SELECT INSTR('Hello World', 'World'); 

-- LCASE(str) or LOWER(str): Converts a string to lowercase
SELECT LCASE('HELLO'); 

-- UCASE(str) or UPPER(str): Converts a string to uppercase
SELECT UCASE('hello'); 

-- SUBSTRING(str, start, length): Returns a part of a string starting from start position and of given length
SELECT SUBSTRING('Hello World', 7, 5); 

-- LPAD(str, len, padstr): Left-pads a string to a certain length with another string
SELECT LPAD('Hello', 10, '*'); 

-- RPAD(str, len, padstr): Right-pads a string to a certain length with another string
SELECT RPAD('Hello', 10, '*');
-- TRIM(str): Removes leading and trailing spaces from a string
SELECT TRIM('   Hello World   ');

-- RTRIM(str): Removes trailing spaces from a string
SELECT RTRIM('   Hello World   ');

-- LTRIM(str): Removes leading spaces from a string
SELECT LTRIM('   Hello World   ');

-- CURRENT_DATE(): Returns the current date
SELECT CURRENT_DATE();

-- DATEDIFF(date1, date2): Returns the difference in days between date1 and date2
SELECT DATEDIFF('2024-06-19', '2024-01-01');

-- CURRENT_TIME(): Returns the current time
SELECT CURRENT_TIME();

-- LAST_DAY(date): Returns the last day of the month for the given date
SELECT LAST_DAY('2024-06-19');

-- SYSDATE(): Returns the current date and time
SELECT SYSDATE();
