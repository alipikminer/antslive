uses GraphABC;
//                 [number]
var
  antx, anty: array[1..100] of integer;

var
  map: array[1..500] of array[1..500] of array[1..2] of integer;

var
  i, ii, x, y, t: integer;

var
  text: string;

begin
randomize();
//Заполение всего экрана замлёй
for i := 1 to 500 do
begin
for ii := 1 to 500 do
begin
map[i][ii][2]:=5;  
end;   
end;
//создание муравьишек
for i:= 1 to 10 do

begin
x:=random(1,500);
y:=random(1,500);
antx[i]:=x;
anty[i]:=y;
map[antx[i]][anty[i]][2]:=1;
map[antx[i]+1][anty[i]][2]:=2;
map[antx[i]-1][anty[i]][2]:=2;
map[antx[i]][anty[i]+1][2]:=2;
map[antx[i]][anty[i]-1][2]:=2;
end;

repeat

//обновление экрана
for i := 1 to 500 do
begin
for ii := 1 to 500 do
begin
if map[i][ii][2]<>map[i][ii][1] then
begin
 case map[i][ii][2] of
1:setpixel(i,ii,clBlack);
2:setpixel(i,ii,clRed);
3:setpixel(i,ii,clBrown);
4:setpixel(i,ii,clBrown);
5:setpixel(i,ii,clFireBrick);
end;
end;
map[i][ii][1]:=map[i][ii][2];
end;
end;

//муравьи идут
for i:=1 to 10 do
begin
x:=random(-1,1);
y:=random(-1,1);
if antx[i]<=2 then if x<=0 then x:=1;
if anty[i]<=2 then if y<=0 then y:=1;
if antx[i]>=498 then if x>=0 then x:=-1;
if anty[i]>=498 then if y>=0 then y:=-1;
antx[i]:=antx[i]+x;
anty[i]:=anty[i]+y;
end;

//муравьи копают
for i:=1 to 10 do
begin
map[antx[i]][anty[i]][2]:=1;
map[antx[i]+1][anty[i]][2]:=2;
map[antx[i]-1][anty[i]][2]:=2;
map[antx[i]][anty[i]+1][2]:=2;
map[antx[i]][anty[i]-1][2]:=2;
map[antx[i]-1][anty[i]-1][2]:=2;
map[antx[i]+1][anty[i]-1][2]:=2;
map[antx[i]+1][anty[i]+1][2]:=2;
map[antx[i]-1][anty[i]+1][2]:=2;
end;


until 2=3;
end.