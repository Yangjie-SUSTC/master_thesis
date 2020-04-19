function [x,fval]=GA_main(LB,UB,para_name_set,para_unit_set,bnd_num_set,model,solver_name)

%LB = [-1,3];  %定义域下限
%UB = [2];   %定义域上限 
%ObjectiveFunction = @GA_obj;
nvars = length(LB);  %变量个数
ObjectiveFunction=@(para_value_set)GA_obj(para_value_set,para_name_set,para_unit_set,bnd_num_set,model,solver_name); % 传递额外参数

[x,fval] = ga(ObjectiveFunction,nvars,[],[],[],[],LB,UB,[],[]);  %调用ga函数
end


