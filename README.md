# Sudoku-Solver
A c++ code using backtracking algorithm to solve any solvable sudoku.

This code has been improvised to use digital image processing to segment the lines given in the sudoku to extract the data of the sudoku into a 9*9 matrix. A blank sudoku is given below along with anothe image showning the segmentation done by the matlab code.

<p align="center">
 <img src="https://github.com/Sree-Aslesh/Sudoku-Solver/blob/master/Media/blank-sudoku-grid.png" width="300" />  
 <img src="https://github.com/Sree-Aslesh/Sudoku-Solver/blob/master/Media/segmented.png" width="300" /> 
</p>

A sample sudoku is given below.

<p align="center">
  <img width="300" height="300" src="https://github.com/Sree-Aslesh/Sudoku-Solver/blob/master/Media/364px-Sudoku-by-L2G-20050714.png">
</p>


This sudoku runs through a backtracking algorithm to solve the sudoku. Backtracking is an algorithmic-technique for solving problems recursively by trying to build a solution incrementally, one piece at a time, removing those solutions that fail to satisfy the constraints of the problem at any point of time. The following gif file helps visualize the backtracking algorithm being implemented on the sudoku.

<p align="center">
  <img width="300" height="300" src="https://github.com/Sree-Aslesh/Sudoku-Solver/blob/master/Media/Sudoku_solved_by_bactracking.gif">
</p>

The results of the sudoku solver are shown by ovelapping the image of the initially taken sudoku and the output produced. An example of an output is shown below.

<p align="center">
  <img width="300" height="300" src="https://github.com/Sree-Aslesh/Sudoku-Solver/blob/master/Media/solved.png">
</p>


