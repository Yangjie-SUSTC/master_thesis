
clear
close all
clc
%%
modelname='ampchip_matlab_GA';


%% 配置输入参数
model=get_COMSOL_model(modelname);
mphnavigator% 打开视图 查看下面要设置的参数属性名称 需要放在主函数，否则会随着子函数退出而崩溃
para_cell=mphgetexpressions(model.param);
for i=2:length(para_cell)
    para_name_set{i-1}=para_cell{i-1,1};
    para_unit_set{i-1}='[mm]';
end

para_value_set=ones(length(para_cell)-1,1)*0.1;

bnd_num_set=1:1:10;
bnd_num_set=bnd_num_set';
solver_name='sol1';
probe_value_set=COMSOL_cal(para_name_set,para_value_set,para_unit_set,bnd_num_set,model,solver_name);






