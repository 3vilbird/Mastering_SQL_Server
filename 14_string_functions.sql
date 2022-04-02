-- string functions in sql


-- ASCII(Character_Expression) - Returns the ASCII code of the given character expression.

select ASCII('A')

-- CHAR(Integer_Expression) - Converts an int ASCII code to a character. 

Print CHAR(65)
Print CHAR(97)

Print LOWER(CHAR(65))


--  LTRIM(Character_Expression) - Removes blanks on the left handside of the given character expression.

Select LTRIM('   Hello')

Select RTRIM('Hello   ')

Select LTRIM(RTRIM('   Hello   '))



-- LOWER(Character_Expression) - Converts all the characters in the given 

Select LOWER('CONVERT This String Into Lower Case')
Select UPPER('CONVERT This String Into upper Case')
select REVERSE('im the reverse')



-- LEN(String_Expression) - Returns the count of total characters, in the given string expression, excluding the blanks at the end of the expression

Select LEN('SQL Functions   ')


-- more string finctions

-- https://csharp-video-tutorials.blogspot.com/2012/08/left-right-charindex-and-substring.html


-- left , right ,charindex,substring













