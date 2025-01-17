(* ::Package:: *)

(* ::Input:: *)
(*(* Define function to vectorize a symmetric 2x2 matrix *)*)
(*Vec[{{x11_,x12_},{x12_,x22_}}] := {x11,x22,Sqrt[2]x12}*)
(*VecInv[{x11_,x22_,x12_}] := {{x11,x12/Sqrt[2]},{x12/Sqrt[2],x22}}*)
(**)
(*(*Insert factorization *)*)
(**)
(*A1vals = {a11->1,a12->2}*)
(*A2vals = {a21->1,a22->3}*)
(*A3vals = {a31->1,a32->4}*)
(*B1vals = {b11->1,b12->5}*)
(*B2vals = {b21->1,b22->6}*)
(*B3vals = {b31->1,b32->7}*)


(* ::Text:: *)
(*Defining the factors and the motion. *)


(* ::Input:: *)
(*a1= {a11, a12}/.A1vals/.A2vals/.A3vals/.B1vals/.B2vals/.B3vals*)
(*a2= {a21, a22}/.A1vals/.A2vals/.A3vals/.B1vals/.B2vals/.B3vals*)
(*a3= {a31, a32}/.A1vals/.A2vals/.A3vals/.B1vals/.B2vals/.B3vals*)
(*b1= {b11, b12}/.A1vals/.A2vals/.A3vals/.B1vals/.B2vals/.B3vals*)
(*b2= {b21, b22}/.A1vals/.A2vals/.A3vals/.B1vals/.B2vals/.B3vals*)
(*b3= {b31, b32}/.A1vals/.A2vals/.A3vals/.B1vals/.B2vals/.B3vals*)
(**)
(*A1 = KroneckerProduct[a1,Transpose[a1]]*)
(*A2 = KroneckerProduct[a2,Transpose[a2]]*)
(*A3 = KroneckerProduct[a3,Transpose[a3]]*)
(*B1 = KroneckerProduct[b1,Transpose[b1]]*)
(*B2 = KroneckerProduct[b2,Transpose[b2]]*)
(*B3 = KroneckerProduct[b3,Transpose[b3]]*)
(**)
(*Dm={{D11,D12,D13},{D21,D22,D23},{D31,D32,D33}}*)
(**)
(*A1dot = VecInv[Transpose[Vec[A1]] . Dm]*)
(*A2dot = VecInv[Transpose[Vec[A2]] . Dm]*)
(*A3dot = VecInv[Transpose[Vec[A3]] . Dm]*)
(*B1dot = VecInv[-Dm . Vec[B1]]*)
(*B2dot = VecInv[-Dm . Vec[B2]]*)
(*B3dot = VecInv[-Dm . Vec[B3]]*)


(* ::Input:: *)
(*(* Check motion *)*)
(*MA1 = A1+t*A1dot //MatrixForm*)
(*MA2 = A2+t*A2dot //MatrixForm*)
(*MA3 = A3+t*A3dot //MatrixForm*)
(*MB1 = B1+t*B1dot //MatrixForm*)
(*MB2 = B2 +t*B2dot //MatrixForm*)
(*MB3 = B3 +t*B3dot //MatrixForm*)
(**)
(**)
(*DA1=Collect[Det[A1+t*A1dot],t];*)
(*DA2=Collect[Det[A2+t*A2dot],t];*)
(*DA3=Collect[Det[A3+t*A3dot],t];*)
(*DB1=Collect[Det[B1+t*B1dot],t];*)
(*DB2=Collect[Det[B2 +t*B2dot],t];*)
(*DB3=Collect[Det[B3 +t*B3dot],t];*)
(**)
(*(* Define alpha-vectors *)*)
(*alphaA1Vec = Normal[Last@CoefficientArrays[Coefficient[DA1,t,1],{D11,D12,D13,D21,D22,D23,D31,D32,D33}, "Symmetric"->True]];*)
(**)
(*alphaA2Vec = Normal[Last@CoefficientArrays[Coefficient[DA2,t,1],{D11,D12,D13,D21,D22,D23,D31,D32,D33}, "Symmetric"->True]];*)
(**)
(*alphaA3Vec = Normal[Last@CoefficientArrays[Coefficient[DA3,t,1],{D11,D12,D13,D21,D22,D23,D31,D32,D33}, "Symmetric"->True]];*)
(*alphaB1Vec = Normal[Last@CoefficientArrays[Coefficient[DB1,t,1],{D11,D12,D13,D21,D22,D23,D31,D32,D33}, "Symmetric"->True]];*)
(**)
(*alphaB2Vec = Normal[Last@CoefficientArrays[Coefficient[DB2,t,1],{D11,D12,D13,D21,D22,D23,D31,D32,D33}, "Symmetric"->True]];*)
(**)
(*alphaB3Vec = Normal[Last@CoefficientArrays[Coefficient[DB3,t,1],{D11,D12,D13,D21,D22,D23,D31,D32,D33}, "Symmetric"->True]];*)
(**)
(*(* Define the betas *)*)
(*QbetaA1 = Normal[Last@CoefficientArrays[Coefficient[DA1,t,2],{D11,D12,D13,D21,D22,D23,D31,D32,D33}, "Symmetric"->True]];*)
(**)
(*QbetaA2= Normal[Last@CoefficientArrays[Coefficient[DA2,t,2],{D11,D12,D13,D21,D22,D23,D31,D32,D33}, "Symmetric"->True]];*)
(**)
(*QbetaA3 = Normal[Last@CoefficientArrays[Coefficient[DA3,t,2],{D11,D12,D13,D21,D22,D23,D31,D32,D33}, "Symmetric"->True]];*)
(*QbetaB1 = Normal[Last@CoefficientArrays[Coefficient[DB1,t,2],{D11,D12,D13,D21,D22,D23,D31,D32,D33}, "Symmetric"->True]];*)
(**)
(*QbetaB2 = Normal[Last@CoefficientArrays[Coefficient[DB2,t,2],{D11,D12,D13,D21,D22,D23,D31,D32,D33}, "Symmetric"->True]];*)
(**)
(*QbetaB3= Normal[Last@CoefficientArrays[Coefficient[DB3,t,2],{D11,D12,D13,D21,D22,D23,D31,D32,D33}, "Symmetric"->True]];*)
(**)
(*(* Matrix defining the cone *)*)
(*CAlphas ={alphaA1Vec,alphaA2Vec,alphaA3Vec,alphaB1Vec,alphaB2Vec,alphaB3Vec};*)


(* ::Text:: *)
(*To compute the alpha-cone in Polymake:*)


(* ::Input:: *)
(*modCAlphas =CAlphas . {{1,0,0,0,0,0,0,0,0},{0,1,0,0,0,0,0,0,0},{0,0,1/Sqrt[2],0,0,0,0,0,0},{0,0,0,1,0,0,0,0,0},{0,0,0,0,1,0,0,0,0},{0,0,0,0,0,1/Sqrt[2],0,0,0},{0,0,0,0,0,0,1/Sqrt[2],0,0},{0,0,0,0,0,0,0,1/Sqrt[2],0},{0,0,0,0,0,0,0,0,1}}*)


(* ::Text:: *)
(*Formatting for Polymake. Copy red output as Plain Text and paste into Polymake.*)


(* ::Input:: *)
(*"$p = new Cone(INEQUALITIES =>"<>StringReplace[ToString[modCAlphas,InputForm],{"{"->"[" ,"}"->"]"," "->""}]<>");"*)


(* ::Text:: *)
(*Polymake Commands for Copying.*)
(**)
(*print $p->DIM;*)
(**)
(*print $p->RAYS;*)
(**)
(*print $p->LINEALITY_SPACE;*)
(**)
(*print_constraints($p);*)


(* ::Text:: *)
(*Paste Rays and Lineality Space from Polymake as string*)


(* ::Input:: *)
(*PolymakeRays = "-1 0 0 0 0 -7/13 0 -2/13 0*)
(*1 0 0 0 0 7/27 0 4/27 0*)
(*-1 0 0 -7/50 0 -41/50 0 -4/25 0*)
(*-1 0 0 0 0 -1/6 0 4/3 0";*)
(**)
(*PolymakeLineality = "-1 0 0 0 1 0 0 0 0*)
(*0 0 0 0 0 1 1 0 0*)
(*0 0 1 0 0 0 0 1 0*)
(*1 0 0 0 1 0 0 0 1";*)
(**)
(*(* To move from Polymake back to Mathematica,we need to scale the rays and the basis vectors of the lineality space accordingly. *)*)
(*Rays = ToExpression["{{"<>StringReplace[PolymakeRays, {" "-> ", ","\n"->"},{"}]<>"}}"]*)
(*Rays = Rays . {{1,0,0,0,0,0,0,0,0},{0,1,0,0,0,0,0,0,0},{0,0,1/Sqrt[2],0,0,0,0,0,0},{0,0,0,1,0,0,0,0,0},{0,0,0,0,1,0,0,0,0},{0,0,0,0,0,1/Sqrt[2],0,0,0},{0,0,0,0,0,0,1/Sqrt[2],0,0},{0,0,0,0,0,0,0,1/Sqrt[2],0},{0,0,0,0,0,0,0,0,1}};*)
(**)
(*LinealitySpace = ToExpression["{{"<>StringReplace[PolymakeLineality, {" "-> ", ","\n"->"},{"}]<>"}}"]*)
(*LinealitySpace = LinealitySpace . {{1,0,0,0,0,0,0,0,0},{0,1,0,0,0,0,0,0,0},{0,0,1/Sqrt[2],0,0,0,0,0,0},{0,0,0,1,0,0,0,0,0},{0,0,0,0,1,0,0,0,0},{0,0,0,0,0,1/Sqrt[2],0,0,0},{0,0,0,0,0,0,1/Sqrt[2],0,0},{0,0,0,0,0,0,0,1/Sqrt[2],0},{0,0,0,0,0,0,0,0,1}};*)


(* ::Input:: *)
(*(*Test out random motion from the cone. Comment out the unused rays in the sum *)*)
(*Motion = RandomReal[]*Rays[[1,All]]+RandomReal[]*Rays[[2,All]]+RandomReal[]*Rays[[3,All]]+RandomReal[]*Rays[[4,All]]+RandomReal[]*LinealitySpace[[1, All]]+RandomReal[]*LinealitySpace[[2, All]]+RandomReal[]*LinealitySpace[[3, All]]+ RandomReal[]*LinealitySpace[[4, All]];*)
(**)
(*CAlphas . Motion*)
