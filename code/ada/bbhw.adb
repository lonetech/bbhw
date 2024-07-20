with Ada.Command_Line;  use Ada.Command_Line;
with Ada.Strings;       use Ada.Strings;
with Ada.Strings.Fixed; use Ada.Strings.Fixed;
with Ada.Text_IO;       use Ada.Text_IO;

procedure BBHW is	-- Bye Bye Hello World
   Count: Natural;
   function Check(S: String) return Boolean is
   begin
      Count := Natural'Value(S);
      return True;
   exception
      when E : Constraint_Error =>
         Put("Bad count " & S & ". ");
         return False;
   end;
begin
   if Argument_Count /= 1
	   or else not Check(Argument(1)) then
      loop
	 Put("Count? ");
	 exit when Check(Get_Line);
      end loop;
   end if;
   Put("World, Hello...");
   for I in reverse 1 .. Count loop
      Put(Trim(I'Image, Left) & "...");
      delay Duration(1);
   end loop;
   Put_Line("Bye Bye.");
end;
