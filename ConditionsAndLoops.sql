-- 1.)
-- For finding prime
DELIMITER //
create procedure prime(in num int,out res int,out sres varchar(30))
begin 
declare i int default 2;
declare c int default 0;
set res=1;
set sres='1'; 
while(i<=num) do 
if(num mod i=0) then set c=c+1;
set sres=concat(sres,',',i);
end if;
set i=i+1;
end while;
if(c>2) then set res=0;
end if;
end //


DELIMITER ;

-- For factorial 
create procedure fact(in num int)
begin 
declare prod int default 1;
call prime(num,@res,@sres);
if(@res=1) then
while(num<>0) do   
 set prod=num*prod;
 set num=num-1;
 end while;
select prod; 
else select @sres; 
end if;
 end //


DELIMITER //


-- 2.) 
create procedure palin(in n int, inout res varchar(10))
 begin 
declare x,r,rev int;
set x = n;  
set rev = 0;
while x > 0 do
set r = x %10;
set rev =(rev * 10) + r;
set x = x div 10;
end while;
if (rev = n) then
set @res = 'YES';
else
set @res = 'NO';
end if; 
select @res;
end // 

