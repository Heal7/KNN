clc;clear;close all;warning off

% ��ȡ����
[trnx,trny,tesx,tesy] = getmydata();
% Ԥ�����һ��
[trnxn,psX,tesxn] = datapreprocess(trnx,tesx);

% kmeans������Ŀ
howmany = 5;
% kmeans�Ե�1�����
id = kmeans(trnxn(trny == 1,:),howmany,'Replicates',100);
% clusterbal����׼ȷ��
knnV = clusterbal(trnxn,trny,tesxn,howmany,id);
acc = sum(knnV == tesy) / length(tesy);

% ������ͼ
figure;plot(1:length(tesy),tesy,'r-o',1:length(knnV),knnV,'g-*')
grid on
legend('�⾮ʵ�����','�⾮Ԥ�����')
xlabel('���');ylabel('�⾮���')
title(['ClusterBal׼ȷ�ʣ�' num2str(acc*100) '%']);

% ֱ����KNN�����༰׼ȷ��
knnB = knnclassify(tesxn,trnxn,trny,2);
accB = sum(knnB == tesy) / length(tesy);
% ����������������ͼ
figure;plot(1:length(tesy),tesy,'r-o',1:length(knnB),knnB,'g-*')
grid on
xlabel('���');ylabel('�⾮���')
legend('�⾮ʵ�����','�⾮Ԥ�����')
title(['KNN׼ȷ�ʣ�' num2str(accB*100) '%']);