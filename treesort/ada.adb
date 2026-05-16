with Ada.Text_IO; use Ada.Text_IO;

procedure Ada is
   type Node;
   type Node_Ptr is access Node;
   type Node is record
      Val   : Integer;
      Left  : Node_Ptr := null;
      Right : Node_Ptr := null;
   end record;

   procedure Insert (Root : in out Node_Ptr; V : Integer) is
   begin
      if Root = null then
         Root := new Node'(Val => V, Left => null, Right => null);
      elsif V < Root.Val then
         Insert (Root.Left, V);
      else
         Insert (Root.Right, V);
      end if;
   end Insert;

   procedure Inorder (N : Node_Ptr) is
   begin
      if N = null then return; end if;
      Inorder (N.Left);
      Put (Integer'Image (N.Val));
      Inorder (N.Right);
   end Inorder;

   Root : Node_Ptr := null;
   Arr  : constant array (1 .. 7) of Integer := (5, 3, 7, 1, 4, 6, 8);
begin
   for V of Arr loop
      Insert (Root, V);
   end loop;
   Inorder (Root);
   New_Line;
end Ada;
