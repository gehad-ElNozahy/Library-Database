CREATE DATABASE Library;

USE Library;

CREATE TABLE Student (
    ID varchar(50) primary key,
    FirstName varchar(50) unique,
    lastName varchar(50),
    Age int,
    Gender varchar(10),
    Adress varchar(50),
    phonenumber Double,
    schoolyear date
);

create table category (
	ID Varchar(50) primary key ,
	categoryname varchar(50) unique
);

create table book(
	ID varchar(50) primary key,
	bookname varchar(50) unique,
	Author varchar(50),
	numberofpages int,
	publishdate date,
	categoryname varchar(50),
	foreign key (categoryname) references category(categoryname)
);

CREATE TABLE Borrow (
    ID Varchar(50) primary key,
    StudentName varchar(50),
    BookName varchar(50),
    Borrowdate datetime ,
    returndate datetime,
    FOREIGN KEY (StudentName) REFERENCES Student(FirstName),
    foreign key (BookName) references book(bookname)
);



#INSERT
insert into student values (UUID(), "gehad" , "ali" , 20 , "female" , "Gleem" , 21545823 , '2000-1-1' );
insert into student values (UUID(), "abdelrahman" , "ali" , 22, "male" , "Gleem" , 85545322 , '1999-1-1' );
insert into student values (UUID(), "hend" , "ali" , 25 , "female" , "Gleem" , 58545655 , '1997-1-1' );
insert into category values (UUID(), "human development" );
insert into category values (UUID(), "religion" );
insert into category values (UUID(), "science" );
insert into book values (UUID(), "the way to happiness" , "ali mohammed" , 200, "2010-5-20" , "human development"  );
insert into book values (UUID(), "Life-Span Human Development" , "ali mohammed" , 200, "2011-3-15" , "human development"  );
insert into book values (UUID(), "where is allah" , "mohammed taha" , 360 , "2000-8-5" , "religion");
insert into borrow values (UUID(), "gehad" , "where is allah" ,  "2020-5-28 09:10:22" , "2020-6-28 07:40:13");
insert into borrow values (UUID(), "abdelrahman", "the way to happiness" ,  "2020-6-24 05:30:12" , "2020-7-13 08:06:17");
insert into borrow values (UUID(), "hend", "the way to happiness" ,  "2020-6-30 01:05:03" , "2020-8-12 12:26:59");

# 20 Questions using different functions

# 1) how do we get the borrow date year ?
select YEAR(borrowdate) from borrow where studentName="gehad";

# 2) how do we get the borrow date month ?
select MONTH(borrowdate) from borrow where studentName="gehad";

# 3) how do we get the borrow date week ?
select WEEK(borrowdate) from borrow where studentName="gehad";

# 4) how do we get the borrow date day ?
select DAY(borrowdate) from borrow where studentName="gehad";

# 5) how do we get the borrow date hour ?
select HOUR(borrowdate) from borrow where studentName="gehad";

# 6) how do we get the borrow date minute ?
select MINUTE(borrowdate) from borrow where studentName="gehad";

# 7) how do we get the borrow date second ?
select SECOND(borrowdate) from borrow where studentName="gehad";

# 8) how do we combine the first name and last name in one column ?
select CONCAT(firstname," ",lastname) from student where firstName="Abdelrahman";

# 9) how do we get all lower case of book name?
select LCASE(bookname) from book where author="ali mohammed";

# 10) how do we remove spaces around the string of book name?
select LTRIM(bookname) from book where author="ali mohammed";

# 11) how do we get the Average of students age?
select avg(age) from student ;

# 12) how do we get the number of students ?
select COUNT(*) from student ;

# 13) how do we get the max age of students?
select MAX(Age) from student;

# 14) how do we get the min age of students?
select min(age) from student;

# 15) how do we get the addtion date for the borrow date?
select ADDDATE(borrowdate ,INTERVAL 10 DAY) from borrow ;

# 16) how do we get the addtion time for the borrow date?
select ADDTIME(borrowdate ,"20") from borrow ;

# 17) how do we get all upper case of book name?
select UCASE(bookname) from book where author="ali mohammed";

# 18) how do we get extract the day from date?
select extract(DAY FROM borrowdate) from borrow;

# 19) how do we get days between borrowdate and returndate?
select DATEDIFF(returndate,borrowdate) from borrow;

# 20) how do we get the number of characters of student name ?
SELECT CHAR_LENGTH(firstName) from student;











#subquery
select * from student where firstname in (select studentName from borrow where borrowdate="2020-06-24");
select * from book where bookname in (select bookname from borrow where borrowdate="2020-06-30");
select * from borrow where bookname in (select bookname from book where publishdate="2010-05-20");

#joins
SELECT student.age, student.gender, borrow.bookname FROM student INNER JOIN borrow ON student.firstName=borrow.studentName; # INNER JOIN
SELECT book.bookname, book.numberofpages, borrow.returndate FROM book left join borrow ON book.bookName=borrow.bookName; #LEFT OUTER JOIN
SELECT * FROM book right outer join category ON book.categoryname=category.categoryname; # RIGHT OUTER JOIN
SELECT * FROM book LEFT JOIN borrow ON borrow.bookname = book.bookname
UNION
SELECT * from book RIGHT JOIN borrow ON borrow.bookname = book.bookname; #FULL OUTER JOIN
SELECT  *
FROM student A, student B
WHERE A.ID <> B.ID; # SELF JOIN

#count and group by

SELECT gender,COUNT(*) 
FROM student
GROUP BY gender;

SELECT author,COUNT(*)
FROM book
GROUP BY author;

#UPDATE
UPDATE student SET phonenumber = 564451244 WHERE FirstName = "gehad";
UPDATE student SET Age = 12 WHERE FirstName = "hend";
UPDATE book SET author = "abdelrahman mohamed" WHERE bookName = "where is allah";
UPDATE book SET numberofpages = 155 WHERE bookName = "the way to happiness";
UPDATE borrow SET borrowdate = "2020-6-12" WHERE studentName = "abdelrahman";


#DELETE
DELETE FROM borrow WHERE StudentName = 'gehad';
DELETE FROM student WHERE firstName='gehad';
DELETE FROM borrow WHERE borrowdate='2020-6-12' AND studentName = "abdelrahman";
DELETE FROM student WHERE age=22 AND firstname = "abdelrahman";
DELETE FROM book WHERE bookName='where is allah';




