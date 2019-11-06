function [a, e, i, RA_Omega, AP_omega, nu] = find_coes(R, V)

u = 3.986*10^5;  %Gravitational Parameter measured in (Km^3/s^2)
E = (norm(V)^2/2)-(u/norm(R)); %Finds the specific energy in (KJ)  
a = -u/(2*E); %Gives the length of the semi major axis in (Km) 
e = (1/u)*(((norm(V)^2-(u/norm(R)))*R)-(dot(R,V)*V));
% e calculates the eccentricity vector 
K = [0 0 1]; %Normal vector of fundamental orbit 
h = cross(R,V); %Normal vector of desired orbit 
i = acosd(dot(K,h)/(norm(K)*norm(h)));
% i in (degrees) calculates the inclination of desired orbit 
%with respect to fundamental orbit
n = cross(K,h);
I = [1 0 0];
RA_Omega = acosd(abs(dot(I,n)/(norm(I)*norm(n))));
% RA_Omega in (degree) calculates the RAAN value of the orbit 

%to solve quadrant ambuiguity 
if n(2) >= 0 && (dot(I,n)/(norm(I)*norm(n))) > 0
    RA_Omega = RA_Omega + 0;
elseif n(2) >= 0 && (dot(I,n)/(norm(I)*norm(n))) < 0
    RA_Omega = 180 - RA_Omega;
elseif n(2) < 0 && (dot(I,n)/(norm(I)*norm(n))) < 0
    RA_Omega=RA_Omega+180;
elseif n(2) < 0 && (dot(I,n)/(norm(I)*norm(n))) > 0
    RA_Omega = 360 - RA_Omega;
end

AP_omega = acosd(abs((dot(n,e))/(norm(n)*norm(e)))); 
% AP_omega in (degree) calculates the Argument of periapse  

%To solve quadrant ambuiguity 
if e(3) >= 0 && ((dot(n,e))/(norm(n)*norm(e))) > 0
    AP_omega = AP_omega + 0;
elseif e(3) >= 0 && ((dot(n,e))/(norm(n)*norm(e))) < 0
    AP_omega = 180 - AP_omega;
elseif e(3) < 0 && ((dot(n,e))/(norm(n)*norm(e))) < 0
    AP_omega=AP_omega+180;
elseif e(3) < 0 && ((dot(n,e))/(norm(n)*norm(e))) > 0
    AP_omega = 360 - AP_omega;
end

nu = acosd(abs(dot(e,R)/(norm(e)*norm(R))));
% nu in (degree) calculates true anomaly 

%to solve quadrant ambuiguity 
if dot(R,V) >= 0 && (dot(e,R)/(norm(e)*norm(R))) > 0
    nu = nu + 0;
elseif dot(R,V) >= 0 && (dot(e,R)/(norm(e)*norm(R))) < 0
    nu = 180 - nu;
elseif dot(R,V) < 0 && (dot(e,R)/(norm(e)*norm(R))) < 0
    nu=nu+180;
elseif dot(R,V) < 0 && (dot(e,R)/(norm(e)*norm(R))) > 0
    nu = 360 - nu;
end

end

