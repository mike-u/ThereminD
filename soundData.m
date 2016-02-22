function [beat, note, vol]= soundData(bufferVals,t)

beat = bufferVals(1) + 8*sin(t/50)*mod(t,20)*heaviside(mod(t,30)-10)*(heaviside(mod(t,30)-15)-.5)*2;
note = bufferVals(2) + 8*sin(t/50)*mod(t,20)*heaviside(mod(t,30)-10)+3*mod(t,30)*(heaviside(mod(t,20)-15)-.5)*2;
vol = bufferVals(3)*bufferVals(4) + 4*sin(t/50)*mod(t,25);

end