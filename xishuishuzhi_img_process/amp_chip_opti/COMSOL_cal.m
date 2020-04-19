function probe_value_set=COMSOL_cal(para_name_set,para_value_set,para_unit_set,bnd_num_set,model,solver_name)
    fprintf('----------start COMSOL----------------\n');
    for i=1:length(para_name_set)
        para_name=para_name_set{i};
        para_value=para_value_set(i);
        para_unit=para_unit_set{i};

        para_str=strcat(num2str(para_value),para_unit);
        model.param.set(para_name, para_str);
    end
    para_SET=mphgetexpressions(model.param)
    fprintf('=== finish parameter setting==\n');

    %% 启动计算 
    
    fprintf('-------%d cal strat--------\n')
    model.sol(solver_name).run;
    fprintf('--------%d cal end-------------- \n')

    %% 得到探针结果
    probe_name_set={};
    probe_unit_set={};
    probe_value_set=[];
    for i=1:length(bnd_num_set)
        bnd_num=bnd_num_set(i);
        bnd_node=strcat('bnd',num2str(bnd_num));
        probe_name_set{i}=model.probe(bnd_node).getString('probename');
        probe_unit_set{i}=model.probe(bnd_node).getString('unit');
    end
    %probe_name_set={'Qcham'};

    for i=1:length(probe_name_set)
        probe_name=probe_name_set{i};

         probe_strc= mpheval(model,probe_name);
         probe_value=mean(probe_strc.d1);

         probe_value_set=[probe_value_set,probe_value];

    end
    fprintf('=== finish probe getting==\n');
    %% 计算结果显示
    for i=1:length(para_name_set)
        para_name=para_name_set{i};
        para_unit=para_unit_set{i};
        fprintf('%s/%s  ',para_name,para_unit);
    end
    fprintf('\n');

    for i=1:length(para_name_set)
        para_value=para_value_set(i);
        fprintf('%d  ',para_value);
    end
    fprintf('\n');


    for i=1:length(probe_name_set)
        probe_name=probe_name_set{i};
        probe_unit=probe_unit_set{i};
        fprintf('%s/%s  ',probe_name,probe_unit);
    end
    fprintf('\n');

    for i=1:length(probe_value_set)
        probe_value=probe_value_set(i);
        fprintf('%d  ',probe_value);
    end
    fprintf('\n');
    fprintf('----------Finsh COMSOL----------------\n');

