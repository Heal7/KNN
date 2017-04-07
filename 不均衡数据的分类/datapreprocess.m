function [trnxn,psX,tesxn] = datapreprocess(trnx,tesx)
% 数据归一化

[trnxn,psX] = mapminmax(trnx');
trnxn = trnxn';
tesxn = mapminmax('apply',tesx',psX)';