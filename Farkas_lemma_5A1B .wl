(* ::Package:: *)

(* ::Title:: *)
(*Farkas computations with 5 A's and 1 B's*)


(* ::Input:: *)
(*F1 =a11 b11+a12 b12;(*a1.b1*)*)
(*F2 =a21 b11+a22 b12;(*a2.b1*)*)
(*F3 = a31 b11+a32 b12;(*a3.b1*)*)
(*F4 = a41 b11+a42 b12;(*a4.b1*)*)
(*F5 = a51 b11+a52 b12;(*a5.b1*)*)
(**)
(*F6 = a11 a22-a12 a21; (* det(a1 a2)*)*)
(*F7 = a11 a32-a12 a31;(* det(a1 a3)*)*)
(*F8 =a11 a42-a12 a41;(* det(a1 a4)*)*)
(*F9 =a11 a52-a12 a51;(* det(a1 a5)*)*)
(**)
(*F10 = a21 a32-a22 a31;(* det(a2 a3)*)*)
(*F11 = a21 a42-a22 a41;(* det(a2 a4)*)*)
(*F12 =a21 a52-a22 a51;(* det(a2 a5)*)*)
(**)
(*F13 =a31 a42-a32 a41;(* det(a3 a4)*)*)
(*F14 = a31 a52-a32 a51;(* det(a3 a5)*)*)
(**)
(*F15 = a41 a52-a42 a51;(* det(a4 a5)*)*)
(**)
(*Z1 = (-1)*F2*F3*F4*F5*F10*F11*F12*F13*F14*F15;*)
(*Z2 = F1*F3*F4*F5*F7*F8*F9*F13*F14*F15;*)
(*Z3 = (-1)*F1*F2*F4*F5*F6*F8*F9*F11*F12*F15;*)
(*Z4 =F1*F2*F3*F5*F6*F7*F9*F10*F12*F14 ;*)
(*Z5 = (-1)*F1*F2*F3*F4*F6*F7*F8*F10*F11*F13;*)
(*Z6 = (-1)*F6*F7*F8*F9*F10*F11*F12*F13*F14*F15;*)


(* ::Input:: *)
(*ClearAll[F1,F2,F3,F4,F5,F6, F7,F8,F9,F10,F11,F12,F13,F14,F15]*)
(*Z1 = (-1)*F2*F3*F4*F5*F10*F11*F12*F13*F14*F15;*)
(*Z2 = F1*F3*F4*F5*F7*F8*F9*F13*F14*F15;*)
(*Z3 = (-1)*F1*F2*F4*F5*F6*F8*F9*F11*F12*F15;*)
(*Z4 =F1*F2*F3*F5*F6*F7*F9*F10*F12*F14 ;*)
(*Z5 = (-1)*F1*F2*F3*F4*F6*F7*F8*F10*F11*F13;*)
(*Z6 = (-1)*F6*F7*F8*F9*F10*F11*F12*F13*F14*F15;*)


(* ::Input:: *)
(*pairs=Subsets[{1,2,3,4,5},{2}];*)
(**)
(*(* Outputs a list of length four that shows how many vectors are in each quadrant *)*)
(*setToQuadrants[x_]:=(q1=x[[1]]-1;q2=x[[2]]-2-q1;q3=x[[3]]-3-q1-q2;q4=5-q1-q2-q3;{q1,q2,q3,q4})*)
(**)
(*(* Outputs a vector of length 5 indicating in which quadrant each vector is *)*)
(*quadrantsToVector[x_]:=(l={};For[i=1,i<=4,i++,For[j=1,j<=x[[i]],j++,l=Append[l,i]]];l)*)
(**)
(*(*Sign of the dot product *)*)
(*dotProduct[x_]:=(If[x==1||x==4,1,-1])*)
(**)
(*(* All possibilities for determinants for vectors lying in opposite orthants *)
(*Input will be a list of length 2 where the coordinates give the number of vectors in opposite orthants *)
(*Output a list of lists with all possible signs of determinants *)*)
(*oppositeDet[x_]:=(If[x=={1,1},{{1},{-1}},If[x=={1,2},{{1,1},{1,-1},{-1,-1}},If[x=={2,1},{{1,1},{-1,1},{-1,-1}},If[x=={1,3},{{1,1,1},{1,1,-1},{1,-1,-1},{-1,-1,-1}},If[x=={3,1},{{1,1,1},{-1,1,1},{-1,-1,1},{-1,-1,-1}},If[x=={1,4},{{1,1,1,1},{1,1,1,-1},{1,1,-1,-1},{1,-1,-1,-1},{-1,-1,-1,-1}},If[x=={4,1},{{1,1,1,1},{-1,1,1,1},{-1,-1,1,1},{-1,-1,-1,1},{-1,-1,-1,-1}},If[x=={2,2},{{1,1,1,1},{1,-1,1,1},{1,-1,1,-1},{-1,-1,1,1},{-1,-1,1,-1},{-1,-1,-1,-1}},If[x=={2,3},{{1,1,1,1,1,1},{1,1,-1,1,1,1},{1,-1,-1,1,1,1},{-1,-1,-1,1,1,1},{1,1,-1,1,1,-1},{1,-1,-1,1,1,-1},{1,-1,-1,1,-1,-1},{-1,-1,-1,1,1,-1},{-1,-1,-1,1,-1,-1},{-1,-1,-1,-1,-1,-1}},If[x=={3,2},{{1,1,1,1,1,1},{1,-1,1,1,1,1},{1,-1,1,-1,1,1},{1,-1,1,-1,1,-1},{-1,-1,1,1,1,1},{-1,-1,1,-1,1,1},{-1,-1,-1,-1,1,1},{-1,-1,1,-1,1,-1},{-1,-1,-1,-1,1,-1},{-1,-1,-1,-1,-1,-1}},Nothing]]]]]]]]]])*)
(**)
(*(* Computes possible determinants between a pair of vectors *)*)
(*det[i_,j_,vec_,quadrants_,subset_]:=(If[i<j,If[vec[[i]]==vec[[j]]||vec[[i]]+1==vec[[j]],{1},If[vec[[i]]+3==vec[[j]],{-1},dets=oppositeDet[{quadrants[[vec[[i]]]],quadrants[[vec[[j]]]]}];i2=i+vec[[i]]-1-If[vec[[i]]==1,0,subset[[vec[[i]]-1]]];j2=j+vec[[j]]-1-If[vec[[j]]==1,0,subset[[vec[[j]]-1]]];values = dets[[All,(i2-1)*quadrants[[vec[[j]]]]+j2]];values]],If[j<i,-det[j,i,vec,quadrants,subset],Print["Mistake in the code."]]])*)
(**)
(*realizations={};*)
(**)
(*(* The code uses the fact that the ways of setting 5 elements in 4 quadrants is in bijection with taking 3 element subsets from an 8 element set *)*)
(*Do[Do[quadrants=setToQuadrants[subset];*)
(*vec=quadrantsToVector[quadrants];*)
(*det12=det[perm[[1]],perm[[2]],vec,quadrants,subset];*)
(*det13=det[perm[[1]],perm[[3]],vec,quadrants,subset];*)
(*det14=det[perm[[1]],perm[[4]],vec,quadrants,subset];*)
(*det15=det[perm[[1]],perm[[5]],vec,quadrants,subset];*)
(*det23=det[perm[[2]],perm[[3]],vec,quadrants,subset];*)
(*det24=det[perm[[2]],perm[[4]],vec,quadrants,subset];*)
(*det25=det[perm[[2]],perm[[5]],vec,quadrants,subset];*)
(*det34=det[perm[[3]],perm[[4]],vec,quadrants,subset];*)
(*det35=det[perm[[3]],perm[[5]],vec,quadrants,subset];*)
(*det45=det[perm[[4]],perm[[5]],vec,quadrants,subset];*)
(*size=Max[1,quadrants[[1]]*quadrants[[3]],quadrants[[2]]*quadrants[[4]]];*)
(*For[i=1,i<=size,i++,realizations=Append[realizations,{dotProduct[vec[[perm[[1]]]]],dotProduct[vec[[perm[[2]]]]],dotProduct[vec[[perm[[3]]]]],dotProduct[vec[[perm[[4]]]]],dotProduct[vec[[perm[[5]]]]],det12[[Min[Length[det12],i]]],det13[[Min[Length[det13],i]]],det14[[Min[Length[det14],i]]],det15[[Min[Length[det15],i]]],det23[[Min[Length[det23],i]]],det24[[Min[Length[det24],i]]],det25[[Min[Length[det25],i]]],det34[[Min[Length[det34],i]]],det35[[Min[Length[det35],i]]],det45[[Min[Length[det45],i]]]}]],*)
(*{subset,Subsets[{1,2,3,4,5,6,7,8},{3}]}],{perm,Permutations[{1,2,3,4,5}]}];*)
(**)
(*realizationsUnique = DeleteDuplicates[realizations];*)
(*Length[realizationsUnique]*)


(* ::Input:: *)
(*signPatterns={};*)
(*For[i=1,i<=Length[realizationsUnique],i++,*)
(*F1=realizationsUnique[[i]][[1]];*)
(*F2=realizationsUnique[[i]][[2]];*)
(*F3=realizationsUnique[[i]][[3]];*)
(*F4=realizationsUnique[[i]][[4]];*)
(*F5=realizationsUnique[[i]][[5]];*)
(*F6=-realizationsUnique[[i]][[6]];*)
(*F7=-realizationsUnique[[i]][[7]];*)
(*F8=-realizationsUnique[[i]][[8]];*)
(*F9=-realizationsUnique[[i]][[9]];*)
(*F10=-realizationsUnique[[i]][[10]];*)
(*F11=-realizationsUnique[[i]][[11]];*)
(*F12=-realizationsUnique[[i]][[12]];*)
(*F13=-realizationsUnique[[i]][[13]];*)
(*F14=-realizationsUnique[[i]][[14]];*)
(*F15=-realizationsUnique[[i]][[15]];*)
(*Z1 = (F2*F3*F4*F5)/(F6*F7*F8*F9);*)
(*Z2 = -(F1*F3*F4*F5)/(F6*F10*F11*F12);*)
(*Z3 =(F1*F2*F4*F5)/(F7*F10*F13*F14);*)
(*Z4 = -(F1*F2*F3*F5)/(F8*F11*F13*F15);*)
(*Z5 = (F1*F2*F3*F4)/(F9*F12*F14*F15);signPatterns=Append[signPatterns,{Z1,Z2,Z3,Z4,Z5,1}]; If[Z1==1&&Z2==1&&Z3==1&&Z4==1&&Z5==1,Print[realizationsUnique[[i]]],Nothing]]*)
(*signPatternsUnique=DeleteDuplicates[signPatterns];*)
(*Length[signPatternsUnique]*)
(*signPatternsUnique*)


(* ::Input:: *)
(*det[2,5,{1,2,2,2,4} ,{1,3,0,1} ,{2,6,7} ]*)
(*det[3,5,{1,2,2,2,4} ,{1,3,0,1} ,{2,6,7} ]*)
(*det[5,4,{1,2,2,2,4} ,{1,3,0,1} ,{2,6,7} ]*)
(*SequenceForm[{1, 2, 3, 5, 4}, {2, 6, 7}, {1, 3, 0, 1}, {1, 2, 2, 2, 4}]*)



