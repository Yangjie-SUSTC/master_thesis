close all; clear all; clc
pathname='H:\ʵ������\shuzhi\';
name={'5-50','50-100','100-200','200-300'};
path='D:\biye\ʵ������\��ˮ��֬����\';

for i=1:4
    imgpath=[path,name{i},'\'];
    fname=[pathname,name{i},'.avi'];
    v = VideoReader(fname);
    p=read(v,1);
    imshow(p)
    h = imrect;
    position = getPosition(h);% �϶��������Ȥ����pos���ĸ�ֵ����Ȥ�������Ͻǵ��������������ĳ���
    
    for k=1:Inf
        disp(k)
        p=read(v,k);
        roi = imcrop(p,position);
        imname=[num2str(k),'.jpg'];
        imgname=[imgpath,imname];
        imwrite(roi,imgname);
    end
    
end

% �Ӵ���һ��
%[445,500;181,211;207,228;301,351]
%[224,310]

]
