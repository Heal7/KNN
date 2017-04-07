function [trnx,trny,tesx,tesy] = getmydata()
% ���ڶ�ȡ����

dpath = '.\���ݼ�\';
d = dir([dpath '*.mat']);    % ���ļ���
dc = struct2cell(d)' ;   
filenames = dc(:,1);   % �ļ���

% ���Լ��������
tesx = [];
tesy = [];

filename = filenames{5}; 
a = load([dpath filename]);    
b = fieldnames(a);

dataNow = a.(b{1}); 
labelNow = a.(b{2});
for i = 1:length(labelNow)
    if labelNow(i) <= 4 % �˳���������
        tesx = [tesx; dataNow(i,:)]; % ���Լ�����
        tesy = [tesy; labelNow(i)];  % ���Լ����
    end
end 

% ѵ�����������
trnx = [];
trny = [];
for p = 1:4
    filename = filenames{p}; 
    a = load([dpath filename]);     % ��������
    b = fieldnames(a);
    
    dataNow = a.(b{1}); 
    labelNow = a.(b{2}); 
    for i = 1:length(labelNow)
        if labelNow(i) <= 4
            trnx = [trnx; dataNow(i,:)]; % ѵ��������
            trny = [trny; labelNow(i)];  % ѵ�������
        end
    end   
end

end

