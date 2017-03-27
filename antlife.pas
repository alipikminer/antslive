uses GraphABC;
//                 [number]
var
  anttime, antx, anty, larvax, larvay, larvatime: array[1..100] of integer;
var
antfun,antfriend: array[1..100] of integer;
var
  map: array[1..500] of array[1..500] of array[1..2] of integer;
var antmemory: array[1..100] of array[1..100]of array[1..2] of integer;
var
  i, ii, x, y, t, gen, n: integer;

var
  text: string;

begin
  randomize();
  //Заполение всего экрана выкопанной землёй замлёй
  for i := 1 to 500 do
  begin
    for ii := 1 to 500 do
    begin
      map[i][ii][2] := 2;  
    end;   
  end;
  //Заполнение экрана невыкопанной землёй
   for i := 5 to 495 do
  begin
    for ii := 5 to 495 do
    begin
      map[i][ii][2] := 5;  
    end;   
  end;
  //Заполение правого экрана пустотой
  for i := 1 to 100 do
  begin
    for ii := 1 to 100 do
    begin
     antmemory[i][ii][2] := 5;  
    end;   
  end;
  //создание муравьишек
  for i := 1 to 10 do
  
  begin
    x := random(1, 500);
    y := random(1, 500);
    antx[i] := x;
    anty[i] := y;
    map[antx[i]][anty[i]][2] := 1;
    map[antx[i] + 1][anty[i]][2] := 2;
    map[antx[i] - 1][anty[i]][2] := 2;
    map[antx[i]][anty[i] + 1][2] := 2;
    map[antx[i]][anty[i] - 1][2] := 2;
    anttime[i] := random(250, 1000);
  end;
  //привязка муравьишек друг к другу
  for i:=1 to 10 do
  begin
  antfriend[i]:=random(1,10);
  end;
  repeat
    
    //обновление экрана
    for i := 1 to 500 do
    begin
      for ii := 1 to 500 do
      begin
        if map[i][ii][2] <> map[i][ii][1] then
        begin
          case map[i][ii][2] of
            1: setpixel(i, ii, clBlack);
            2: setpixel(i, ii, clRed);
            3: setpixel(i, ii, clWhite);
            4: setpixel(i, ii, clGreen);
            5: setpixel(i, ii, clFireBrick);
          end;
        end;
        map[i][ii][1] := map[i][ii][2];
      end;
    end;
    //обновление правого экрана
    for i := 1 to 100 do
    begin
      for ii := 1 to 100 do
      begin
        if antmemory[i][ii][2] <> antmemory[i][ii][1] then
        begin
          case antmemory[i][ii][2] of
            1: setpixel(i+500, ii, clGreen);
            2: setpixel(i+500, ii, clLime);
            3: setpixel(i+500, ii, clRed);
            4: setpixel(i+500, ii, clWhite);
            5: setpixel(i+500, ii, clBlack);
          end;
        end;
        antmemory[i][ii][1] := antmemory[i][ii][2];
      end;
    end;
    //муравьи идут
    for i := 1 to 10 do
    begin
      if anttime[i] > 0 then
      begin
    if antx[i] <= 495 then if map[antx[i]+2][anty[i]][2]=5 then  x:=1;
    if antx[i] >= 5 then if map[antx[i]-2][anty[i]][2]=5 then  x:=-1;
    if anty[i] <= 495 then if map[antx[i]][anty[i]+2][2]=5 then  x:=1;
    if anty[i] >= 5 then if map[antx[i]][anty[i]-2][2]=5 then  x:=-1;
      if map[antx[i]+2][anty[i]][2]>=5 then if map[antx[i]-2][anty[i]][2]>=5 then if map[antx[i]][anty[i]+2][2]>=5 then if map[antx[i]][anty[i]-2][2]>=5 then x := random(-1, 1); y := random(-1, 1);
      
      if antx[i] <= 495 then if map[antx[i]+3][anty[i]][2]=5 then  x:=1;
    if antx[i] >= 5 then if map[antx[i]-3][anty[i]][2]=5 then  x:=-1;
    if anty[i] <= 495 then if map[antx[i]][anty[i]+3][2]=5 then  x:=1;
    if anty[i] >= 5 then if map[antx[i]][anty[i]-3][2]=5 then  x:=-1;
      if map[antx[i]+3][anty[i]][2]>=5 then if map[antx[i]-3][anty[i]][2]>=5 then if map[antx[i]][anty[i]+3][2]>=5 then if map[antx[i]][anty[i]-3][2]>=5 then x := random(-1, 1); y := random(-1, 1);
      
     
         //Алгоритм поиска других муравьёв и движения к ним
         if anttime[i]>=100001 then antmemory[1+i*9][2][2]:=2;
         if anttime[i]<=100000 then if anttime[i]>=75000 then
         begin
         if (antx[i]+30)<=(antx[antfriend[i]]) then if (antx[i]+31)>(antx[antfriend[i]]) then x:=1;
         if (antx[i]-30)>=(antx[antfriend[i]]) then if (antx[i]-31)<(antx[antfriend[i]]) then x:=-1;
         if (anty[i]+30)<=(anty[antfriend[i]]) then if (anty[i]+31)>(anty[antfriend[i]]) then y:=1;
         if (anty[i]-30)>=(anty[antfriend[i]]) then if (anty[i]-31)<(anty[antfriend[i]]) then y:=-1; 
         antmemory[1+i*9][2][2]:=2;
         end;
         if anttime[i]<=75000 then if anttime[i]>=50000 then
         begin
         if (antx[i]+60)<=(antx[antfriend[i]]) then if (antx[i]+61)>(antx[antfriend[i]]) then x:=1;
         if (antx[i]-60)>=(antx[antfriend[i]]) then if (antx[i]-61)<(antx[antfriend[i]]) then x:=-1;
         if (anty[i]+60)<=(anty[antfriend[i]]) then if (anty[i]+61)>(anty[antfriend[i]]) then y:=1;
         if (anty[i]-60)>=(anty[antfriend[i]]) then if (anty[i]-61)<(anty[antfriend[i]]) then y:=-1;
         antmemory[1+i*9][2][2]:=3;
         end;
         if anttime[i]<=50000 then
         begin
         if (antx[i]+90)<=(antx[antfriend[i]]) then if (antx[i]+91)>(antx[antfriend[i]]) then x:=1;
         if (antx[i]-90)>=(antx[antfriend[i]]) then if (antx[i]-91)<(antx[antfriend[i]]) then x:=-1;
         if (anty[i]+90)<=(anty[antfriend[i]]) then if (anty[i]+91)>(anty[antfriend[i]]) then y:=1;
         if (anty[i]-90)>=(anty[antfriend[i]]) then if (anty[i]-91)<(anty[antfriend[i]]) then y:=-1;
         antmemory[1+i*9][2][2]:=3;
         end;
       
        if antx[i] <= 5 then if x <= 0 then x := 1;
        if anty[i] <= 5 then if y <= 0 then y := 1;
        if antx[i] >= 495 then if x >= 0 then x := -1;
        if anty[i] >= 495 then if y >= 0 then y := -1;
      antx[i] := antx[i] + x;    
      anty[i] := anty[i] + y;
         { if (antx[i]+90)<=(antx[ii]) then if (antx[i]+91)>(antx[ii]) then antx[i]:=antx[i]+1;
         if (antx[i]-90)>=(antx[ii]) then if (antx[i]-91)<(antx[ii]) then antx[i]:=antx[i]-1;
         if (anty[i]+90)<=(anty[ii]) then if (anty[i]+91)>(anty[ii]) then anty[i]:=anty[i]+1;
         if (anty[i]-90)>=(anty[ii]) then if (anty[i]-91)<(anty[ii]) then anty[i]:=anty[i]-1;
         }
        //Взаимодействие между муравьями
        for ii := 1 to 10 do
        begin
          if ii<>i then 
          begin
          //Алгоритм поиска других муравьёв и радости
         if (antx[i]+10)<=(antx[ii]) then if (antx[i]+11)>(antx[ii]) then if (anty[i]+10)<=(anty[ii]) then if (anty[i]+11)>(anty[ii]) then antfun[i]:=500;
         if (antx[i]-10)>=(antx[ii]) then if (antx[i]-11)<(antx[ii]) then if (anty[i]+10)<=(anty[ii]) then if (anty[i]+11)>(anty[ii]) then antfun[i]:=500;
         if (anty[i]+10)<=(anty[ii]) then if (anty[i]+11)>(anty[ii]) then if (antx[i]-10)>=(antx[ii]) then if (antx[i]-11)<(antx[ii]) then antfun[i]:=500;
         if (anty[i]-10)>=(anty[ii]) then if (anty[i]-11)<(anty[ii]) then if (antx[i]-10)>=(antx[ii]) then if (antx[i]-11)<(antx[ii]) then antfun[i]:=500;
         
         // antfun[i]:=500;
          end;
        end;
      end;
      //личинки
      
      if anttime[i] > 0 then anttime[i] := anttime[i] - 1;
      if larvatime[i] = 0 then
      begin
        if anttime[i] = 50 then larvax[i] := antx[i];
        if anttime[i] = 50 then larvay[i] := anty[i];
        if anttime[i] = 50 then larvatime[i] := random(500, 1000);
      end;
      
    end;
    
    //муравьи копают
    for i := 1 to 10 do
    begin
    
    //если рад
    if antfun[i] >= 1 then
    begin
      map[antx[i]][anty[i]][2] := 4;
      map[antx[i] + 1][anty[i]][2] := 2;
      map[antx[i] - 1][anty[i]][2] := 2;
      map[antx[i]][anty[i] + 1][2] := 2;
      map[antx[i]][anty[i] - 1][2] := 2;
      map[antx[i] - 1][anty[i] - 1][2] := 2;
      map[antx[i] + 1][anty[i] - 1][2] := 2;
      map[antx[i] + 1][anty[i] + 1][2] := 2;
      map[antx[i] - 1][anty[i] + 1][2] := 2;
     anttime[i]:=anttime[i]+50;
     antfun[i]:=antfun[i]-1;
     antmemory[i*9][2][2]:=1;
    end;
    
    //если не рад
    if antfun[i] = 0 then
    begin
      map[antx[i]][anty[i]][2] := 1;
      map[antx[i] + 1][anty[i]][2] := 2;
      map[antx[i] - 1][anty[i]][2] := 2;
      map[antx[i]][anty[i] + 1][2] := 2;
      map[antx[i]][anty[i] - 1][2] := 2;
      map[antx[i] - 1][anty[i] - 1][2] := 2;
      map[antx[i] + 1][anty[i] - 1][2] := 2;
      map[antx[i] + 1][anty[i] + 1][2] := 2;
      map[antx[i] - 1][anty[i] + 1][2] := 2;
      antmemory[i*9][2][2]:=5;
    end;
    end;
    
    //личинки существуют
    for i := 1 to 10 do
    begin
      if larvatime[i] >= 51 then map[larvax[i]][larvay[i]][2] := 3;
      if larvatime[i] >= 51 then larvatime[i] := larvatime[i] - 1;
      if larvatime[i] = 50 then
      begin
        map[antx[i]][anty[i]][2] := 5;
        map[antx[i] + 1][anty[i]][2] := 5;
        map[antx[i] - 1][anty[i]][2] := 5;
        map[antx[i]][anty[i] + 1][2] := 5;
        map[antx[i]][anty[i] - 1][2] := 5;
        map[antx[i] - 1][anty[i] - 1][2] := 5;
        map[antx[i] + 1][anty[i] - 1][2] := 5;
        map[antx[i] + 1][anty[i] + 1][2] := 5;
        map[antx[i] - 1][anty[i] + 1][2] := 5;
        anttime[i] := random(250, 5000);
        antx[i] := larvax[i];
        anty[i] := larvay[i];
        larvatime[i] := 0;
        gen := gen + 1;
        textOut(512, 101, 'generation : ' + gen);
      end;
    end;
    textOut(512, 120, 'time : ' + t/100);
    t := t + 1;
    for i:=1 to 10 do
    begin
    textOut(512, i*10+i*3+130, 'ant '+i+' time : ' + anttime[i]/100);
    end;
    for i:=1 to 10 do
    begin
    textOut(512, i*10+i*3+260, 'ant '+i+' coods: ' + antx[i]+', '+anty[i]+'               ');
    end;
  until 2 = 3;
end.