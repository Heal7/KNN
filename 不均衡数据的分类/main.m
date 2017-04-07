clc;clear;close all;warning off

% 读取数据
[trnx,trny,tesx,tesy] = getmydata();
% 预处理归一化
[trnxn,psX,tesxn] = datapreprocess(trnx,tesx);

% kmeans聚类数目
howmany = 5;
% kmeans对第1类聚类
id = kmeans(trnxn(trny == 1,:),howmany,'Replicates',100);
% clusterbal及其准确率
knnV = clusterbal(trnxn,trny,tesxn,howmany,id);
acc = sum(knnV == tesy) / length(tesy);

% 画分类图
figure;plot(1:length(tesy),tesy,'r-o',1:length(knnV),knnV,'g-*')
grid on
legend('测井实际类别','测井预测类别')
xlabel('序号');ylabel('测井类别')
title(['ClusterBal准确率：' num2str(acc*100) '%']);

% 直接用KNN做分类及准确率
knnB = knnclassify(tesxn,trnxn,trny,2);
accB = sum(knnB == tesy) / length(tesy);
% 单独基分类器分类图
figure;plot(1:length(tesy),tesy,'r-o',1:length(knnB),knnB,'g-*')
grid on
xlabel('序号');ylabel('测井类别')
legend('测井实际类别','测井预测类别')
title(['KNN准确率：' num2str(accB*100) '%']);