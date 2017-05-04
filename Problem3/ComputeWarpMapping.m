function A = ComputeWarpMapping( img1pts,img2pts )
Xs=zeros(8,8);
Ys=zeros(8,8);
for i=1:8
    Xs(i,1)=img1pts(1,i);
    Xs(i,2)=img1pts(2,i);
    Xs(i,3)=1;
    Xs(i,7)=-img1pts(1,i)*img2pts(1,i);
    Xs(i,8)=-img1pts(2,i)*img2pts(1,i);
end

for i=1:8
    Ys(i,4)=img1pts(1,i);
    Ys(i,5)=img1pts(2,i);
    Ys(i,6)=1;
    Ys(i,7)=-img1pts(1,i)*img2pts(2,i);
    Ys(i,8)=-img1pts(2,i)*img2pts(2,i);
end

MtrEqua=[Xs;Ys];
righthand=zeros(16,1);
righthand(1:8,1)=img2pts(1,1:8);
righthand(9:16,1)=img2pts(2,1:8);
res=MtrEqua\righthand;
A(1,1:3)=res(1:3);
A(2,1:3)=res(4:6);
A(3,1:2)=res(7:8);
A(3,3)=1;

    

end

