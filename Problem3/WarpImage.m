function image1warp = WarpImage( img1,A )
image1warp=zeros(1400,1900,3);
AT=inv(A);
[imx,imy,imz]=size(img1);
x0=100;
y0=400;
for i=-99:1000
    for j=-399:1300
        points2=[i;j;1];
        points=AT*points2;
        points=points/points(3);
        left=points(2)-floor(points(2));
        right=1-left;
        up=points(1)-floor(points(1));
        down=1-up;
       if points(1)>1 && points(1)<imx && points(2)>1 && points(2)<imy
            image1warp(x0+i,y0+j,1:3)=left*up*double(img1(floor(points(1)),floor(points(2)),1:3))...
               +left*down*double(img1(ceil(points(1)),floor(points(2)),1:3))+...
               right*up*double(img1(floor(points(1)),ceil(points(2)),1:3))+...
               right*down*double(img1(ceil(points(1)),ceil(points(2)),1:3));
           
       end
    end
end
image1warp=uint8(image1warp);


end

