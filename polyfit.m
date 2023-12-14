%polynomials fit
%Pmm = to be specified

%set of data points from OCa cells
X=[0,200,400,600,800,1200,1300,1400,1500,1600]
Y=[1.09,1.43,1.54,1.66,1.66,1.89,1.94,1.96,1.96,1.96]


%creation of the polynomial for Oca cells
p = polyfit(X,Y,3);
xp = 1:100:1600;
yp = polyval(p,xp);
plot(X,Y,'--',xp,yp);
plot(x,y2)
title('Oca cells');

%afterwards we can extract the equation from the graph