function model=get_COMSOL_model(modelname)
%% ����ģ�ͣ����� solidworks livelink,��Ҫ��solidworks,���򿪶�Ӧ�����ļ� 20200119
%% auther yangjie@sustech
import com.comsol.model.*
import com.comsol.model.util.*
model=mphopen(modelname);
fprintf('model loaded\n');
ModelUtil.showProgress(true);