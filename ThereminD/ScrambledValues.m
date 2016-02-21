x = 1:100;

x1=(randperm(length(x)));
x2=(randperm(length(x)));
x3=(randperm(length(x)));
x4=(randperm(length(x)));

for i = 1:length(x)
    u = [x1(i) x2(i) x3(i)];
    beats = Note_Function(u);
    
    pause(beats*.2)
end

