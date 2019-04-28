k = 10;
x= 5;
h=1;
anpha = Pi/12;
y= x*Tan( anpha);

n_ex1= 90 ;prog_nex1=1 ;

n_ey= 40;prog_ney= 1;

n_ay = n_ey;prog_nay=1; 

n_ex2= n_ex1/9; prog_nex2= 1;

//e-/1---le1(n_ex1)---2--le2(n_ex2)---3------------4-------------5
//   |                |               |            |             |
//d-/|                |               |d3          |             |
//   |                |       lcd2 /     \ lcd4    |             |(n_ey)
//   |                |         /          \       |             |
//   |                |      /                  \  |             |
//c-/1---lc1----------2  /           pc3          \4-------------5
//   |                |       /                  \ |             |
//   |                |           /          \     |             |
//   |                |       lbc2 /     \ lbc4    |             |(n_ay)
//b-/|                |               |b3          |             |
//   |                |               |            |             |
//a-/1---la1(n_ex1)---2--la2(n_ex2)---3------------4-------------5


//--POINTS
//--a row---
pa1 = newp; Point(pa1) = {-k*x,-k*y,0};    
pa2 = newp; Point(pa2) = {-x,-k*y,0};
pa3 = newp; Point(pa3) = {0,-k*y,0};
pa4 = newp; Point(pa4) = {x,-k*y,0};
pa5 = newp; Point(pa5) = {k*x,-k*y,0}; 

//-b row---
pb1 = newp; Point(pb1) = {-k*x,-y,0};    
pb2 = newp; Point(pb2) = {0,-y,0};
pb3 = newp; Point(pb3) = {k*x,-y,0};

//c row---
pc1 = newp; Point(pc1) = {-k*x,0,0};    
pc2 = newp; Point(pc2) = {-x,0,0};
pc3 = newp; Point(pc3) = {0,0,0};
pc4 = newp; Point(pc4) = {x,0,0};
pc5= newp; Point(pc5) = {k*x,0,0}; 

//d row--
pd1 = newp; Point(pd1) = {-k*x,y,0};    
pd2 = newp; Point(pd2) = {0,y,0};
pd3 = newp; Point(pd3) = {k*x,y,0}; 

//e row--
pe1 = newp; Point(pe1) = {-k*x,k*y,0};    
pe2 = newp; Point(pe2) = {-x,k*y,0};
pe3 = newp; Point(pe3) = {0,k*y,0};
pe4 = newp; Point(pe4) = {x,k*y,0};
pe5 = newp; Point(pe5) = {k*x,k*y,0}; 

//-Lines
la1= newl;Line(la1)  = {pa1,pa2};
la2 = newl;Line(la2) = {pa2,pa3};
la3 = newl;Line(la3) = {pa3,pa4};
la4= newl;Line(la4)  = {pa4,pa5};

lc1= newl;Line(lc1) = {pc1,pc2};
lc4= newl;Line(lc4) = {pc4,pc5};

le1= newl;Line(le1) = {pe1,pe2};
le2= newl;Line(le2) = {pe2,pe3};
le3= newl;Line(le3) =  {pe3,pe4};
le4= newl;Line(le4) = {pe4,pe5};

lab1= newl;Line(lab1) = {pa1,pb1};
lab3= newl;Line(lab3) = {pa3,pb2};
lab5= newl;Line(lab5) = {pa5,pb3};

lbc2= newl;Line(lbc2) = {pb2,pc2};
lbc4= newl;Line(lbc4) = {pb2,pc4};

lcd2= newl;Line(lcd2) = {pc2,pd2};
lcd4= newl;Line(lcd4) = {pc4,pd2};

lde1= newl;Line(lde1) = {pd1,pe1};
lde3= newl;Line(lde3) = {pd2,pe3};
lde5= newl;Line(lde5) = {pd3,pe5};

lac1= newl;Line(lac1) = {pa1,pc1};
lac5= newl;Line(lac5) = {pa5,pc5};
lac2= newl;Line(lac2) = {pa2,pc2};
lac4= newl;Line(lac4) = {pa4,pc4};

lce4= newl;Line(lce4) = {pc4,pe4};
lce2= newl;Line(lce2) = {pc2,pe2};
lce5= newl;Line(lce5) = {pc5,pe5};
lce1= newl;Line(lce1) = {pc1,pe1};


//-TRANSFINITE LINES
Transfinite Line{la2,la3,le2,le3,lcd2,lcd4,lbc2,lbc4} = n_ex2 Using Progression prog_nex2;
Transfinite Line{lce1,lce5,lde3,lce2,lce4} = n_ey Using Progression prog_ney;
Transfinite Line{lac1,lac5,lab3,lac2,lac4} =n_ay  Using Progression prog_nay;
Transfinite Line{la1,la4,le1,le4,lc1,lc4} = n_ex1 Using Progression prog_nex1;

//-MAKE SURFACES
lilo1 = newll; Line Loop(lilo1) = {lac1,lc1,-lac2,-la1};
sur1 = news; Plane Surface(sur1) = {lilo1};
Transfinite Surface{sur1};
Recombine Surface{sur1};

lilo2 = newll; Line Loop(lilo2) = {la4,lac5,-lc4,-lac4};
sur2 = news; Plane Surface(sur2) = {lilo2};
Transfinite Surface{sur2};
Recombine Surface{sur2};


lilo3 = newll; Line Loop(lilo3) = {lc4,lce5,-le4,-lce4};
sur3 = news; Plane Surface(sur3) = {lilo3};
Transfinite Surface{sur3} ;
Recombine Surface{sur3};

lilo4 = newll; Line Loop(lilo4) = {lc1,lce2,-le1,-lce1};
sur4 = news; Plane Surface(sur4) = {lilo4};
Transfinite Surface{sur4} ;
Recombine Surface{sur4};


lilo5 = newll; Line Loop(lilo5) = {la2,lab3,lbc2,-lac2};
sur5 = news; Plane Surface(sur5) = {lilo5};
Transfinite Surface{sur5} ;
Recombine Surface{sur5};

lilo6 = newll; Line Loop(lilo6) = {la3,lac4,-lbc4,-lab3};
sur6 = news; Plane Surface(sur6) = {lilo6};
Transfinite Surface{sur6} ;
Recombine Surface{sur6};

lilo7 = newll; Line Loop(lilo7) = {lcd4,lde3,le3,-lce4};
sur7 = news; Plane Surface(sur7) = {lilo7};
Transfinite Surface{sur7} ;
Recombine Surface{sur7};

lilo8 = newll; Line Loop(lilo8) = {lcd2,lde3,-le2,-lce2};
sur8 = news; Plane Surface(sur8) = {lilo8};
Transfinite Surface{sur8} ;
Recombine Surface{sur8};
Extrude{0, 0, h}{
Surface {sur1,sur2,sur3,sur4,sur5,sur6,sur7,sur8};
Layers{1};
Recombine;
}
// PHYSICAL BOUNDARY 
/*Physical Line ("inlet") ={lac1,lce1};
Physical Line ("outlet")={lac5,lce5};
Physical Line ("wall")={la1,la2,la3,la4,le1,le2,le3,le4,lbc2,lbc4,lcd2,lcd4};
*/

Coherence;
Physical Surface("topAndBottom") = {132, 66, 110, 88, 32, 34, 36, 30, 44, 220, 42, 198, 176, 40, 38, 154};
Physical Surface("inlet") = {131, 53};
Physical Surface("outlet") = {79, 101};
Physical Surface("left") = {127, 215, 193, 105};
Physical Surface("right") = {65, 141, 163, 75};
Physical Surface("obstacle")={149, 185, 207, 171};


Coherence;
Physical Volume(221) = {4, 8, 7, 3, 2, 6, 5, 1};
Coherence;

