function y = oct(m)

if m >= 0
    y = 2^m;
end
if m < 0
    y = 1/2^(-m);
end