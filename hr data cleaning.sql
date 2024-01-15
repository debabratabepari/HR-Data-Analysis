create database project;
USE project;
select * from hr;

ALTER TABLE hr
change column ï»¿id emp_id varchar(30) NULL;

describe hr;

SELECT birthdate FROM hr;

SET SQL_SAFE_UPDATES =0;

update hr
SET birthdate = CASE 
WHEN birthdate LIKE '%/%' THEN date_format(str_to_date(birthdate, '%m/%d/%Y'), '%Y-%m-%d')
WHEN birthdate LIKE '%-%' THEN date_format(str_to_date(birthdate, '%m-%d-%Y'), '%Y-%m-%d')
ELSE null
END;

ALTER table hr
modify birthdate DATE;

SELECT hire_date FROM hr;

update hr
SET hire_date = CASE 
WHEN hire_date LIKE '%/%' THEN date_format(str_to_date(hire_date, '%m/%d/%Y'), '%Y-%m-%d')
WHEN hire_date LIKE '%-%' THEN date_format(str_to_date(hire_date, '%m-%d-%Y'), '%Y-%m-%d')
ELSE null
END;

ALTER table hr
modify hire_date DATE;

Select termdate From hr;

update hr
SET termdate = CASE 
WHEN termdate LIKE '%:%' THEN date_format(str_to_date(termdate, '%Y-%m-%d %H:%i:%s UTC'), '%Y-%m-%d')
ELSE '0000-00-00'
END;
/*
UPDATE hr
SET termdate = date(str_to_date(termdate, '%Y-%m-%d %H:%i:%s UTC'))
WHERE termdate IS NOT NULL AND termdate != ' ';

SELECT COALESCE(CAST(termdate AS DATETIME), '0000-00-00')
FROM hr;

UPDATE hr
SET termdate = COALESCE(CAST(termdate AS DATE), '0000-00-00');

update hr
set termdate= str_to_date(termdate,'%Y-%m-%d');

create view temp as
select termdate from hr;
select * from temp;

DROP view temp;
*/

set SQL_MODE = 'NO_ZERO_DATE';

ALTER TABLE hr
modify termdate date;

ALTER TABLE hr
ADD column age INT;

UPDATE hr
SET age = timestampdiff(YEAR, birthdate, CURDATE());

SELECT birthdate, age FROM hr;

SELECT 
    MIN(age) AS youngest, MAX(age) AS oldest
FROM
    hr;

SELECT count(*) FROM hr Where age<18;

