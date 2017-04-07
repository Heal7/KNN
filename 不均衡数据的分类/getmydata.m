function [trnx,trny,tesx,tesy] = getmydata()
% 用于读取数据

dpath = '.\数据集\';
d = dir([dpath '*.mat']);    % 读文件名
dc = struct2cell(d)' ;   
filenames = dc(:,1);   % 文件名

% 测试集输入输出
tesx = [];
tesy = [];

filename = filenames{5}; 
a = load([dpath filename]);    
b = fieldnames(a);

dataNow = a.(b{1}); 
labelNow = a.(b{2});
for i = 1:length(labelNow)
    if labelNow(i) <= 4 % 滤出错误数据
        tesx = [tesx; dataNow(i,:)]; % 测试集输入
        tesy = [tesy; labelNow(i)];  % 测试集输出
    end
end 

% 训练集输入输出
trnx = [];
trny = [];
for p = 1:4
    filename = filenames{p}; 
    a = load([dpath filename]);     % 读入数据
    b = fieldnames(a);
    
    dataNow = a.(b{1}); 
    labelNow = a.(b{2}); 
    for i = 1:length(labelNow)
        if labelNow(i) <= 4
            trnx = [trnx; dataNow(i,:)]; % 训练集输入
            trny = [trny; labelNow(i)];  % 训练集输出
        end
    end   
end

end

