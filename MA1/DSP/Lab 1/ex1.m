% Last Lab will be a mock exam

% Exercise 1 - Lab Session 1 - DSP 2025
clear

a = [5 7 2 3]
b = [4 6 8 9]

first_of_a = a(1)
end_of_a = a(end)
first_of_b = b(1)
end_of_b = b(end)

a_b_dot_prod = dot(a,b)

sum_of_a_elems = sum(a)

a_plus_b = a+b
a_times_5 = a*5
a_elem_mult_b = a.*b

twenty_zeros_row_vect = zeros(1,20)

twenty_ones_column_vect = ones(20,1)

t = linspace(1,5,5) % [1 2 3 4 5]

t = 1:5
t = 1:0.5:5
t = 1:0.3:5
