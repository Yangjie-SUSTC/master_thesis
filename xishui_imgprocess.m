
close all; clear all; clc
index=[445,500,4256;181,211,3081;207,228,2029;301,351,1592];
%[224,310]


name={'5-50','50-100','100-200','200-300'};
path='D:\biye\实验数据\吸水树脂计算\';




%get_th(name,path,index)
Amat={};
for i=1:4
    imgpath=[path,name{i},'\'];
    ks=index(i,2);
    ke=index(i,3);
    thresh=get_th(imgpath,i,index);
    A=get_vol(imgpath,ks,ke,thresh);
    Ae=[ones(ks-index(i,1),1)*A(1);A];
    Amat{i}=Ae;
    
    
    
end


for i=1:4
    figure()
    y=Amat{i};
    py=abs(y-y(1))/y(1);
    plot(py)
    legend
    
end

% for i=1:4
%     figure()
%     y=Amat{i};
%     py=diff(y)./y(1:end-1);
%     plot(py)
%     legend
%     
% end

function RT=get_th(imgpath,i,index)


T=9;
   figure()
          
   for kk=2:3
    
        k=index(i,kk);
        disp(k)
        imname=[num2str(k),'.jpg'];
        imgname=[imgpath,imname];
        I = imread(imgname);
       
        roi=I(:,:,2);
         if kk==2
            Mask=ones(size(roi));
        end
        %hsv=rgb2hsv(roi);
        thresh = multithresh(roi,20);
        b=imquantize(roi,thresh);
        imab=label2rgb(b);
        mask=b<T;
        Mask=mask.*Mask;
         
  
   
          if kk==2
                subplot(221)
                imshow(I)
                 subplot(222)
                 imshow(mask);
          else
                 subplot(223)
                 imshow(mask);
          end
   end
            subplot(224)
             imshow(Mask);
RT{1}=thresh;
RT{2}=T;
RT{3}=Mask;
       
    
        
    
    

end

function A=get_vol(imgpath,ks,ke,thresh)


   A=[];
    for k=ks:500:ke
        disp(k)
        imname=[num2str(k),'.jpg'];
        imgname=[imgpath,imname];
        
        roi = imread(imgname);
        
        [bwimg,area]=getbw(roi ,roi,thresh);
        subplot(221)
        imshow(roi)
        subplot(222)
        imshow(bwimg)
        pause(0.1)
        A=[A;area];
        
    end
    
end


function [b,area]=getbw(img,roi,thresh)
        count=2;
        I=img(:,:,count);
        I=255-I;
        mask=thresh{3};
        I=uint8(mask).*I;
            
            
            newI=imquantize(I,thresh{1});
            

        b=newI>22-thresh{2};
        area=sum(b(:));
%         figure()
%             subplot(221)
%              imshow(roi)
%              subplot(222)
%              imshow();
%              subplot(223)
%              imshow(label2rgb(newI(:,:,2)))
%              subplot(224)
%              imshow(label2rgb(newI(:,:,3)))
 end
