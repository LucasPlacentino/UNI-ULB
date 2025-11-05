function [out_img_q] = ex7_my_2D_uniform_quantizer(in_img)
    %0-255 greyscale -> 8bits
    %reduce to 4bits -> L=16 levels
    N=4 %bits
    L=2^N
    xmin = 0
    xmax = 255
    %xmin = min(in_img)
    %xmax = max(in_img)
    Q = (xmax-xmin)/L

    levels = xmin+Q/2 : Q : xmax-Q/2

    %quantize each pixel:
    idx = floor((in_img-xmin)/Q)+1;
    %clamping just in case:
    idx(idx < 1) = 1;
    idx(idx > L) = L;

    out_img_q = levels(idx);


end