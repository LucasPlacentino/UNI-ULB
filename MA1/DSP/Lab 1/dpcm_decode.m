function x_reconstruct = dpcm_decode(difference_quantized)

    N = length(difference_quantized)

    %initialization
    pred = 0;
    x_reconstruct = zeros(N,1);
    
    for i=1:N
      
       %correct and save
       x_reconstruct(i) = difference_quantized(i) + pred;
       
       %predict
       pred = x_reconstruct(i);
    end

end