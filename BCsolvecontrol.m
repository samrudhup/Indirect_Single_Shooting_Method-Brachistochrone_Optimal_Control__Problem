function Hth = BCsolvecontrol(theta, lambda_x, lambda_y, lambda_v, v, g)
Hth=lambda_x*v*cos(theta)-(lambda_y*v +lambda_v*g)*sin(theta);
end 