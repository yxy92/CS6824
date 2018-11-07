function initial_cond = get_init()
%% INITIAL CONDITIONS
y0=zeros(501,1);
y0(501) = 0.013;           % cell size

%%pass parameter
param(0);
%% INTEGRATION PARAMETERS
t0 = 0;
tf = 2000;%150;        
[t,y]=ode15s(@odes,[t0 tf],y0);

initial_cond.init = y(end,:);

%%plot stuff
plot(t,y(:,200))