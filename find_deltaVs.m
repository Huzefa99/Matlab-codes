function [deltaV1, deltaVc, deltaVT] = find_deltaVs(r1,r2,i)
%function to find change in velocities during Orbital transfer 
%Input argumrnts 
%r1: radius of circular orbit where s/c is 
%initially located. r2:radius of final circular orbit
%i is the inclination of starting orbit
%Output arguments 
%deltaV1 = Velocity change during first manuveur 
%deltaVc = Combined Change in velocity during second manuever
%deltaVT = Total change in velocity 

u = 3.986*10^5;  %Gravitational Parameter measured in (Km^3/s^2)
Vi1 = sqrt(u/r1); %Velocity in initial circular orbit
Vf2 = sqrt(u/r2); %Velocity in final circular orbit 
Vi2 = sqrt(2*u*((1/r1)-(1/(r1+r2))));
deltaV1 = Vi2-Vi1;
%Calculates change in velocity during 1st mauever
Vf1 = sqrt(2*u*((1/r2)-(1/(r1+r2))));
deltaVc = sqrt((abs(Vf1)^2 + abs(Vf2)^2)-(2*abs(Vf1)*abs(Vf2)*cos(i)));
%Calculates the combined change in velocity during second manuever
deltaVT = deltaVc+deltaV1;
%Calculates the total change in velocity during orbital transfer 

end

