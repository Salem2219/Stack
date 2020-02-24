# Stack
Basic vhdl program represents class stack. Stack is an abstract data type with the functions:
- stack_init () : Make the stack empty.
- empty () : Return true if the stack is empty. Return false if the stack is not empty.
- push (val) : Add the item val to the stack.
- pop () : Remove the item most recently added to the stack.
- top () : Return the item most recently added to the stack, but do not remove it.

The program takes as inputs :
- clk, rst.
- en (single bit) : The functions run if en = '1' else they do not run.
- I(3 bits) : I specifies which function will run.

000  stack_init
001  empty
010  push
011  pop
100  top
- din(8 bits) : The value which push function takes to add it to the stack.
The program has outputs :
- empty(single bit) : The output of the function empty() when I = "001".
- top (8 bits) : The output of the function top() when I ="100".





- To install :
These examples use ModelSim® and Quartus® Prime from Intel FPGA, GIT, Visual Studio Code, make sure they are installed locally on your computer before proceeding.


- Grab a copy of this repository to your computer's local folder (i.e. C:\projects):

$ cd projects
$ git clone https://github.com/Salem2219/stack.git
- Use Visual Studio Code (VSC) to edit and view the design files:

$ cd stack
$ code .
- Click on the toplevel.vhd file in the left pane to view its contents.

- From the VSC View menu, choose Terminal, in the VCS Terminal, create a "work" library:

$ vlib work
- Compile all the design units:

$ vcom *.vhd
- Simulate your design.

$ vsim work.gcd_toplevel_tb

