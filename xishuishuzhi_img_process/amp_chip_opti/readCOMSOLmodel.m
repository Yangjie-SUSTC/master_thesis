%C:\appinstall\COMSOL54\Multiphysics\mli
%clear
clc
import com.comsol.model.*
import com.comsol.model.util.*
model=mphopen('matlabCOMSOL');
fprintf('model loaded\n');
ModelUtil.showProgress(true); % 显示进度条
% 参数设置 model.param.set('名字', '9[cm]', '备注');
% model.param.set('L', '9[cm]', 'Length of the busbar');
%显示进度条 ModelUtil.showProgress(true);
% mphnavigator

% 更改参数 param model.param.set('L','18[cm]');
% 运行求解器 model.sol('sol1').run;
% 拿到探针值 pd = mpheval(model,'probename').d1;
for i=1:3
    theta_seq=[0.1,0.4,0.5];
    theta=theta_seq(i);

     model.param.set('LL_height', strcat(num2str(theta),'[mm]'));
  
     fprintf('%d epoch strat cal\n',i)
     model.sol('sol1').run;
     fprintf('%d epoch end cal\n',i)
     
     
     Qcham_strc= mpheval(model,'Qcham');
     Qcham_value=mean(Qcham_strc.d1);
     fprintf('theta:%d  Qcham:%d\n',theta,Qcham_value);
     
end