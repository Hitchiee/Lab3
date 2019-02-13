with Ada.Text_IO;                       use Ada.Text_IO;
with Ada.Integer_Text_IO;               use Ada.Integer_Text_IO;
with Ada.Command_Line;                  use Ada.Command_Line;
with Ada.Numerics.Discrete_Random;

procedure lab3delb is
   
   type Integer_Array is array (1..2) of Integer;
   type Matrix is array (1..20) of Integer_Array;
   
   --Underprogram för generering av nummer
   procedure Generate_Numbers(Random_Mat : out Matrix) is
      subtype Num is Integer range 1 .. 10;
      package Random_Num is 
	 new Ada.Numerics.Discrete_Random(Result_Subtype => Num);
      use Random_Num;
      G : Generator;
      
   begin
      Reset(G);
      for I in 1 .. 20 loop
	 for P in 1 .. 2 loop
	    Random_Mat(I)(P) := Random(G);
	 end loop;
	 --Put(Random_Ar(I), Width => 1); (testline för generation)
	 --New_Line;
      end loop;
   end Generate_Numbers;
   
   --Underprogram för swappande av numren
   procedure Swap(A, B : in out Integer) is
      C : Integer := 1;
   begin
      C := A;
      A := B;
      B := C;
   end Swap;
   
   --Underprogram för sortering av numren
   --OBS att en rad lades till, och två redigerades, inför del B, så Sort är inte helt omodifierad. 
   --Jag ser inte hur detta skulle kunna lösas genom en helt omodifierad "Sort(Ar)"-procedure, då talparen i sig inte hade bytt plats. Om bara det andra talet (Mat(I)(2)) hade behövt byta plats med föregående tal hade detta inte varit ett större problem, ty man hade kunnat deklarera Ar := Mat(I)(2); och köra med den tidigare Sort(Ar)-proceduren.
   procedure Sort(Mat : in out Matrix) is
   begin
      for K in  2 .. 19 loop
	 for I in reverse K .. 20 loop
	    if Mat(I)(2) < Mat(I-1)(2) then
	       Swap(Mat(I)(1), Mat(I-1)(1));
	       Swap(Mat(I)(2), Mat(I-1)(2));
	    end if;
	 end loop;
      end loop;
   end Sort;
	      
   Mat : Matrix;
   
begin  
   Generate_Numbers(Mat);
   
   New_Line;
   for I in 1 .. 20 loop
      Put(Mat(I)(1), Width => 3);
      Put(Mat(I)(2), Width => 5);
      New_Line;
   end loop;
   
   New_Line;
   Put("Sortering av talen:");
   New_Line;
   
   Sort(Mat);
   for I in 1 .. 20 loop
      Put(Mat(I)(1), Width => 3);
      Put(Mat(I)(2), Width => 5);
      New_Line;
   end loop;
      
end lab3delb;
