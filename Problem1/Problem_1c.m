v=[1 1 1 -1 1 -1 -1 -1;1 1 -1 1 -1 1 -1 -1;1 -1 1 1 -1 -1 1 -1;1 1 1 1 1 1 1 1];
v_trans=Trans*v;
x=v_trans(1,1:8);
y=v_trans(2,1:8);
z=v_trans(3,1:8);
scatter3(x,y,z);