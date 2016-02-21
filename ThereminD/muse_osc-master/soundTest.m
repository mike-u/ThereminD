
for n = 1:length(eegBuffer)  
beat(n) = eegBuffer(n,1) + 8*sin(n/50)*mod(n,20)*heaviside(mod(n,30)-10)*(heaviside(mod(n,30)-15)-.5)*2;
note(n) = eegBuffer(n,2) + 8*sin(n/50)*mod(n,20)*heaviside(mod(n,30)-10)+3*mod(n,30)*(heaviside(mod(n,20)-15)-.5)*2;
vol(n) = eegBuffer(n,3)*eegBuffer(n,4) + 4*sin(n/50)*mod(n,25);
end
