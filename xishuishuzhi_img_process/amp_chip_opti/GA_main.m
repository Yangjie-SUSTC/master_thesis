function [x,fval]=GA_main(LB,UB,para_name_set,para_unit_set,bnd_num_set,model,solver_name)

%LB = [-1,3];  %����������
%UB = [2];   %���������� 
%ObjectiveFunction = @GA_obj;
nvars = length(LB);  %��������
ObjectiveFunction=@(para_value_set)GA_obj(para_value_set,para_name_set,para_unit_set,bnd_num_set,model,solver_name); % ���ݶ������

[x,fval] = ga(ObjectiveFunction,nvars,[],[],[],[],LB,UB,[],[]);  %����ga����
end


