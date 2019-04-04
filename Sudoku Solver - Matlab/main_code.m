%%%
clc;
close all;
clear all;
J  = imread('364px-Sudoku-by-L2G-20050714.png');
%rotI = imrotate(I,33,'crop');
I=rgb2gray(J);
BW = edge(I,'canny');
I=im2bw(I);
[H,T,R] = hough(BW);
P = houghpeaks(H,100,'threshold',ceil(0.7*max(H(:))));
% Find lines and plot them
lines = houghlines(BW,T,R,P,'FillGap',500,'MinLength',7);
figure, imshow(J), hold on
kl=1;
kv=1;
for k = 1:length(lines)
   xy = [lines(k).point1; lines(k).point2];
   plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');
   if lines(k).theta>-10 && lines(k).theta<10
       hlines(kl)=lines(k);
       kl=kl+1;
   else
       vlines(kv)=lines(k);
       kv=kv+1;
   end
end
for kl=1:length(hlines)
    for k=1:length(hlines)-1
        if hlines(k).point1(1)>hlines(k+1).point1(1)
            temp=hlines(k);
            hlines(k)=hlines(k+1);
            hlines(k+1)=temp;
        end
    end
end
    
for kl=1:length(vlines)
    for k=1:length(vlines)-1
        if vlines(k).point1(2)>vlines(k+1).point1(2)
            temp=vlines(k);
            vlines(k)=vlines(k+1);
            vlines(k+1)=temp;
        end
    end
end

for k = 1:3:length(hlines)
   xy = [hlines(k).point1; hlines(k).point2];
   plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','blue');
   xy = [vlines(k).point1; vlines(k).point2];
   plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','red');

end
%%%
sudoku=zeros(9,9);
for x=1:length(hlines)-1
    for y=1:length(vlines)-1
        for i=vlines(x).point1(2)+5:vlines(x+1).point1(2)-7
            for j=hlines(y).point1(1)+5:hlines(y+1).point1(1)-7
                temp1(i-vlines(x).point1(2)+1-5,j-hlines(y).point1(1)+1-5)=BW(i,j);
                temp2(i-vlines(x).point1(2)+1-5,j-hlines(y).point1(1)+1-5)=I(i,j);
                end
        end
               s=size(temp1);
        for i=1:s(1)-3
            for j=1:s(2)-3
                temp3(i,j)=temp1(i,j);
                
            end
        end
        for i=1:s(1)-3
            for j=1:s(2)-3
                temp4(i,j)=temp2(i,j);
                
            end
        end
        
        num=0;
                se=strel('disk',1);
                temp1=imopen(temp1,se);
                %temp1=imerode(temp1,se);
                %figure,imshow(temp3);
                results = ocr(temp1, 'TextLayout', 'Block');
                if ~isempty(results.Words)
                     if results.Text(1)=='1'
                     num=1;
                elseif results.Text(1)=='2'
                      num=2;
                elseif results.Text(1)=='3'
                    num=3;
                elseif results.Text(1)=='4'
                     num=4;
                elseif results.Text(1)=='5'
                    num=5;
                elseif results.Text(1)=='6'
                    num=6;
                elseif results.Text(1)=='7'
                    num=7;
                elseif results.Text(1)=='8'
                    num=8;
                elseif results.Text(1)=='9'
                    num=9;
                else
                     num=0;
                     end
                end
                if num==0
                results = ocr(temp3, 'TextLayout', 'Block');
                if ~isempty(results.Words)
                     if results.Text(1)=='1'
                     num=1;
                elseif results.Text(1)=='2'
                      num=2;
                elseif results.Text(1)=='3'
                    num=3;
                elseif results.Text(1)=='4'
                     num=4;
                elseif results.Text(1)=='5'
                    num=5;
                elseif results.Text(1)=='6'
                    num=6;
                elseif results.Text(1)=='7'
                    num=7;
                elseif results.Text(1)=='8'
                    num=8;
                elseif results.Text(1)=='9'
                    num=9;
                else
                     num=0;
                     end
                end
                end
                
                if num==0
                     results = ocr(temp2, 'TextLayout', 'Block');
                if ~isempty(results.Words)
                     if results.Text(1)=='1'
                     num=1;
                elseif results.Text(1)=='2'
                      num=2;
                elseif results.Text(1)=='3'
                    num=3;
                elseif results.Text(1)=='4'
                     num=4;
                elseif results.Text(1)=='5'
                    num=5;
                elseif results.Text(1)=='6'
                    num=6;
                elseif results.Text(1)=='7'
                    num=7;
                elseif results.Text(1)=='8'
                    num=8;
                elseif results.Text(1)=='9'
                    num=9;
                else
                     num=0;
                     end
                end
                end
                if num==0
                results = ocr(temp4, 'TextLayout', 'Block');
                if ~isempty(results.Words)
                     if results.Text(1)=='1'
                     num=1;
                elseif results.Text(1)=='2'
                      num=2;
                elseif results.Text(1)=='3'
                    num=3;
                elseif results.Text(1)=='4'
                     num=4;
                elseif results.Text(1)=='5'
                    num=5;
                elseif results.Text(1)=='6'
                    num=6;
                elseif results.Text(1)=='7'
                    num=7;
                elseif results.Text(1)=='8'
                    num=8;
                elseif results.Text(1)=='9'
                    num=9;
                else
                     num=0;
                     end
                end
                end
                
                sudoku(x,y)=num;
         
    end
end

sudoku_solved=sudoku1(sudoku);

for x=1:length(hlines)-1
    for y=1:length(vlines)-1
        if sudoku(x,y)==0
                 text(hlines(y).point1(1)+20,vlines(x).point1(2)+20,num2str(sudoku_solved(x,y)))
                
        end
    end
end