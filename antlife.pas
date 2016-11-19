//uses GraphABC;
//             [x]             [y]             [number]
var ant:array[1..100] of array[1..100] of array[1..100] of string;
var i,x,y,t: integer;
var text: string;
begin
randomize();
for i:=1 to 100 do
begin
x:=random(1,50);
y:=random(1,50);
t:=random(1,5);
text:='x : '+x+' y : '+y+' type : '+t+' number : '+i;
ant[x][y][i]:=text;
writeln (ant[x][y][i]);
end;

end.