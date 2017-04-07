function knnV = clusterbal(trnxn,trny,tesxn,howmany,id)
% clusterbal

% ѡ�����1�����������
trnxis = trnxn(trny == 1,:);
trnyis = trny(trny == 1);
% ѡ�������1�����������
trnxnot = trnxn(trny ~= 1,:);
trnynot = trny(trny ~= 1);

% ������ѵ�����������������������
for i = 1:howmany
    % ������ѵ���������
    trndata = [trnxis(id==i,:); trnxnot];
    trnlabel = [trnyis(id==i,:); trnynot];
    % ������������
    knnR(:,i) = knnclassify(tesxn,trndata,trnlabel,15); 
end

% ͶƱ��׼ȷ��
knnV = mode(knnR,2);