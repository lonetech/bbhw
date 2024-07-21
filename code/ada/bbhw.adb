with Ada.Command_Line;  use Ada.Command_Line;
with Ada.Strings;       use Ada.Strings;
with Ada.Strings.Fixed; use Ada.Strings.Fixed;
with Ada.Text_IO;       use Ada.Text_IO;

procedure BBHW is  --  Bye Bye Hello World
   Count : Natural;
   function Check (S : String) return Boolean;
   function Check (S : String) return Boolean is
   begin
      Count := Natural'Value (S);
      return True;
   exception
      when Unused : Constraint_Error =>
         Put_Line ("Invalid countdown """ & S & """, try again...");
         return False;
   end Check;
begin
   if Argument_Count /= 1
     or else not Check (Argument (1))
   then
      loop
         Put ("countdown: ");
         exit when Check (Get_Line);
      end loop;
   end if;
   Put ("World, Hello...");
   for J in reverse 1 .. Count loop
      Put (Trim (J'Image, Left) & "...");
      delay Duration (1);
   end loop;
   Put_Line ("Bye Bye.");
end BBHW;
