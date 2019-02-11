with Ada.Text_IO;                       use Ada.Text_IO;
with Ada.Integer_Text_IO;               use Ada.Integer_Text_IO;
with Ada.Command_Line;                  use Ada.Command_Line;
with Ada.Numerics.Discrete_Random;

procedure lab3delb is
   
   type Ar_Type is array (1..20) of Integer;
   type Matrix is array (1..2) of Ar_Type;
   
    --Underprogram för generering av nummer
   procedure Generate_Numbers(Random_Ar : out Ar_Type) is
      subtype Num is Integer range 1 .. 10;
      package Random_Num is 
	 new Ada.Numerics.Discrete_Random(Result_Subtype => Num);
         use Random_Num;
      G : Generator;
      
      --Något i Generate_Numbers måste redigerats för att ta hänsyn till matrisen och att den innehåller två fält med 20 nummer vardera. 
      
   begin
      Reset(G);
      for I in 1 .. 20 loop
	 Random_Ar(I) := Random(G);
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
   procedure Sort(Ar : in out Ar_Type) is
      begin
	 for K in  2 .. 19 loop
	    for I in reverse K .. 20 loop
	       if Ar(I) < Ar(I-1) then
		  Swap(Ar(I), Ar(I-1));
	       end if;
	    end loop;
	 end loop;
      end Sort;
	      
      Ar  : Ar_Type;
      Mat : Matrix;
   
begin   
   Generate_Numbers(Ar);
      for I in 1 .. 20 loop
	 for P in 1 .. 2 loop
	    Put(Mat(Ar(I((P)), Width => 3)));
	 end loop;
	 New_Line;
      end loop;
   
   New_Line;
   Put("Sortering av numren:");
   New_Line;
   
   Sort(Ar);
   for I in 1 .. 40 loop
      Put(Ar(I), Width => 1);
      New_Line;
   end loop;
      
end lab3delb;
