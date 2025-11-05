function error_quantized = dpcm_encode(Nq, x, use_prediction)

    % Nq: Number of quantization bits
    % x: Input signal
    % use_prediction:    if true: use predictor in the encoder (figure 2a)
    %                    if false: do not use the predictor (figure 2b)
    
    %Initialization
    N = length(x);
    pred = 0;                             %Prediction
    error_quantized = zeros(N,1);         %Encoded residual
    
    %Implement the DPCM block diagram below
    for i=1:N
        
       %Compute signal difference (with or without prediction)
       % WRITE YOUR CODE
       
       %Quantize using a uniform quantizer, save the result in error_quantized
       % WRITE YOUR CODE       
       
       %Update the prediction (if use_prediction is true)
       % WRITE YOUR CODE
       
    end

end