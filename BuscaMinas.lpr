program buscaMinas;
uses Crt;
const n=5;
var
  table:array[1..n,1..n] of Char;
  tableF:array[1..n,1..n] of Char;
  i,j,max,x,slot,f,c:Integer;
  action,count,amount,key,selected:Char;
  winner,losser:Boolean;

procedure load();
begin
  randomize;

  max := 10000;
  amount := '0';
  for i:=1 to n do
    for j:=1 to n do
      begin
        x := Random(100);
        if(x > 35) then
          table[i,j] := ' '
        else
          if(max > 0) then
            begin
              table[i,j] := '*';
              amount := Chr(Ord(amount) + 1);
            end
          else
            table[i,j] := ' ';

        max := max - 1;
      end;

  for i:=1 to n do
    for j:=1 to n do
      tableF[i,j] := ' ';
end;

procedure showTable();
begin
  clrscr();
  writeln('+---+---+---+---+---+');
  for i:=1 to n do
    begin
      write('|');
      for j:=1 to n do
        write(' ', tableF[i,j], ' |');

      writeln;
      writeln('+---+---+---+---+---+');
    end;
end;

procedure menu();
begin
  writeln;
  writeln('Hacer jugada. (Accion Casilla)');
  writeln('Acciones posibles:');
  writeln('s - cic normal en la casilla.');
  writeln('f - Colocar una bandera en una casilla.');
  writeln('u - Sacar una bandera en una casilla.');
  writeln('Slots: del 1 al 25');
end;

function slotF(z:Integer) : Integer;
begin
  case z of
    1: slotF := 1;
    2: slotF := 1;
    3: slotF := 1;
    4: slotF := 1;
    5: slotF := 1;
    6: slotF := 2;
    7: slotF := 2;
    8: slotF := 2;
    9: slotF := 2;
    10: slotF := 2;
    11: slotF := 3;
    12: slotF := 3;
    13: slotF := 3;
    14: slotF := 3;
    15: slotF := 3;
    16: slotF := 4;
    17: slotF := 4;
    18: slotF := 4;
    19: slotF := 4;
    20: slotF := 4;
    21: slotF := 5;
    22: slotF := 5;
    23: slotF := 5;
    24: slotF := 5;
    25: slotF := 5;
  end;
end;

function slotC(z:Integer) : Integer;
begin
  case z of
    1: slotC := 1;
    2: slotC := 2;
    3: slotC := 3;
    4: slotC := 4;
    5: slotC := 5;
    6: slotC := 1;
    7: slotC := 2;
    8: slotC := 3;
    9: slotC := 4;
    10: slotC := 5;
    11: slotC := 1;
    12: slotC := 2;
    13: slotC := 3;
    14: slotC := 4;
    15: slotC := 5;
    16: slotC := 1;
    17: slotC := 2;
    18: slotC := 3;
    19: slotC := 4;
    20: slotC := 5;
    21: slotC := 1;
    22: slotC := 2;
    23: slotC := 3;
    24: slotC := 4;
    25: slotC := 5;
  end;
end;

procedure select(z:Integer);
begin
  f := slotF(z);
  c := slotC(z);

  if(table[f,c] = '*') then
    losser := true
  else
    begin
      count := '0';
      if(f = 1) then
        begin
          if(c = 1) then
            begin
              if(table[f,c+1] = '*') then
                count := Chr(Ord(count) + 1);
              if(table[f+1,c] = '*') then
                count := Chr(Ord(count) + 1);
              if(table[f+1,c+1] = '*') then
                count := Chr(Ord(count) + 1);
            end
          else
            begin
              if(c = n) then
                begin
                  if(table[f,c-1] = '*') then
                    count := Chr(Ord(count) + 1);
                  if(table[f+1,c-1] = '*') then
                    count := Chr(Ord(count) + 1);
                  if(table[f+1,c] = '*') then
                    count := Chr(Ord(count) + 1);
                end
              else
                begin
                  if(table[f,c-1] = '*') then
                    count := Chr(Ord(count) + 1);
                  if(table[f,c+1] = '*') then
                    count := Chr(Ord(count) + 1);
                  if(table[f+1,c-1] = '*') then
                    count := Chr(Ord(count) + 1);
                  if(table[f+1,c] = '*') then
                    count := Chr(Ord(count) + 1);
                  if(table[f,c+1] = '*') then
                    count := Chr(Ord(count) + 1);
                end;
            end;
        end;
      if(f = n) then
        begin
          if(c = 1) then
            begin
              if(table[f-1,c] = '*') then
                count := Chr(Ord(count) + 1);
              if(table[f-1,c+1] = '*') then
                count := Chr(Ord(count) + 1);
              if(table[f,c+1] = '*') then
                count := Chr(Ord(count) + 1);
            end
          else
            begin
              if(c = n) then
                begin
                  if(table[f-1,c] = '*') then
                    count := Chr(Ord(count) + 1);
                  if(table[f-1,c-1] = '*') then
                    count := Chr(Ord(count) + 1);
                  if(table[f,c-1] = '*') then
                    count := Chr(Ord(count) + 1);
                end
              else
                begin
                  if(table[f,c-1] = '*') then
                    count := Chr(Ord(count) + 1);
                  if(table[f-1,c-1] = '*') then
                    count := Chr(Ord(count) + 1);
                  if(table[f-1,c] = '*') then
                    count := Chr(Ord(count) + 1);
                  if(table[f-1,c+1] = '*') then
                    count := Chr(Ord(count) + 1);
                  if(table[f,c+1] = '*') then
                    count := Chr(Ord(count) + 1);
                end;
            end;
        end;
      if(f >= 2) and (f <= (n-1)) then
        begin
          if(c = 1) then
            begin
              if(table[f-1,c] = '*') then
                count := Chr(Ord(count) + 1);
              if(table[f-1,c+1] = '*') then
                count := Chr(Ord(count) + 1);
              if(table[f,c+1] = '*') then
                count := Chr(Ord(count) + 1);
              if(table[f+1,c+1] = '*') then
                count := Chr(Ord(count) + 1);
              if(table[f+1,c] = '*') then
                count := Chr(Ord(count) + 1);
            end
          else
            begin
              if(c = n) then
                begin
                  if(table[f-1,c] = '*') then
                    count := Chr(Ord(count) + 1);
                  if(table[f-1,c-1] = '*') then
                    count := Chr(Ord(count) + 1);
                  if(table[f,c-1] = '*') then
                    count := Chr(Ord(count) + 1);
                  if(table[f+1,c-1] = '*') then
                    count := Chr(Ord(count) + 1);
                  if(table[f+1,c] = '*') then
                    count := Chr(Ord(count) + 1);
                end
              else
                begin
                  if(table[f-1,c-1] = '*') then
                    count := Chr(Ord(count) + 1);
                  if(table[f-1,c] = '*') then
                    count := Chr(Ord(count) + 1);
                  if(table[f-1,c+1] = '*') then
                    count := Chr(Ord(count) + 1);
                  if(table[f,c-1] = '*') then
                    count := Chr(Ord(count) + 1);
                  if(table[f,c+1] = '*') then
                    count := Chr(Ord(count) + 1);
                  if(table[f+1,c-1] = '*') then
                    count := Chr(Ord(count) + 1);
                  if(table[f+1,c] = '*') then
                    count := Chr(Ord(count) + 1);
                  if(table[f+1,c+1] = '*') then
                    count := Chr(Ord(count) + 1);
                end;
            end;
        end;

      tableF[f,c] := count;
    end;
end;

function hasFlag(z:Integer) : Boolean;
begin
  f := slotF(z);
  c := slotC(z);

  if(tableF[f,c] = 'F') then
    hasFlag := true
  else
    hasFlag := false;
end;

function isClicked(z:Integer) : Boolean;
begin
  f := slotF(z);
  c := slotC(z);

  if(tableF[f,c] = ' ') then
    isClicked := false
  else
    isClicked := true;
end;

procedure addFlag(z:Integer);
begin
  f := slotF(z);
  c := slotC(z);

  tableF[f,c] := 'F';
end;

procedure removeFlag(z:Integer);
begin
  f := slotF(z);
  c := slotC(z);

  tableF[f,c] := ' ';
end;

procedure win();
begin
  count := '0';
  for i:=1 to n do
    for j:=1 to n do
      if(table[i,j] = '*') and (tableF[i,j] = 'F') then
        count := Chr(Ord(count) + 1);

  if(count = amount) then
    winner := true;
end;


procedure playerLose();
begin
  clrscr();
  TextBackground(Red);
  TextColor(Black);
  writeln('+---+---+---+---+---+');
  for i:=1 to n do
    begin
      write('|');
      for j:=1 to n do
        write(' ', table[i,j], ' |');

      writeln;
      writeln('+---+---+---+---+---+');
    end;

  writeln('Has perdido!');
end;

procedure playerWin();
begin
  clrscr();
  TextBackground(Green);
  TextColor(Black);
  writeln('+---+---+---+---+---+');
  for i:=1 to n do
    begin
      write('|');
      for j:=1 to n do
        write(' ', table[i,j], ' |');

      writeln;
      writeln('+---+---+---+---+---+');
    end;

  writeln('Has ganado!');
end;

procedure MainMenu();
begin
  clrscr();
  if(selected = '1') then
    begin
      writeln('+---+---+---+---+---+---+---+');
      writeln;
      writeln('        Busca   Minas        ');
      writeln;
      writeln('+---+---+---+---+---+---+---+');
      writeln;
      writeln('- Play -');
      writeln('  Exit  ');
    end
  else
    begin
      writeln('+---+---+---+---+---+---+---+');
      writeln;
      writeln('        Busca   Minas        ');
      writeln;
      writeln('+---+---+---+---+---+---+---+');
      writeln;
      writeln('  Play  ');
      writeln('- Exit -');
    end;
end;

begin

  selected := '1';

  repeat

  MainMenu();

  key := ReadKey;

  if(key = #72) then
    begin
      if(selected = '1') then
        selected := '2'
      else
        selected := '1';
    end
  else
      if(key = #80) then
        begin
          if(selected = '1') then
            selected := '2'
          else
            selected := '1';
        end;

  until key = #13;

  if(selected = '1') then
    begin
      load();

      while(winner = false) and (losser = false) do
        begin
          showTable();

          menu();
          readln(action,slot);

          while(action <> 's') and (action <> 'f') and (action <> 'u') do
            begin
              writeln('Accion invalida.');
              writeln('Ingresa otra vez la Accion y Slot');
              readln(action, slot);
            end;

          if(action <> 'u') then
            while(isClicked(slot) = true) do
              begin
                writeln('Elije otra casilla diferente.');
                readln(slot);
              end;


          case action of
            's': select(slot);
            'f': addFlag(slot);
            'u':
                if(hasFlag(slot) = true) then
                  removeFlag(slot);
          end;

          win();

        end;

      if(winner = false) and (losser = true) then
        playerLose()
      else
        playerWin();
    end
  else
    writeln('Saliendo del juego...');

  readln;

end.
