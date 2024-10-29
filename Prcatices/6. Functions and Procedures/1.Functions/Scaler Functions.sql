--USER DEFINE FUNCTIONS
--functions created by user are called user define functions.
--=> when predefine functions not meeting our requirements then we create our own functions
--called user define functions
--functions are created for calculations and to fetch value from db

--functions are 2 types 
-- 1 scalar valued (SVF)
-- 2 table valued (TVF)

--scalar valued functions :-
-- -------------------------
-- => these functions accepts some input performs some calculation and must return a value
-- => return type of the functions is scalar types like int,varchar
-- => return expression must be a scalar variable

--Syntax :- CREATE OR ALTER FUNCTION <NAME>(parameters if any) RETURNS <type> 
--			AS
--			BEGIN
--			 STATEMENTS
--			 RETURN <EXPR>
--			END

--Example 1 :
CREATE OR ALTER FUNCTION CALC(@a int,@b int,@op char(1)) RETURNS int
 AS
 BEGIN
	 DECLARE @c int
	 IF @op='+'
	 SET @c=@a+@b
	 ELSE IF @op='-'
	 SET @c=@a-@b
	 ELSE IF @op='*'
	 SET @c=@a*@b
	 ELSE IF @op='/'
	 SET @c=@a/@b
	 ELSE
	 SET @c=-1
	 RETURN @c
 END

 SELECT DBO.CALC(10,20,'+') Addition
 SELECT DBO.CALC(10,20,'-') Subtraction
 SELECT DBO.CALC(10,20,'*') Multiplication
 SELECT DBO.CALC(10,20,'/') Division
 SELECT DBO.CALC(10,20,'a') Invalid

 --Example 2 :- create function to calculate employee experience ?



CREATE OR ALTER FUNCTION getExp(@Id INT)
RETURNS INT
AS
 BEGIN
	DECLARE @hire DATE,@exp INT
	SELECT @hire = HIRE_DATE FROM STAFF.EMPLOYEES WHERE EMPLOYEE_ID=@Id;
	SET @exp = DateDIFF(yy,@hire,GETDATE())
	RETURN @exp
END;

SELECT DBO.getExp(4) Exp;
SELECT * from Staff.Employees


