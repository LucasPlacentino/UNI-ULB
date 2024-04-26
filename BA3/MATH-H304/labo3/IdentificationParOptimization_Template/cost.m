function J = cost(theta)

global u y SystemOrder k integrateur
Num = [];
Den = [];
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
hatY = lsim(sys,u,k)';

epsilon = y - hatY;

J = epsilon*epsilon';

end
