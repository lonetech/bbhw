-- Compile with: gnat make bbhw

with Ada.Command_Line;    use Ada.Command_Line;
with Ada.Strings;         use Ada.Strings;
with Ada.Strings.Fixed;   use Ada.Strings.Fixed;
with Ada.Text_IO;         use Ada.Text_IO;

procedure BBHW is	-- Bye Bye Hello World
   Count: Natural;
   procedure Complain(S: String) is
   begin
      Put("Bad count " & S & ". ");
   end;
   procedure AskLoop is
   begin
      loop
         Put("Count? ");
         declare 
            S: String := Get_Line;
         begin
            Count := Natural'Value(S);
	    exit;
         exception
            when E : Constraint_Error =>
	       Complain(S);
         end;
      end loop;
   end;
begin
   if Argument_Count = 1 then
      begin
         Count := Natural'Value(Argument(1));
      exception
         when E : Constraint_Error =>
	    Complain(Argument(1));
	    AskLoop;
      end;
   else
      AskLoop;
   end if;
   Put("World, Hello...");
   for I in reverse 1 .. Count loop
      Put(Trim(Natural'Image(I), Left) & "...");
      delay Duration(1);
   end loop;
   Put_Line("Bye Bye.");
end;
