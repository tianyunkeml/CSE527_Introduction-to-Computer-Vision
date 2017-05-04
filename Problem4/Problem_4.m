I1=imread('humanity03.JPG');
I2=imread('humanity04.JPG');
J1=rgb2gray(I1);
J2=rgb2gray(I2);
J1=double(J1)./255;
J2=double(J2)./255;
[aa2,bb2,cc2,dd2]=SIFT(J2,4,2,ones(size(J2)),0.14,10,2);
[aa1,bb1,cc1,dd1]=SIFT(J1,4,2,ones(size(J1)),0.098,10,2);
[match,score]=vl_ubcmatch(dd1,dd2);
[n,m]=size(match);
min_dif=1000;
min_dif_set;
min_H;
%RANSAC
for iteration=1:50;
  random_4=rand(1,4);
  random_4num=uint8(m*random_4);
  points1=I1(aa1(match(1,1:4),aa1(match(2,1:4))));
  points2=I2(aa2(match(1,1:4),aa1(match(2,1:4))));
  H=ComputeWarpMapping(points1,points2);
  allpoints1=I1(aa1(match(1,1:m),aa1(match(2,1:m))));
  allpoints2=I2(aa2(match(1,1:m),aa1(match(2,1:m))));

  warpedPoints1=H*allpoints1;
  LeastSquare=sqrt(sum((warpedPoints1-allpoints2).^2));
  if LeastSquare<min_dif
      min_dif=LeastSquare;
      min_dif_set=random_4num;
      min_H=H;
  end
end

im1warped=WarpImage(im1,H);

end