lc = .2e-2;     // Nanowire mesh size
s_lc = .5e-2;   // Substrate mesh size


// SUBSTRATE
Point(1) = {0, 0, 0, s_lc};
Point(2) = {0.1, 0, 0, s_lc};
Point(3) = {0.1, 0.1, 0, s_lc};
Point(4) = {0, 0.1, 0, s_lc};

Line(1) = {1, 2};
Line(2) = {2, 3};
Line(3) = {3, 4};
Line(4) = {4, 1};

Curve Loop(1) = {1, 2, 3, 4};

Plane Surface(1) = {1};

substrate_vol[] = Extrude {0, 0, 0.02} { Surface{1}; };

Physical Volume("Substrate_box", 1) = {substrate_vol[1]};


// NANOWIRE
Point(20) = {0.025, 0.045, 0.02, lc};
Point(21) = {.075, 0.045, 0.02, lc};
Point(22) = {.075, .055, 0.02, lc};
Point(23) = {0.025, .055, 0.02, lc};

Line(30) = {20, 21};
Line(31) = {21, 22};
Line(32) = {22, 23};
Line(33) = {23, 20};

Curve Loop(2) = {30, 31, 32, 33};

Plane Surface(2) = {2};

nano_vol[] = Extrude {0, 0, 0.01} { Surface{2}; };

Physical Volume("Nanowire_box", 2) = {nano_vol[1]};
// Physical Surface("Source_Pin", 1) = {54};
// Physical Surface("Drain_Pin", 2) = {46};

Mesh.RecombineAll = 1;
Mesh.RecombinationAlgorithm = 3;
Mesh 3;
RefineMesh;

Mesh.Format = 1;
Save "qubit_v1_mesh.msh";