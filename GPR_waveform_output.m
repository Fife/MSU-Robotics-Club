%%plot E wave and H wave robotics club
%Ex,Ey,Ez
x=h5read('cylinder_Ascan_2D.out','/rxs/rx1/Ex');
y=h5read('cylinder_Ascan_2D.out','/rxs/rx1/Ey');
z=h5read('cylinder_Ascan_2D.out','/rxs/rx1/Ez');
Exyz=[x,y,z];
figure;grid;mesh(Exyz);
%Hx,Hy,Hz
x=h5read('cylinder_Ascan_2D.out','/rxs/rx1/Hx');
y=h5read('cylinder_Ascan_2D.out','/rxs/rx1/Hy');
z=h5read('cylinder_Ascan_2D.out','/rxs/rx1/Hz');
Hxyz=[x,y,z]
figure;grid;mesh(Hxyz);