function model=get_COMSOL_model(modelname)
%% 加载模型，若有 solidworks livelink,需要打开solidworks,并打开对应几何文件 20200119
%% auther yangjie@sustech
import com.comsol.model.*
import com.comsol.model.util.*
model=mphopen(modelname);
fprintf('model loaded\n');
ModelUtil.showProgress(true);