function deltaD = errormatrixD(t)


deltaD=[2*cos(t)     cos(t)      sin(t)   cos(2*t) sin(t)     2*cos(t) cos(3*t) 
        cos(t)       sin(2*t)    cos(t)   cos(2*t) 3*sin(t)   2*sin(t) cos(t)
        sin(t)       cos(t)      cos(t)   sin(t)   2*cos(t)   cos(3*t) sin(t)
        cos(2*t)     cos(2*t)    sin(t)   sin(t)   2*cos(t)   cos(2*t) 3*cos(t)
        sin(t)       3*sin(t)    2*cos(t) 2*cos(t) 2*cos(t)   sin(3*t) 2*cos(t) 
        2*cos(t)     2*sin(t)    cos(3*t) cos(2*t) sin(3*t)   sin(t) cos(t)
        cos(3*t)     cos(t)      sin(t)   3*cos(t) 2*cos(t)   cos(t) cos(2*t)];

end

