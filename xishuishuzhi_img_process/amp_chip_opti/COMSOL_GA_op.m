clc
clear
close all
%%
modelname='ampchip_matlab_GA';

unit='[mm]';
%% 配置输入参数
model=get_COMSOL_model(modelname);
%mphnavigator% 打开视图 查看下面要设置的参数属性名称 需要放在主函数，否则会随着子函数退出而崩溃
para_cell=mphgetexpressions(model.param);
for i=2:length(para_cell)
    para_name_set{i-1}=para_cell{i,1};
    para_unit_set{i-1}=unit;
end

LB=[ones(1,8)*0.3,ones(1,9)*0.1];
UB=[ones(1,16),0.5];


solver_name='sol1';
bnd_num_set=1:1:10;
%para_value_set=ones(length(para_cell)-1,1)*0.1;
bnd_num_set=bnd_num_set';

[x,fval]=GA_main(LB,UB,para_name_set,para_unit_set,bnd_num_set,model,solver_name);