function min_obj = GA_obj(para_value_set,para_name_set,para_unit_set,bnd_num_set,model,solver_name)
writeExcel(para_value_set,1)
probe_value_set=COMSOL_cal(para_name_set,para_value_set,para_unit_set,bnd_num_set,model,solver_name);

min_obj=get_objy(probe_value_set);
writeExcel(min_obj,3)
fprintf('\n ==============obj_value : %d\n\n',min_obj);



end

function min_obj=get_objy(probe_value_set)
probe_value_ul=probe_value_set*1E9;

Qcham=probe_value_ul(1:8);
Qwast=probe_value_ul(9);
Qin=probe_value_ul(10);
stdQ=std(Qcham);
stdQ_ratio=stdQ/Qin*100;
Qwast_ratio=Qwast/Qin*100;
minQ=min(Qcham);
maxQ=max(Qcham);
minQw=Qwast/minQ*100;
max_min=maxQ/minQ;
   
min_obj=stdQ_ratio+Qwast_ratio+minQw+max_min+max_min; % ×ª³Éul
%{ 
%% ·£º¯Êý
if minQw>100
    min_obj=300;
end
%}
data=[probe_value_ul,stdQ,stdQ_ratio,Qwast_ratio,minQw,minQ,maxQ,max_min];
writeExcel(data,2)

end