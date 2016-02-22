function [ note_position, volume, beats ] = det_note_param(u)
%% Define Parameters
a = 1;
b = 1;
c = 1;


%% Read in Data
u1 = u(1);
u2 = u(2);
u3 = u(3);


% u1 = 100;
% u2 = 90;
% u3 = 45;
% u4 = 90;

npt = 700;
npc = 1000;
vpt = 6.5e5;
vpc = 9.5e5;
bpt = 850;
bpc = 1000;


if u1 < npt
    u1 = npt;
elseif u1 > npc
    u1 = npc;
end
if u2 < vpt
    u2 = vpt;
elseif u2 > vpc
    u2 = vpc;
end
if u3 < bpt
    u3 = bpt;
elseif u3 > bpc
    u3 = bpc;
end




%% Determine Note Number
oct = 2;
num_note = 12*oct;


note_param = a*u1;


normal_np = (note_param-npt)/(npc-npt);

note_position = ceil(normal_np*num_note);


%% Determine Volume

vol_param = b*u2;


normal_vp = (vol_param-vpt)/(vpc-vpt);
volume = normal_vp*.5+.05;

%% Determine Beat

beat_param = c*u3;


normal_bp = (beat_param-bpt)/(bpc-bpt);
beats = normal_bp * 5;

if beats < 1
    beats = 1;
end




end

