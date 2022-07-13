function P_dot = BSmyODE(t,P,g)
x=P(1);
y=P(2);
v=P(3);
lambda_x=P(4);
lambda_y=P(5);
lambda_v=P(6);
theta_guess=P(7);

options=optimset('Display','Iter','Tolx', 1e-8, 'TolFun', 1e-8);

theta=fsolve(@BCsolvecontrol,theta_guess,options,lambda_x,lambda_y,lambda_v,v,g);

x_dot=v*sin(theta);
y_dot=v*cos(theta);
v_dot=g*cos(theta);
lambda_x_dot=0;
lambda_y_dot=0;
lambda_v_dot=-lambda_x*sin(theta)-lambda_y*cos(theta);
P_dot=[x_dot;y_dot;v_dot;lambda_x_dot;lambda_y_dot;lambda_v_dot;theta];
end