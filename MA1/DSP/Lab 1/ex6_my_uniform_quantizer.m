function [quantized_signal] = ex6_my_uniform_quantizer(x, N)
    % inputs:
    %   x: signal
    %   N: number of bits
    % output:
    %   quantized_signal

    %num of intervals:
    L = 2^N
    %interval length:
    Q = (max(x)-min(x))/L
    
    %mapping middle of each interval
    levels = min(x)+Q/2 : Q : max(x)-Q/2

    %for each sample x(n), find the index i of the interval to which the 
    % sample belongs and set its quantized value using the mapping defined 
    % just above
    %find index:
    idx = floor(x-min(x)/Q)+1
    %--needs clamping ? worked without so idk
    idx(idx < 1) = 1;
    idx(idx > L) = L;
    %map:
    quantized_signal = levels(idx);

end