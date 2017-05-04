inf_xyz=[100000000 0 0;0 100000000 0;0 0 100000000;1 1 1];
XYZ=Trans*inf_xyz;
XYZ(4,:)=[];
A=[1600 0 400;0 1600 300;0 0 1];
new=A*XYZ;
for i=1:3
    new(1,i)=new(1,i)/new(3,i);
    new(2,i)=new(2,i)/new(3,i);
    new(3,i)=new(3,i)/new(3,i);
end
