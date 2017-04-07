function knnV = clusterbal(trnxn,trny,tesxn,howmany,id)
% clusterbal

% 选出类别1数据输入输出
trnxis = trnxn(trny == 1,:);
trnyis = trny(trny == 1);
% 选出非类别1数据输入输出
trnxnot = trnxn(trny ~= 1,:);
trnynot = trny(trny ~= 1);

% 构建子训练输入输出，构建弱分类器
for i = 1:howmany
    % 构建子训练输入输出
    trndata = [trnxis(id==i,:); trnxnot];
    trnlabel = [trnyis(id==i,:); trnynot];
    % 构建弱分类器
    knnR(:,i) = knnclassify(tesxn,trndata,trnlabel,15); 
end

% 投票及准确率
knnV = mode(knnR,2);