function [beats] = Note_Function(u)

Fs1 = 44000; %Set Sampling Frequency
Fr = Fs1; %Set Reconstruction Frequency
Fs = Fs1; % The multiple of the sampling frequency to be used
T = 1/Fs; %Sampling Period

N = 0.2*Fs1; % Number of samples to achieve desired duration
L = 1; % default value for L (L=1 => no duration change)
n = @(L) 1:L*N; %the array, n, takes an integer multiplier, L, that can reduce or increase the duration of a note, i.e. 1/2 note, 1/4 note, etc
m = 0; %default input for oct, the octave shift function (using downsampling)

%Generate General Sinusoid
%m is the desired octave, which is transformed into the appropriate multiplier by the oct function
%L is the desired length of the note (in quarter notes)
%fN is the frequncy of the note
note = @(m, L, fN) sin(2*pi*oct(m)*fN*T*n(L)); %standard note at fund. freq.

fA = 440.00; % Master Tuned to A 440
fGS = fA*2^(-1/12);
fG = fGS*2^(-1/12);
fFS = fG*2^(-1/12);
fF = fFS*2^(-1/12);
fE = fF*2^(-1/12);
fDS = fE*2^(-1/12);
fD = fDS*2^(-1/12);
fCS = fD*2^(-1/12);
fC = fCS*2^(-1/12);
fAS = fA*2^(1/12);
fB = fAS*2^(1/12);

namp = 1; % set the amplitude for the natural freq
hamp = 0.8; % set the amplitude for the overtones

%each note passes m and L to the note function above
%two overtones are added to each note
C = @(m, L) namp*note(m, L, fC) + hamp*note(m, L, 0.5*fC) + hamp*note(m, L, 2*fC);
CS = @(m, L) namp*note(m, L, fCS) + hamp*note(m, L, 0.5*fCS) + hamp*note(m, L, 2*fCS);
D = @(m, L) namp*note(m, L, fD) + hamp*note(m, L, 0.5*fD) + hamp*note(m, L, 2*fD);
DS = @(m, L) namp*note(m, L, fDS) + hamp*note(m, L, 0.5*fDS) + hamp*note(m, L, 2*fDS);
E = @(m, L) namp*note(m, L, fE) + hamp*note(m, L, 0.5*fE) + hamp*note(m, L, 2*fE);
F = @(m, L) namp*note(m, L, fF) + hamp*note(m, L, 0.5*fF) + hamp*note(m, L, 2*fF);
FS = @(m, L) namp*note(m, L, fFS) + hamp*note(m, L, 0.5*fFS) + hamp*note(m, L, 2*fFS);
G = @(m, L) namp*note(m, L, fG) + hamp*note(m, L, 0.5*fG) + hamp*note(m, L, 2*fG);
GS = @(m, L) namp*note(m, L, fGS) + hamp*note(m, L, 0.5*fGS) + hamp*note(m, L, 2*fGS);
A = @(m, L) namp*note(m, L, fA) + hamp*note(m, L, 0.5*fA)+ hamp*note(m, L, 2*fA);
AS = @(m, L) namp*note(m, L, fAS) + hamp*note(m, L, 0.5*fAS) + hamp*note(m, L, 2*fAS);
B = @(m, L) namp*note(m, L, fB) + hamp*note(m, L, 0.5*fB) + hamp*note(m, L, 2*fB);

%Define Rests
er = zeros(1, .125*N); % eigth rest
qr = zeros(1, .25*N); % quarter rest
hr = zeros(1, .5*N); % half rest
tr = zeros(1, .75*N); % three-quarter rest
wr = zeros(1, N); % whole rest

[note_position,volume,beats] = det_note_param(u);
num_oct = 2;
num_notes = num_oct*12;

octave = (ceil(note_position/num_notes))-2;
switch ceil(note_position/num_oct)
    case 0 
        note = [C(octave,beats)];
    case 1
        note = [C(octave,beats)];
    case 2
        note = [CS(octave,beats)];
    case 3
        note = [D(octave,beats)];
    case 4
        note = [DS(octave,beats)];
    case 5
        note = [E(octave,beats)];
    case 6
        note = [F(octave,beats)];
    case 7
        note = [FS(octave,beats)];
    case 8
        note = [G(octave,beats)];
    case 9
        note = [GS(octave,beats)];
    case 10
        note = [A(octave,beats)];
    case 11
        note = [AS(octave,beats)];
    case 12
        note = [B(octave,beats)];
end

        
sound(volume*note, Fr); % the multiplier in front of song sets the master volume

%% Test Range
% for i = 1:3
%     for j = 1:12
%         
%         note_position = j;
%             volume = 1;
%             beats =2;
%         num_oct = 3;
%         num_notes = num_oct*12;
%         
%         octave = i-3;
%         switch note_position
%             
%             case 1
%                 note = [C(octave,beats)];
%             case 2
%                 note = [CS(octave,beats)];
%             case 3
%                 note = [D(octave,beats)];
%             case 4
%                 note = [DS(octave,beats)];
%             case 5
%                 note = [E(octave,beats)];
%             case 6
%                 note = [F(octave,beats)];
%             case 7
%                 note = [FS(octave,beats)];
%             case 8
%                 note = [G(octave,beats)];
%             case 9
%                 note = [GS(octave,beats)];
%             case 10
%                 note = [A(octave,beats)];
%             case 11
%                 note = [AS(octave,beats)];
%             case 12
%                 note = [B(octave,beats)];
%         end
%         
%         sound(volume*note, Fr); % the multiplier in front of song sets the master volume
%         pause(.4)
%     end
% end


