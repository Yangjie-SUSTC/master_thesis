
clear
close all
clc
%%
modelname='ampchip_matlab_GA';


%% �����������
model=get_COMSOL_model(modelname);
mphnavigator% ����ͼ �鿴����Ҫ���õĲ����������� ��Ҫ����������������������Ӻ����˳�������
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






