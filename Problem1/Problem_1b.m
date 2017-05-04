k=[3 4 -1];
length_k=sqrt(sum(k.^2));
u=k/length_k;
q=[sin(pi/6)*u cos(pi/6)];
R=Q2M(q);
T=[0 0 1000];
Trans=[R T';0 0 0 1];