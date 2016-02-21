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

u1_t = 0;
u1_c = 100;
u2_t = 0;
u2_c = 100;
u3_t = 0;
u3_c = 100;


if u1 < u1_t
    u1 = u1_t;
elseif u1 > u1_c
    u1 = u1_c;
end
if u2 < u2_t
    u2 = u2_t;
elseif u2 > u2_c
    u2 = u2_c;
end
if u3 < u3_t
    u3 = u3_t;
elseif u3 > u3_c
    u3 = u3_c;
end




%% Determine Note Number
oct = 2;
num_note = 12*oct;


note_param = a*u1;

npt = 0;
npc = 100;

normal_np = (note_param-npt)/(npc-npt);

note_position = ceil(normal_np*num_note);


%% Determine Volume

vol_param = b*u2;

vpt = 0;
vpc = 100;

normal_vp = (vol_param-vpt)/(vpc-vpt);
volume = normal_vp*.5;

%% Determine Beat

beat_param = c*u3;

bpt = 0;
bpc = 100;

normal_bp = (beat_param-bpt)/(bpc-bpt);
beats = normal_bp * 5;

if beats < 1
    beats = 1;
end




end

