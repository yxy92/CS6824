%odes.m


function dydt=odes(t,y);
global p;

dydt=zeros(301,1);

%%Complex1 (ClpXP:CpdR)
dydt(1)=p.k1_pos*p.clpxp*y(101)-p.k1_neg*y(1);
for v1=2:99
  dydt(v1)=p.k1_pos*p.clpxp*y(v1+100)-p.k1_neg*y(v1);
end
dydt(100)=p.k1_pos*p.clpxp*y(200)-p.k1_neg*y(100);

%%CpdR_f 
for v2=101:200
  dydt(v2)=p.ks_cpdr*p.cckap/(p.cckap+p.J1)-p.kd*y(v2-100)*y(v2)/(y(v2-100)+p.J2)...
      +p.k2_pos*y(v2+200)-p.k2_neg*p.cckap*y(v2)/(p.cckap+p.J3)+p.kcpdr_b_f*y(v2+100)-p.kcpdr_f_b*y(v2);
end

%%CpdR_b
for v3=201:300
  dydt(v3)=-p.kd*y(v3-200)*y(v3)/(y(v3-200)+p.J2)+p.kcpdr_f_b*y(v3-100)-p.kcpdr_b_f*y(v3)...
      +p.k2_pos*y(v3+200)-p.k2_neg*p.cckap*y(v3)/(p.cckap+p.J3)+p.k1_neg*y(v3-200)-p.k1_pos*y(v3)*p.clpxp;
end


%%CpdR~P_f




%%CpdR~P_b


%%%%%%%%%%%%%%%%%%%%%%
dydt(301)=p.growth*y(301);