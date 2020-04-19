close all; clear all; clc
pathname='H:\实验数据\shuzhi\';
name={'5-50','50-100','100-200','200-300'};
path='D:\biye\实验数据\吸水树脂计算\';

for i=1:4
    imgpath=[path,name{i},'\'];
    fname=[pathname,name{i},'.avi'];
    v = VideoReader(fname);
    p=read(v,1);
    imshow(p)
    h = imrect;
    position = getPosition(h);% 拖动鼠标获得兴趣区域，pos有四个值，兴趣区域左上角的像素坐标和区域的长宽
    
    for k=1:Inf
        disp(k)
        p=read(v,k);
        roi = imcrop(p,position);
        imname=[num2str(k),'.jpg'];
        imgname=[imgpath,imname];
        imwrite(roi,imgname);
    end
    
end

% 接触，一开
%[445,500;181,211;207,228;301,351]
%[224,310]

]
