# TP 4 ex 2

# ------ EX 2 ) -------
A = eye(4)-100*diag(ones(3,1),1)+diag(ones(3,1),-1)-100*diag(ones(1,1),-3)

function [Q R] = tp4ex2 (A)
  x = A(:,1);
  x(1) = x(1) + sign(x(1))*norm(x);
  v1 = x/norm(x);
  # H = I - 2*v*transpose(v)
  A = (eye(4)-2*v1*transpose(v1))*A;
  #    ^^^^^^^^^^^^^^^^^^^^^^=Q1
  x = A(:,2);
  x(1) = x(1) + sign(x(1))*norm(x);
  v2 = x/norm(x);
  A = (eye(4)-2*v2*transpose(v2))*A;
  
  x = A(:,3);
  x(1) = x(1) + sign(x(1))*norm(x);
  v3 = x/norm(x);
  A = (eye(4)-2*v3*transpose(v3))*A;
  
  x = A(:,4);
  x(1) = x(1) + sign(x(1))*norm(x);
  v4 = x/norm(x);
  A = (eye(4)-2*v4*transpose(v4))*A
  
  # Créer la matrice Q :
  #   Q = Q1*Q2*Q3
  # mais 4x4 3x3 2x2 
  # Qi est en fait identité avec en bas à gauche la matrice avec les infos
  # voir photo Q = ....
  Q = eye(4);
  Q(3:4,3:4)=(eye(2)-2*v3*transpose(v3))*Q(3:4,3:4);
  Q(2:4,2:4)=(eye(3)-2*v2*transpose(v2))*Q(2:4,2:4);
  Q(1:4,1:4)=(eye(4)-2*v1*transpose(v1))*Q(1:4,1:4)
  
endfunction


#R = A;
#n = size(R,1);
#for k = 1:n
#  x = R(k:m,k);
#  vk = x+sign(x(1))*norm(x)*e1;
#  vk = vk/norm(vk);
#  
#  R(k:m,k:n) = R(k:m,k:n)-vk*(2*(transpose(vk)*R(k:m,k:n)));
#endfor
#R


A = eye(4)-100*diag(ones(3,1),1)+diag(ones(3,1),-1)-100*diag(ones(1,1),-3)

x1 = A(:,1);
x1(1) = x1(1) + sign(x1(1))*norm(x1);
v1 = x1/norm(x1);
# H = I - 2*v*transpose(v)
A = (eye(4)-2*v1*transpose(v1))*A;
#    ^^^^^^^^^^^^^^^^^^^^^^=Q1
x2 = A(:,2);
x2(1) = x2(1) + sign(x2(1))*norm(x2);
v2 = x2/norm(x2);
A = (eye(4)-2*v2*transpose(v2))*A;

x3 = A(:,3);
x3(1) = x3(1) + sign(x3(1))*norm(x3);
v3 = x3/norm(x3);
A = (eye(4)-2*v3*transpose(v3))*A;

x4 = A(:,4);
x4(1) = x4(1) + sign(x4(1))*norm(x4);
v4 = x4/norm(x4);
A = (eye(4)-2*v4*transpose(v4))*A
  
# Créer la matrice Q :
#   Q = Q1*Q2*Q3
# mais 4x4 3x3 2x2 
# Qi est en fait identité avec en bas à gauche la matrice avec les infos
# voir photo Q = ....
Q = eye(4);
Q(3:4,3:4)=(eye(2)-2*v3*transpose(v3))*Q(3:4,3:4);
Q(2:4,2:4)=(eye(3)-2*v2*transpose(v2))*Q(2:4,2:4);
Q(1:4,1:4)=(eye(4)-2*v1*transpose(v1))*Q(1:4,1:4)


