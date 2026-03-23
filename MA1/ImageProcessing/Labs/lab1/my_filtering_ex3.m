% ex 3 module

% this function does a 1D convolution of a signal with a filter
% - all are line vectors

function [out] = my_filtering_ex3(signal, filter) % line vectors

    L = size(signal,2);

    filter_scale = (size(filter,2)-1)/2; %  FILTER IS ODD NB OF ELEMS

    % reverse filter order:
    reversed_filter = flip(filter); % line vector

    padding = zeros(1,filter_scale); % line vector
    padded_signal = [padding signal padding]; % line vector

    for i = 0:L-1
        
        out(i+1) = padded_signal(1+i:size(filter,2)+i)*reversed_filter';

    end

end