function solved_sudoku=solve_sudoku(sudoku)

solved_sudoku=sudoku;
zero=zeros(9,9);
submatrix=zeros(3,3,9);
sublabel=zeros(3,3,9);
submatrix(:,:,1)=sudoku(1:3,1:3);
submatrix(:,:,2)=sudoku(1:3,4:6);
submatrix(:,:,3)=sudoku(1:3,7:9);
submatrix(:,:,4)=sudoku(4:6,1:3);
submatrix(:,:,5)=sudoku(4:6,4:6);
submatrix(:,:,6)=sudoku(4:6,7:9);
submatrix(:,:,7)=sudoku(7:9,1:3);
submatrix(:,:,8)=sudoku(7:9,4:6);
submatrix(:,:,9)=sudoku(7:9,7:9);
for i=1:9
    sublabel(:,:,i)=i;
end
label=[sublabel(:,:,1) sublabel(:,:,2) sublabel(:,:,3);sublabel(:,:,4) sublabel(:,:,5) sublabel(:,:,6);sublabel(:,:,7) sublabel(:,:,8) sublabel(:,:,9)];
c=ones(9,9,1);

for x=1:9
    for y=1:9
        %solved_sudoku(x,y)=1;
        c(x,y,1)=0;
        if solved_sudoku(x,y)==0
        for z=1:9
            f1=0;
            for i=1:9
                for j=1:9
                    if z==sudoku(x,i)|| z==sudoku(j,y)
                        f1=1;
                        break;
                    end
                    for k=1:3
                        for l=1:3
                            if z==submatrix(k,l,label(x,y))
                                f1=1;
                                break;
                            end
                        end
                    end
                end
            end%f1=1 if z is in horizontal/vertical/submatrix 
            if f1==0
                c(x,y,1)=c(x,y,1)+1;
%                 disp(c(x,y,1))
%                 disp(x)
%                 disp(y)
%                 disp(z)
%                 disp('----------------')
                c(x,y,c(x,y,1)+1)=z;
            end
        end
%             if c(x,y,1)==0
%                 disp('No Solution');
%                 return;
%             end
%             if c(x,y,1)==1
%                 sudoku(x,y)=c(x,y,2);
%             end
%             
%             if c(x,y,1)>1
%                 for i=2:c(x,y,1+1)
%                     n=c(x,y,i);
%                     sudoku(x,y)=n;
%                     solved_sudoku=solve_sudoku(solved_sudoku);
%                 end
            end
        
        end
end
%while(c(:,:,1)~=zeros(9,9))
    for x=1:9
        for y=1:9
            if solved_sudoku(x,y)==0
                if c(x,y,1)==0
%                 disp('No Solution');
                return;
               % solved_sudoku=sudoku;
                
                end
                
%                 if c(x,y,1)==1
%                     solved_sudoku(x,y)=c(x,y,2);
%                     c(x,y,1)=0;
%                 end
            
                if c(x,y,1)>=1
%                     disp('ankit')
                    for i=2:(c(x,y,1)+1)
                        n=c(x,y,i);
                        solved_sudoku(x,y)=n;
                        solved_sudoku=solve_sudoku(solved_sudoku);
                        solved_sudoku=sudoku;
                    end
                    j=j-1;
                    %return
                end
                
            end
                if c(:,:,1)==zeros(9,9)
                    break;
                    
                end
        end
                if c(:,:,1)==zeros(9,9)
                    break;
                end
    end
%end
end


                 
                
                                
