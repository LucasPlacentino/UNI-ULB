function [sys]= IdentificationOpti(input,output,S_Order,Ts,integrateur,theta_0)

global u y SystemOrder k theta_0 integrateur;

u = input;
y = output;
SystemOrder = S_Order;
k = 0:Ts:(length(u)-1)*Ts;

Num = [];
Den = [];
theta = fminsearch('cost',theta_0);
for i = 1 : SystemOrder(1)+1
    Num = [Num theta(1,i)];
end
for j = i+1 : SystemOrder(2)+SystemOrder(1)+1
    Den = [Den theta(1,j)];
end
if integrateur
    Den = [Den 1 0];
else 
    Den = [Den 1];
end 

sys = tf(Num,Den);
end 
% 
% function J = cost(theta)
% 
% global u y SystemOrder k
% Num = [];
% Den = [];
% for i = 1 : SystemOrder(1)+1
%     Num = [Num theta(1,i)];
% end
% for j = i+1 : SystemOrder(2)+SystemOrder(1)+1
%     Den = [Den theta(1,j)];
% end
% if integrateur
%     Den = [Den 1 0];
% else 
%     Den = [Den 1];
% end
% 
% sys = tf(Num,Den);
% hatY = lsim(sys,u,k)';
% 
% epsilon = y - hatY;
% 
% J = epsilon*epsilon';
% 
% end


