close all; 
clear all; 
clc
index=[445,500,4256;181,211,3081;207,228,2029;301,351,1592];
%[224,310]


name={'5-50','50-100','100-200','200-300'};
path='D:\biye\实验数据\吸水树脂计算\';




%get_th(name,path,index)
Amat={};
Tmat=[3,3,3,3];
for i=1:4

 T=Tmat(i);
 %i=1;
 %T=20;
 step=60;
 
    imgpath=[path,name{i},'\'];
    ks=index(i,2);
    ke=index(i,3);
   
    figure()
    Area=[];
    MAseq=[];
    
    for k=ks:step:ke-step
    
        
         imname=[num2str(k),'.jpg'];
        imgname=[imgpath,imname];
        I1 = imread(imgname);
        [bl1,mask1]=hetmask(I1);
        
          imname=[num2str(k+step),'.jpg'];
        imgname=[imgpath,imname];
        I2 = imread(imgname);
        [bl2,mask2]=hetmask(I2);
        MASKa=double(mask1)+ double(mask2);
        MASK=MASKa>0;
        
        dimg=bl2-bl1;
        ext1=abs(dimg)>T;
        ext=ext1.*MASK;
        aear=sum(ext(:))/sum(MASK(:));
        Area=[Area,aear];
        
        subplot(221)
        imshow(I1)
        title('First frame','fontsize',14)
        subplot(222)
        imshow(I2)
        title('Second frame','fontsize',14)
        subplot(223)
        imshow(MASK)
        title('Mask','fontsize',14)
         subplot(224)
        imshow(ext)
        title('Expasion area','fontsize',14)
        pause(0.001)
        MAseq=[MAseq,sum(MASK(:))];
        
    end
    Amat{i}=Area;
    MA{i}=MASK;
    MASEQ{i}=MAseq;
    
        
    
    
    
    
    
end
windowSize = 10; 
b = (1/windowSize)*ones(1,windowSize);
a = 1;
h=figure();
for i=1:4
    x=Amat{i};
    y = filter(b,a,x);
    plot(y,'linewidth',2);
    hold on
   
      
end
xticklabels([10:10:70]*2)
xlabel('Time (s)')
ylabel('expansion rate')
legend(name);
saveas(h,[path,'rate.jpg'])

h=figure();
for i=1:4
    x= MASEQ{i};
    plot(x,'linewidth',2);
    hold on
      
end
xticklabels([10:10:70]*2)
xlabel('Time (s)')
ylabel('Jam area')
legend(name);
saveas(h,[path,'vol.jpg'])



A=[];
for i=1:4
    x=MA{i};
    s=sum(x(:));
    A=[A,s];
       
end


h=figure()
    bar(A);
    hold on
    
xticklabels(name)
xlabel('Size')
ylabel('Final area')
saveas(h,[path,'bar.jpg'])


function bimg=blur(I)
 intImage = integralImage(I);
avgH = integralKernel([1 1 7 7], 1/49);
  bimg= integralFilter(intImage, avgH);
end

function [bl1,mask]=hetmask(I)

      
        Ilay1=I(:,:,2);
        bl1=blur(Ilay1);
        
thresh = multithresh(bl1,2);
 b=imquantize(bl1,thresh);
 mask=b==1;

end