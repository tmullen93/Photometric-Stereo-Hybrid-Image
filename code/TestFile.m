        %%% implement this %%%
        clear all
        A=randi(10,[10,5]);
        B=randi(10,[10,5]);
        sumARow=cumsum(A);
        sumBCol=cumsum(B,2);
        
        imageWidth=5;
        imageHeight=10;
        i=imageWidth;
        j=imageHeight;
        randN=randi(i);
        
        randX=randi(imageWidth,[1,randN]);
        randY=randi(imageHeight,[1,randN]);
        partitionX=unique(randX);
        partitionY=unique(randY);
        
        
        
%         countX=2;
%         countY=2;
%         while randX(end)<i || randY(end)<j
%             if randX~=i
%                 randX(countX)=randi([randX(end),i]);
%                 countX=countX+1;
%             end
%             
%             if randY~=j
%                 
%                 randY(countY)=randi([randY(end),j]);
%                 countY=countY+1;
%             end
%         end
%         randX
%         randY
