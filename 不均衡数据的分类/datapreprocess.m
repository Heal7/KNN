function [trnxn,psX,tesxn] = datapreprocess(trnx,tesx)
% ���ݹ�һ��

[trnxn,psX] = mapminmax(trnx');
trnxn = trnxn';
tesxn = mapminmax('apply',tesx',psX)';