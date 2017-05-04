im1=imread('humanity03.JPG');
img1warp=WarpImage(im1,MapMtr);
im2=imread('humanity04.JPG');
[lengthx,lengthy,d]=size(im2);
im2_enlarge=zeros(lengthx+300,lengthy+600);
im2_enlarge(101:1060,401:1680,1:3)=im2;
for i=1:lengthx+300
    for j=1:lengthy+600
        mosaic_im(i,j,1:3)=double(img1warp(i,j,1:3))+double(im2_enlarge(i,j,1:3));
        if i>100 && i< 100+lengthx && j>400 && j<100+lengthy && img1warp(i,j,1)>1
            mosaic_im(i,j,1:3)=mosaic_im(i,j,1:3)/2;
        end
    end
end
mosaic_im=uint8(mosaic_im);
imshow(mosaic_im);