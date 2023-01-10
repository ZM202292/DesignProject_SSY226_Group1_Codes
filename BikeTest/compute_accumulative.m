function acc = compute_accumulative(x,y)
acc = sqrt(x.^2 + y.^2);
dir = [];
for i = 1:length(acc)
    ang = atan(y(i)/x(i));
    if ang >= 0
        dir(i) = 1;
    else
        dir(i) = -1;
    end   
end
acc = acc.*dir';
end