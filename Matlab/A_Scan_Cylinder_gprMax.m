ex=h5read('cylinder_Ascan_2D.out','/rxs/rx1/Ex');
ey=h5read('cylinder_Ascan_2D.out','/rxs/rx1/Ey');
ez=h5read('cylinder_Ascan_2D.out','/rxs/rx1/Ez');
hx=h5read('cylinder_Ascan_2D.out','/rxs/rx1/Hx');
hy=h5read('cylinder_Ascan_2D.out','/rxs/rx1/Hy');
hz=h5read('cylinder_Ascan_2D.out','/rxs/rx1/Hz');
axis=linspace(0,3,637);
t=tiledlayout(2,4);
nexttile
plot(axis,ex)
title('Ex')
xlabel('Time in Nanoseconds')
ylabel('Electric Field Strength Volts per Meter')
nexttile
plot(axis,ey,'k')
title('Ey')
xlabel('Time in Nanoseconds')
ylabel('Electric Field Strength Volts per Meter')
nexttile
plot(axis,ez,'r')
title('Ez')
xlabel('Time in Nanoseconds')
ylabel('Electric Field Strength Volts per Meter')
nexttile
plot(axis,ex,'b',axis,ey,'k',axis,ez,'r')
title('Electric Field Data')
xlabel('Time in Nanoseconds')
ylabel('Electric Field Strength Volts per Meter')
legend('x','y','z','Location','NorthEast')
nexttile
plot(axis,hx)
title('Hx')
xlabel('Time in Nanoseconds')
ylabel('Magentic Field Strength Amps per Meter')
nexttile
plot(axis,hy,'k')
title('Hy')
xlabel('Time in Nanoseconds')
ylabel('Magentic Field Strength Amps per Meter')
nexttile
plot(axis,hz,'r')
title('Hz')
xlabel('Time in Nanoseconds')
ylabel('Magentic Field Strength Amps per Meter')
nexttile
plot(axis,hx,'b',axis,hy,'k',axis,hz,'r')
legend('x','y','z','Location','NorthEast')
title('Magnetic Field Data')
ylabel('Magentic Field Strength Amps per Meter')
xlabel('Time in Nanoseconds')
title(t,'A-Scan of Metal Cylinder from gprMax', ' ', FontSize=24)
