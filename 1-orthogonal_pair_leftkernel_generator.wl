(* ::Package:: *)

(* ::Input:: *)
(*(* Define function to vectorize a symmetric 2x2 matrix *)*)
(*Vec[{{x11_,x12_},{x12_,x22_}}] := {x11,x22,Sqrt[2]x12}*)
(*VecInv[{x11_,x22_,x12_}] := {{x11,x12/Sqrt[2]},{x12/Sqrt[2],x22}}*)


(* ::Subtitle:: *)
(*Minors for 3A3B*)


(* ::Input:: *)
(*(*Insert factorization *)*)
(**)
(*A1vals = {a11->a11,a12->0}*)
(*A2vals = {a21->a21,a22->a22}*)
(*A3vals = {a31->a31,a32->a32}*)
(*B1vals = {b11->0,b12->b12}*)
(*B2vals = {b21->b21,b22->b22}*)
(*B3vals = {b31->b31,b32->b32}*)


(* ::Input:: *)
(*a1= {a11, a12}/.A1vals/.A2vals/.A3vals/.B1vals/.B2vals/.B3vals;*)
(*a2= {a21, a22}/.A1vals/.A2vals/.A3vals/.B1vals/.B2vals/.B3vals;*)
(*a3= {a31, a32}/.A1vals/.A2vals/.A3vals/.B1vals/.B2vals/.B3vals;*)
(*b1= {b11, b12}/.A1vals/.A2vals/.A3vals/.B1vals/.B2vals/.B3vals;*)
(*b2= {b21, b22}/.A1vals/.A2vals/.A3vals/.B1vals/.B2vals/.B3vals;*)
(*b3= {b31, b32}/.A1vals/.A2vals/.A3vals/.B1vals/.B2vals/.B3vals;*)
(**)
(*A1 = KroneckerProduct[a1,Transpose[a1]];*)
(*A2 = KroneckerProduct[a2,Transpose[a2]];*)
(*A3 = KroneckerProduct[a3,Transpose[a3]];*)
(*B1 = KroneckerProduct[b1,Transpose[b1]];*)
(*B2 = KroneckerProduct[b2,Transpose[b2]];*)
(*B3 = KroneckerProduct[b3,Transpose[b3]];*)
(**)
(*Dm={{D11,D12,D13},{D21,D22,D23},{D31,D32,D33}};*)
(**)
(*A1dot = VecInv[Transpose[Vec[A1]] . Dm];*)
(*A2dot = VecInv[Transpose[Vec[A2]] . Dm];*)
(*A3dot = VecInv[Transpose[Vec[A3]] . Dm];*)
(*B1dot = VecInv[-Dm . Vec[B1]];*)
(*B2dot = VecInv[-Dm . Vec[B2]];*)
(*B3dot = VecInv[-Dm . Vec[B3]];*)
(**)
(*DA1=Collect[Det[A1+t*A1dot],t]/.{D12->0, D13->0,D32->0};*)
(*DA2=Collect[Det[A2+t*A2dot],t]/.{D12->0, D13->0,D32->0};*)
(*DA3=Collect[Det[A3+t*A3dot],t]/.{D12->0, D13->0,D32->0};*)
(*DB1=Collect[Det[B1+t*B1dot],t]/.{D12->0, D13->0,D32->0};*)
(*DB2=Collect[Det[B2 +t*B2dot],t]/.{D12->0, D13->0,D32->0};*)
(*DB3=Collect[Det[B3 +t*B3dot],t]/.{D12->0, D13->0,D32->0};*)
(**)
(*alphaA1Vec = Normal[Last@CoefficientArrays[Coefficient[DA1,t,1],{D11,D12,D13,D21,D22,D23,D31,D32,D33}, "Symmetric"->True]];*)
(**)
(*alphaA2Vec = Normal[Last@CoefficientArrays[Coefficient[DA2,t,1],{D11,D12,D13,D21,D22,D23,D31,D32,D33}, "Symmetric"->True]];*)
(**)
(*alphaA3Vec = Normal[Last@CoefficientArrays[Coefficient[DA3,t,1],{D11,D12,D13,D21,D22,D23,D31,D32,D33}, "Symmetric"->True]];*)
(**)
(*alphaB1Vec = Normal[Last@CoefficientArrays[Coefficient[DB1,t,1],{D11,D12,D13,D21,D22,D23,D31,D32,D33}, "Symmetric"->True]];*)
(**)
(*alphaB2Vec = Normal[Last@CoefficientArrays[Coefficient[DB2,t,1],{D11,D12,D13,D21,D22,D23,D31,D32,D33}, "Symmetric"->True]];*)
(**)
(*alphaB3Vec = Normal[Last@CoefficientArrays[Coefficient[DB3,t,1],{D11,D12,D13,D21,D22,D23,D31,D32,D33}, "Symmetric"->True]];*)
(**)
(*CAlphas ={alphaA2Vec,alphaA3Vec,alphaB2Vec,alphaB3Vec};*)
(*CAlphas = CAlphas[[All, {1,4,5,6,7,9}]]*)


(* ::Input:: *)
(*BasisC =CAlphas[[All,{1,2,5}]];*)
(**)
(*C2 = Det[BasisC[[2;;4, All]]]//Simplify;*)
(*C3 = -Det[BasisC[[{1,3,4}, All]]]//Simplify;*)
(*C5 = Det[BasisC[[{1,2,4}, All]]]//Simplify;*)
(*C6 = -Det[BasisC[[1;;3, All]]]//Simplify;*)
(*KernelVector = {C2,C3,C5,C6};*)
(**)
(*(* Check that both are in the kernel *)*)
(*KernelVector . CAlphas //Simplify*)
(*KernelVector . BasisC//Simplify*)


(* ::Input:: *)
(*F1 =a11 b11+a12 b12; (* a1.b1 *)*)
(*F2 = a11 b21+a12 b22; (* a1.b2 *)*)
(*F3 = a11 b31+a12 b32; (* a1.b3 *)*)
(**)
(*F4 = a21 b11+a22 b12; (* a2.b1 *)*)
(*F5 =a21 b21+a22 b22; (* a2.b2 *)*)
(*F6 = a21 b31+a22 b32; (* a2.b3 *)*)
(**)
(*F7 = a31 b11+a32 b12; (* a3.b1 *)*)
(*F8 = a31 b21+a32 b22;  (* a3.b2 *)*)
(*F9 =a31 b31+a32 b32; (* a3.b3 *)*)
(**)
(*F10 =( a11 a22-a12 a21); (* det(a1 a2)*)*)
(*F11 =(a11 a32-a12 a31); (* det(a1 a3) *)*)
(*F12 =(a21 a32 -a22 a31); (* det(a2 a3) *)*)
(**)
(*F13 =(b11 b22 -b12 b21); (* det(b1 b2) *)*)
(*F14 = (b11 b32-b12 b31); (* det(b1 b3) *)*)
(*F15 =( b21 b32-b22 b31);  (* det(b2 b3) *)*)
(**)
(*Z2 = F7*F11*F13*F2*F3*F14*F8*F9*F15 /.{a11->1,a12->0, b11->0, b12->1}//Simplify*)
(*C2 == -Sqrt[2]Z2//Simplify*)
(**)
(*Z3 =(-1)*F4*F10* F13*F2*F3*F14*F5*F6*F15/.{a11->1,a12->0, b11->0, b12->1}//Simplify*)
(*C3 == -Sqrt[2]Z3//Simplify*)
(**)
(*Z5 = F4*F10*F7*F11* F3*F14*F6*F9*F12/.{a11->1,a12->0, b11->0, b12->1}//Simplify*)
(*C5 ==-Sqrt[2] Z5//Simplify*)
(**)
(*Z6 =(-1)*F4*F10*F7*F11*F13*F2 *F5*F8*F12/.{a11->1,a12->0, b11->0, b12->1}//Simplify*)
(*C6 == -Sqrt[2]Z6//Simplify*)


(* ::Text:: *)
(*For the left kernel computations we have*)


(* ::Input:: *)
(*Z2/Z6 ==(b31^2/a22^2)*(F9*F15)/(F5*F12)//Simplify*)
(*Z3/Z6 ==-(b31^2/a32^2 )*(F6*F15)/(F8*F12)//Simplify*)
(*Z5/Z6 ==-( b31^2/b21^2 )*(F6*F9)/( F5*F8)//Simplify*)


(* ::Subtitle:: *)
(*Minors for 4A2B*)


(* ::Input:: *)
(*(*Insert factorization *)*)
(**)
(*A1vals = {a11->a11,a12->0}*)
(*A2vals = {a21->a21,a22->a22}*)
(*A3vals = {a31->a31,a32->a32}*)
(*A4vals = {a41->a41,a42->a42}*)
(*B1vals = {b11->0,b12->b12}*)
(*B2vals = {b21->b21,b22->b22}*)


(* ::Text:: *)
(*Defining the factors and the motion. *)


(* ::Input:: *)
(*a1= {a11, a12}/.A1vals/.A2vals/.A3vals/.A4vals/.B1vals/.B2vals;*)
(*a2= {a21, a22}/.A1vals/.A2vals/.A3vals/.A4vals/.B1vals/.B2vals;*)
(*a3= {a31, a32}/.A1vals/.A2vals/.A3vals/.A4vals/.B1vals/.B2vals;*)
(*a4= {a41, a42}/.A1vals/.A2vals/.A3vals/.A4vals/.B1vals/.B2vals;*)
(*b1= {b11, b12}/.A1vals/.A2vals/.A3vals/.A4vals/.B1vals/.B2vals;*)
(*b2= {b21, b22}/.A1vals/.A2vals/.A3vals/.A4vals/.B1vals/.B2vals;*)
(**)
(*A1 = KroneckerProduct[a1,Transpose[a1]];*)
(*A2 = KroneckerProduct[a2,Transpose[a2]];*)
(*A3 = KroneckerProduct[a3,Transpose[a3]];*)
(*A4 = KroneckerProduct[a4,Transpose[a4]];*)
(*B1 = KroneckerProduct[b1,Transpose[b1]];*)
(*B2 = KroneckerProduct[b2,Transpose[b2]];*)
(**)
(*Dm={{D11,D12,D13},{D21,D22,D23},{D31,D32,D33}};*)
(**)
(*A1dot = VecInv[Transpose[Vec[A1]] . Dm];*)
(*A2dot = VecInv[Transpose[Vec[A2]] . Dm];*)
(*A3dot = VecInv[Transpose[Vec[A3]] . Dm];*)
(*A4dot = VecInv[Transpose[Vec[A4]] . Dm];*)
(*B1dot = VecInv[-Dm . Vec[B1]];*)
(*B2dot = VecInv[-Dm . Vec[B2]];*)
(**)
(*DA1=Collect[Det[A1+t*A1dot],t]/.{D12->0, D13->0,D32->0};*)
(*DA2=Collect[Det[A2+t*A2dot],t]/.{D12->0, D13->0,D32->0};*)
(*DA3=Collect[Det[A3+t*A3dot],t]/.{D12->0, D13->0,D32->0};*)
(*DA4=Collect[Det[A4+t*A4dot],t]/.{D12->0, D13->0,D32->0};*)
(*DB1=Collect[Det[B1+t*B1dot],t]/.{D12->0, D13->0,D32->0};*)
(*DB2=Collect[Det[B2 +t*B2dot],t]/.{D12->0, D13->0,D32->0};*)


(* ::Text:: *)
(*Construction of C-matrix.*)


(* ::Input:: *)
(*alphaA1Vec = Normal[Last@CoefficientArrays[Coefficient[DA1,t,1],{D11,D12,D13,D21,D22,D23,D31,D32,D33}, "Symmetric"->True]];*)
(**)
(*alphaA2Vec = Normal[Last@CoefficientArrays[Coefficient[DA2,t,1],{D11,D12,D13,D21,D22,D23,D31,D32,D33}, "Symmetric"->True]];*)
(**)
(*alphaA3Vec = Normal[Last@CoefficientArrays[Coefficient[DA3,t,1],{D11,D12,D13,D21,D22,D23,D31,D32,D33}, "Symmetric"->True]];*)
(*alphaA4Vec = Normal[Last@CoefficientArrays[Coefficient[DA4,t,1],{D11,D12,D13,D21,D22,D23,D31,D32,D33}, "Symmetric"->True]];*)
(**)
(*alphaB1Vec = Normal[Last@CoefficientArrays[Coefficient[DB1,t,1],{D11,D12,D13,D21,D22,D23,D31,D32,D33}, "Symmetric"->True]];*)
(**)
(*alphaB2Vec = Normal[Last@CoefficientArrays[Coefficient[DB2,t,1],{D11,D12,D13,D21,D22,D23,D31,D32,D33}, "Symmetric"->True]];*)
(**)
(*CAlphas ={alphaA2Vec,alphaA3Vec,alphaA4Vec,alphaB2Vec};*)
(*CAlphas = CAlphas[[All, {1,4,5,6,7,9}]];*)


(* ::Input:: *)
(*BasisC =CAlphas[[All,{1,2,5}]];*)
(**)
(*C2 = Det[BasisC[[2;;4, All]]]//Simplify;*)
(*C3 = -Det[BasisC[[{1,3,4}, All]]]//Simplify;*)
(*C5 = Det[BasisC[[{1,2,4}, All]]]//Simplify;*)
(*C6 = -Det[BasisC[[1;;3, All]]]//Simplify;*)
(*KernelVector = {C2,C3,C5,C6};*)
(**)
(*(* Check that both are in the kernel *)*)
(*KernelVector . CAlphas //Simplify*)
(*KernelVector . BasisC//Simplify*)
(**)


(* ::Input:: *)
(*F1=a11 b11+a12 b12;(*a1.b1*)*)
(*F2=a11 b21+a12 b22;(*a1.b2*)*)
(**)
(*F3=a21 b11+a22 b12;(*a2.b1*)*)
(*F4=a21 b21+a22 b22;(*a2.b2*)*)
(**)
(*F5=a31 b11+a32 b12;(*a3.b1*)*)
(*F6=a31 b21+a32 b22;(*a3.b2*)*)
(**)
(*F7=a41 b11+a42 b12;(*a4.b1*)*)
(*F8=a41 b21+a42 b22;(*a4.b2*)*)
(**)
(**)
(*F9=a11 a22-a12 a21; (*det(a1 a2)*)*)
(*F10=a11 a32-a12 a31;(*det(a1 a3)*)*)
(*F11=a11 a42-a12 a41;(*det(a1 a4)*)*)
(**)
(*F12=a21 a32-a22 a31;(*det(a2 a3)*)*)
(*F13=a21 a42-a22 a41;(*det(a2 a4)*)*)
(**)
(*F14=a31 a42-a32 a41;(*det(a3 a4)*)*)
(**)
(*F15=b11 b22-b12 b21; (*det(b1 b2)*)*)
(**)
(*Z2 =  F5*F10*F11*F7*F2*F15*F6*F8*F14/.{a11->1,a12->0, b11->0, b12->1}//Simplify;*)
(*Z3 = (-1)* F3*F9*F7*F11*F2*F15*F13*F4*F8/.{a11->1,a12->0, b11->0, b12->1}//Simplify;*)
(*Z5 = F3*F9*F5*F10*F2*F15* F12*F4*F6/.{a11->1,a12->0, b11->0, b12->1}//Simplify;*)
(*Z6 =  (-1)* F3*F9*F5*F10*F11*F7*F12*F13*F14/.{a11->1,a12->0, b11->0, b12->1}//Simplify;*)
(**)
(*C2 == -Sqrt[2]Z2//Simplify*)
(*C3 == -Sqrt[2]Z3//Simplify*)
(*C5 == -Sqrt[2]Z5//Simplify*)
(*C6 ==-Sqrt[2] Z6//Simplify*)


(* ::Text:: *)
(*For left kernel computations*)


(* ::Input:: *)
(*Z2 / Z6 ==  (b21^2/ a22^2)(F6*F8)/(F12*F13)//Simplify*)
(*Z3/Z6 == -(b21^2/ a32^2)(F4*F8)/(F12*F14)//Simplify*)
(*Z5/Z6 ==(b21^2/ a42^2) ( F4*F6)/ (F13*F14)//Simplify*)


(* ::Subtitle:: *)
(*Minors for 5A1B*)


(* ::Input:: *)
(*(*Insert factorization *)*)
(**)
(**)
(*A1vals = {a11->a11,a12->0}*)
(*A2vals = {a21->a21,a22->a22}*)
(*A3vals = {a31->a31,a32->a32}*)
(*A4vals = {a41->a41,a42->a42}*)
(*A5vals = {a51->a51,a52->a52}*)
(*B1vals = {b11->0,b12->b12}*)


(* ::Input:: *)
(*a1= {a11, a12}/.A1vals/.A2vals/.A3vals/.A4vals/.A5vals/.B1vals;*)
(*a2= {a21, a22}/.A1vals/.A2vals/.A3vals/.A4vals/.A5vals/.B1vals;*)
(*a3= {a31, a32}/.A1vals/.A2vals/.A3vals/.A4vals/.A5vals/.B1vals;*)
(*a4= {a41, a42}/.A1vals/.A2vals/.A3vals/.A4vals/.A5vals/.B1vals;*)
(*a5= {a51, a52}/.A1vals/.A2vals/.A3vals/.A4vals/.A5vals/.B1vals;*)
(*b1= {b11, b12}/.A1vals/.A2vals/.A3vals/.A4vals/.A5vals/.B1vals;*)
(**)
(**)
(*A2 = KroneckerProduct[a2,Transpose[a2]];*)
(*A3 = KroneckerProduct[a3,Transpose[a3]];*)
(*A4 = KroneckerProduct[a4,Transpose[a4]];*)
(*A5 = KroneckerProduct[a5,Transpose[a5]];*)
(*B1 = KroneckerProduct[b1,Transpose[b1]];*)
(**)
(*Dm={{D11,D12,D13},{D21,D22,D23},{D31,D32,D33}};*)
(**)
(*A1dot = VecInv[Transpose[Vec[A1]] . Dm];*)
(*A2dot = VecInv[Transpose[Vec[A2]] . Dm];*)
(*A3dot = VecInv[Transpose[Vec[A3]] . Dm];*)
(*A4dot = VecInv[Transpose[Vec[A4]] . Dm];*)
(*A5dot = VecInv[Transpose[Vec[A5]] . Dm];*)
(*B1dot = VecInv[-Dm . Vec[B1]];*)
(**)
(*DA1=Collect[Det[A1+t*A1dot],t]/.{D12->0, D13->0,D32->0};*)
(*DA2=Collect[Det[A2+t*A2dot],t]/.{D12->0, D13->0,D32->0};*)
(*DA3=Collect[Det[A3+t*A3dot],t]/.{D12->0, D13->0,D32->0};*)
(*DA4=Collect[Det[A4+t*A4dot],t]/.{D12->0, D13->0,D32->0};*)
(*DA5=Collect[Det[A5+t*A5dot],t]/.{D12->0, D13->0,D32->0};*)
(*DB1=Collect[Det[B1+t*B1dot],t]/.{D12->0, D13->0,D32->0};*)


(* ::Input:: *)
(*alphaA1Vec = Normal[Last@CoefficientArrays[Coefficient[DA1,t,1],{D11,D12,D13,D21,D22,D23,D31,D32,D33}, "Symmetric"->True]];*)
(**)
(*alphaA2Vec = Normal[Last@CoefficientArrays[Coefficient[DA2,t,1],{D11,D12,D13,D21,D22,D23,D31,D32,D33}, "Symmetric"->True]];*)
(**)
(*alphaA3Vec = Normal[Last@CoefficientArrays[Coefficient[DA3,t,1],{D11,D12,D13,D21,D22,D23,D31,D32,D33}, "Symmetric"->True]];*)
(**)
(*alphaA4Vec = Normal[Last@CoefficientArrays[Coefficient[DA4,t,1],{D11,D12,D13,D21,D22,D23,D31,D32,D33}, "Symmetric"->True]];*)
(**)
(*alphaA5Vec = Normal[Last@CoefficientArrays[Coefficient[DA5,t,1],{D11,D12,D13,D21,D22,D23,D31,D32,D33}, "Symmetric"->True]];*)
(**)
(*alphaB1Vec = Normal[Last@CoefficientArrays[Coefficient[DB1,t,1],{D11,D12,D13,D21,D22,D23,D31,D32,D33}, "Symmetric"->True]];*)
(**)
(*CAlphas ={alphaA2Vec,alphaA3Vec,alphaA4Vec,alphaA5Vec};*)
(*CAlphas = CAlphas[[All, {1,4,5,6,7,9}]];*)


(* ::Input:: *)
(*BasisC =CAlphas[[All,{1,2,5}]];*)
(**)
(*C2 = Det[BasisC[[2;;4, All]]]//Simplify;*)
(*C3 = -Det[BasisC[[{1,3,4}, All]]]//Simplify;*)
(*C5 = Det[BasisC[[{1,2,4}, All]]]//Simplify;*)
(*C6 = -Det[BasisC[[1;;3, All]]]//Simplify;*)
(*KernelVector = {C2,C3,C5,C6};*)
(**)
(*(* Check that both are in the kernel *)*)
(*KernelVector . CAlphas //Simplify*)
(*KernelVector . BasisC//Simplify*)
(**)


(* ::Input:: *)
(*F1 = a21 b11+a22 b12;(* a2.b1 *)*)
(*F2 = a31 b11+a32 b12;(* a3.b1 *)*)
(*F3 =  a41 b11+a42 b12;(* a4.b1 *)*)
(*F4 = a51 b11+a52 b12;(* a5.b1 *)*)
(**)
(*F5 = a11 a22-a12 a21;(* det(a1 a2) *)*)
(*F6 = a11 a32-a12 a31;(* det(a1 a3) *)*)
(*F7=a11 a42-a12 a41;(* det(a1 a4) *)*)
(*F8 =a11 a52-a12 a51;(* det(a1 a5) *)*)
(**)
(*F9= a21 a32-a22 a31;(* det(a2 a3) *)*)
(*F10 = a21 a42-a22 a41;(* det(a2 a4) *)*)
(*F11 =a21 a52-a22 a51;(* det(a2 a5) *)*)
(**)
(*F12 =a31 a42-a32 a41;(* det(a3 a4) *)*)
(*F13 = a31 a52-a32 a51;(* det(a3 a5) *)*)
(**)
(*F14 = a41 a52-a42 a51;(* det(a4 a5) *)*)
(**)
(*Z2 = F2*F6*F3*F7*F4*F8*F12*F13*F14/.{a11->1,a12->0, b11->0, b12->1}//Simplify;*)
(*Z3 =-F1*F5* F3*F7* F4*F8*F10*F11*F14/.{a11->1,a12->0, b11->0, b12->1}//Simplify;*)
(*Z5 =F1*F5*F2*F6*F4*F8* F9*F11*F13/.{a11->1,a12->0, b11->0, b12->1}//Simplify;*)
(*Z6 =-F1*F5*F2*F6*F3*F7*F9*F10*F12/.{a11->1,a12->0, b11->0, b12->1}//Simplify;*)
(**)
(*C2 == -Sqrt[2]Z2//Simplify*)
(*C3 == -Sqrt[2]Z3//Simplify*)
(*C5 ==-Sqrt[2] Z5//Simplify*)
(*C6 ==-Sqrt[2] Z6//Simplify*)


(* ::Text:: *)
(*For left kernel computations*)


(* ::Input:: *)
(*Z2/Z6 ==-( a52^2/a22^2)*(F13*F14)/(F9*F10)//Simplify*)
(*Z3 / Z6 == ( a52^2/a32^2)*(F11*F14)/(F9*F12)//Simplify*)
(*Z5/Z6 ==-( a52^2/a42^2)*(F11*F13)/(F10*F12)//Simplify*)


(* ::Subtitle:: *)
(*Minors 2A4B*)


(* ::Input:: *)
(*(*Insert factorization *)*)
(**)
(*A1vals = {a11->1, a12->0}*)
(*A2vals = {a21->a21,a22->a22}*)
(*B1vals = {b11->0, b12->1}*)
(*B2vals = {b21->b21,b22->b22}*)
(*B3vals = {b31->b31,b32->b32}*)
(*B4vals = {b41->b41, b42->b42}*)


(* ::Input:: *)
(*a1= {a11, a12}/.A1vals/.A2vals/.B1vals/.B2vals/.B3vals/.B4vals;*)
(*a2= {a21, a22}/.A1vals/.A2vals/.B1vals/.B2vals/.B3vals/.B4vals;*)
(*b1 = {b11, b12}/.A1vals/.A2vals/.B1vals/.B2vals/.B3vals/.B4vals;*)
(*b2= {b21, b22}/.A1vals/.A2vals/.B1vals/.B2vals/.B3vals/.B4vals;*)
(*b3= {b31, b32}/.A1vals/.A2vals/.B1vals/.B2vals/.B3vals/.B4vals;*)
(*b4= {b41, b42}/.A1vals/.A2vals/.B1vals/.B2vals/.B3vals/.B4vals;*)
(**)
(*A1 = KroneckerProduct[a1,Transpose[a1]];*)
(*A2 = KroneckerProduct[a2,Transpose[a2]];*)
(*B1 = KroneckerProduct[b1,Transpose[b1]];*)
(*B2 = KroneckerProduct[b2,Transpose[b2]];*)
(*B3 = KroneckerProduct[b3,Transpose[b3]];*)
(*B4 = KroneckerProduct[b4,Transpose[b4]];*)
(**)
(*Dm={{D11,D12,D13},{D21,D22,D23},{D31,D32,D33}};*)
(**)
(*A1dot = VecInv[Transpose[Vec[A1]] . Dm];*)
(*A2dot = VecInv[Transpose[Vec[A2]] . Dm];*)
(*B1dot = VecInv[-Dm . Vec[B1]];*)
(*B2dot = VecInv[-Dm . Vec[B2]];*)
(*B3dot = VecInv[-Dm . Vec[B3]];*)
(*B4dot = VecInv[-Dm . Vec[B4]];*)
(**)
(**)
(*DA1=Collect[Det[A1+t*A1dot],t]/.{D12->0, D13->0,D32->0};*)
(*DA2=Collect[Det[A2+t*A2dot],t]/.{D12->0, D13->0,D32->0};*)
(*DB1=Collect[Det[B1 +t*B1dot],t]/.{D12->0, D13->0,D32->0};*)
(*DB2=Collect[Det[B2 +t*B2dot],t]/.{D12->0, D13->0,D32->0};*)
(*DB3=Collect[Det[B3 +t*B3dot],t]/.{D12->0, D13->0,D32->0};*)
(*DB4=Collect[Det[B4 +t*B4dot],t]/.{D12->0, D13->0,D32->0};*)


(* ::Input:: *)
(*alphaA1Vec = Normal[Last@CoefficientArrays[Coefficient[DA1,t,1],{D11,D12,D13,D21,D22,D23,D31,D32,D33}, "Symmetric"->True]];*)
(**)
(*alphaA2Vec = Normal[Last@CoefficientArrays[Coefficient[DA2,t,1],{D11,D12,D13,D21,D22,D23,D31,D32,D33}, "Symmetric"->True]];*)
(*alphaB1Vec = Normal[Last@CoefficientArrays[Coefficient[DB1,t,1],{D11,D12,D13,D21,D22,D23,D31,D32,D33}, "Symmetric"->True]];*)
(*alphaB2Vec = Normal[Last@CoefficientArrays[Coefficient[DB2,t,1],{D11,D12,D13,D21,D22,D23,D31,D32,D33}, "Symmetric"->True]];*)
(**)
(*alphaB3Vec = Normal[Last@CoefficientArrays[Coefficient[DB3,t,1],{D11,D12,D13,D21,D22,D23,D31,D32,D33}, "Symmetric"->True]];*)
(**)
(*alphaB4Vec = Normal[Last@CoefficientArrays[Coefficient[DB4,t,1],{D11,D12,D13,D21,D22,D23,D31,D32,D33}, "Symmetric"->True]];*)
(**)
(*CAlphas ={alphaA2Vec,alphaB2Vec, alphaB3Vec, alphaB4Vec};*)
(*CAlphas = CAlphas[[All, {1,4,5,6,7,9}]];*)


(* ::Input:: *)
(*BasisC =CAlphas[[All,{1,2,5}]];*)
(*C2 = Det[BasisC[[2;;4, All]]]//Simplify;*)
(*C3 = -Det[BasisC[[{1,3,4}, All]]]//Simplify;*)
(*C5 = Det[BasisC[[{1,2,4}, All]]]//Simplify;*)
(*C6 = -Det[BasisC[[1;;3, All]]]//Simplify;*)
(*KernelVector = {C2,C3,C5,C6};*)
(**)
(*(* Check that both are in the kernel *)*)
(*KernelVector . CAlphas //Simplify*)
(*KernelVector . BasisC//Simplify*)


(* ::Input:: *)
(*F1 = a11 b21+a12 b22;(* a1.b2*)*)
(*F2 = a11 b31+a12 b32;(* a1.b3*)*)
(*F3 = a11 b41+a12 b42;(* a1.b4*)*)
(**)
(*F4 = a21 b11+a22 b12;(* a2.b1 *)*)
(*F5 = a21 b21+a22 b22;(* a2.b2 *)*)
(*F6 = a21 b31+a22 b32;(* a2.b3 *)*)
(*F7 = a21 b41+a22 b42;(* a2.b4 *)*)
(**)
(*F8 =  b11 b22-b12 b21;(* det(b1 b2) *)*)
(*F9 =  b11 b32-b12 b31;(* det(b1 b3) *)*)
(*F10 =  b11 b42-b12 b41;(* det(b1 b4) *)*)
(**)
(*F11 = b21 b32-b22 b31;(* det(b2 b3) *)*)
(*F12 = b21 b42-b22 b41;(* det(b2 b4) *)*)
(**)
(*F13 = b31 b42-b32 b41;(* det(b3 b4) *)*)
(**)
(*F14 = a11 a22-a12 a21;(* det (a1 a2)*)*)
(**)
(*Z2 = F1*F2*F3*F8*F9*F10*F11*F12*F13/.{a11->1,a12->0, b11->0, b12->1}//Simplify;*)
(*C2 == -Sqrt[2]Z2//Simplify*)
(**)
(*Z4 = (-1)*F2*F14*F3*F4*F6*F7*F9*F10*F13/.{a11->1,a12->0, b11->0, b12->1}//Simplify;*)
(*C3 == -Sqrt[2]Z4*)
(**)
(*Z5 =F1*F3*F4*F5*F7*F8*F10*F12*F14/.{a11->1,a12->0, b11->0, b12->1}//Simplify;*)
(*C5 == -Sqrt[2]Z5//Simplify*)
(**)
(*Z6 = (-1)*F1*F2*F4*F5*F6*F8*F9*F11*F14/.{a11->1,a12->0, b11->0, b12->1}//Simplify;*)
(*C6 == -Sqrt[2]Z6//Simplify*)


(* ::Text:: *)
(*For left kernel computations*)


(* ::Input:: *)
(*Z2 / Z6 ==  (b41^2/ a22^2)*(F12*F13)/(F5*F6)//Simplify*)
(*Z4/Z6 == (b41^2/ b21^2)*(F7*F13)/(F5*F11)//Simplify*)
(*Z5/Z6 ==-(b41^2/ b31^2) (F7*F12)/ (F6*F11)//Simplify*)


(* ::Subtitle:: *)
(*Minors for 1A5B*)


(* ::Input:: *)
(*(*Insert factorization *)*)
(**)
(*A1vals = {a11->1, a12->0}*)
(*B1vals = {b11->0, b12->1}*)
(*B2vals = {b21->b21,b22->b22}*)
(*B3vals = {b31->b31,b32->b32}*)
(*B4vals = {b41->b41, b42->b42}*)
(*B5vals = {b51-> b51, b52->b52}*)


(* ::Input:: *)
(*a1= {a11, a12}/.A1vals/.B1vals/.B2vals/.B3vals/.B4vals/.B5vals;*)
(*b1 = {b11, b12}/.A1vals/.B1vals/.B2vals/.B3vals/.B4vals/.B5vals;*)
(*b2= {b21, b22}/.A1vals/.B1vals/.B2vals/.B3vals/.B4vals/.B5vals;*)
(*b3= {b31, b32}/.A1vals/.B1vals/.B2vals/.B3vals/.B4vals/.B5vals;*)
(*b4= {b41, b42}/.A1vals/.B1vals/.B2vals/.B3vals/.B4vals/.B5vals;*)
(*b5= {b51, b52}/.A1vals/.B1vals/.B2vals/.B3vals/.B4vals/.B5vals;*)
(**)
(*A1 = KroneckerProduct[a1,Transpose[a1]];*)
(*B1 = KroneckerProduct[b1,Transpose[b1]];*)
(*B2 = KroneckerProduct[b2,Transpose[b2]];*)
(*B3 = KroneckerProduct[b3,Transpose[b3]];*)
(*B4 = KroneckerProduct[b4,Transpose[b4]];*)
(*B5 = KroneckerProduct[b5,Transpose[b5]];*)
(**)
(*Dm={{D11,D12,D13},{D21,D22,D23},{D31,D32,D33}};*)
(**)
(*A1dot = VecInv[Transpose[Vec[A1]] . Dm];*)
(*B1dot = VecInv[-Dm . Vec[B1]];*)
(*B2dot = VecInv[-Dm . Vec[B2]];*)
(*B3dot = VecInv[-Dm . Vec[B3]];*)
(*B4dot = VecInv[-Dm . Vec[B4]];*)
(*B5dot = VecInv[-Dm . Vec[B5]];*)
(**)
(*DA1=Collect[Det[A1+t*A1dot],t]/.{D12->0, D13->0,D32->0};*)
(*DB1=Collect[Det[B1 +t*B1dot],t]/.{D12->0, D13->0,D32->0};*)
(*DB2=Collect[Det[B2 +t*B2dot],t]/.{D12->0, D13->0,D32->0};*)
(*DB3=Collect[Det[B3 +t*B3dot],t]/.{D12->0, D13->0,D32->0};*)
(*DB4=Collect[Det[B4 +t*B4dot],t]/.{D12->0, D13->0,D32->0};*)
(*DB5=Collect[Det[B5 +t*B5dot],t]/.{D12->0, D13->0,D32->0};*)


(* ::Input:: *)
(*alphaA1Vec = Normal[Last@CoefficientArrays[Coefficient[DA1,t,1],{D11,D12,D13,D21,D22,D23,D31,D32,D33}, "Symmetric"->True]];*)
(**)
(*alphaB1Vec = Normal[Last@CoefficientArrays[Coefficient[DB1,t,1],{D11,D12,D13,D21,D22,D23,D31,D32,D33}, "Symmetric"->True]];*)
(*alphaB2Vec = Normal[Last@CoefficientArrays[Coefficient[DB2,t,1],{D11,D12,D13,D21,D22,D23,D31,D32,D33}, "Symmetric"->True]];*)
(**)
(*alphaB3Vec = Normal[Last@CoefficientArrays[Coefficient[DB3,t,1],{D11,D12,D13,D21,D22,D23,D31,D32,D33}, "Symmetric"->True]];*)
(**)
(*alphaB4Vec = Normal[Last@CoefficientArrays[Coefficient[DB4,t,1],{D11,D12,D13,D21,D22,D23,D31,D32,D33}, "Symmetric"->True]];*)
(*alphaB5Vec = Normal[Last@CoefficientArrays[Coefficient[DB5,t,1],{D11,D12,D13,D21,D22,D23,D31,D32,D33}, "Symmetric"->True]];*)
(**)
(*CAlphas ={alphaB2Vec, alphaB3Vec, alphaB4Vec, alphaB5Vec};*)
(*CAlphas = CAlphas[[All, {1,4,5,6,7,9}]];*)


(* ::Input:: *)
(*BasisC =CAlphas[[All,{1,2,5}]];*)
(*C2 = Det[BasisC[[2;;4, All]]]//Simplify;*)
(*C3 = -Det[BasisC[[{1,3,4}, All]]]//Simplify;*)
(*C5 = Det[BasisC[[{1,2,4}, All]]]//Simplify;*)
(*C6 = -Det[BasisC[[1;;3, All]]]//Simplify;*)
(*KernelVector = {C2,C3,C5,C6};*)
(**)
(*(* Check that both are in the kernel *)*)
(*KernelVector . CAlphas //Simplify*)
(*KernelVector . BasisC//Simplify*)


(* ::Input:: *)
(*F1 = a11 b21+a12 b22;(* a1.b2*)*)
(*F2 = a11 b31+a12 b32;(* a1.b3*)*)
(*F3 = a11 b41+a12 b42;(* a1.b4*)*)
(*F4 = a11 b51+a12 b52;(* a1.b5 *)*)
(**)
(*F5 =  b11 b22-b12 b21;(* det(b1 b2) *)*)
(*F6 =  b11 b32-b12 b31;(* det(b1 b3) *)*)
(*F7 =  b11 b42-b12 b41;(* det(b1 b4) *)*)
(*F8 =  b11 b52-b12 b51;(* det(b1 b5) *)*)
(**)
(**)
(*F9 = b21 b32-b22 b31;(* det(b2 b3) *)*)
(*F10 = b21 b42-b22 b41;(* det(b2 b4) *)*)
(*F11 = b21 b52-b22 b51;(* det(b2 b5) *)*)
(**)
(*F12 = b31 b42-b32 b41;(* det(b3 b4) *)*)
(*F13 = b31 b52-b32 b51;(* det(b3 b5) *)*)
(**)
(*F14 = b41 b52-b42 b51;(* det (b4 b5)*)*)
(**)
(*Z3 = F2*F3*F4*F6*F7*F8*F12*F13*F14/.{a11->1,a12->0, b11->0, b12->1}//Simplify;*)
(*C2 == -Sqrt[2]Z3//Simplify*)
(**)
(*Z4 = (-1)*F1*F3*F4*F5*F7*F8*F10*F11*F14/.{a11->1,a12->0, b11->0, b12->1}//Simplify;*)
(*C3 == -Sqrt[2]Z4//Simplify*)
(**)
(*Z5 =F1*F2*F4*F5*F6*F8*F9*F11*F13/.{a11->1,a12->0, b11->0, b12->1}//Simplify;*)
(*C5 == -Sqrt[2]Z5//Simplify*)
(**)
(*Z6 = (-1)*F1*F2*F3*F5*F6*F7*F9*F10*F12/.{a11->1,a12->0, b11->0, b12->1}//Simplify;*)
(*C6 == -Sqrt[2]Z6//Simplify*)


(* ::Input:: *)
(*Z3 /Z6 == -(b51^2/b21^2)*(F13*F14)/(F9*F10)//Simplify*)


(* ::Input:: *)
(*Z4/Z6 == (b51^2/b31^2)*(F11*F14)/(F9*F12)*)


(* ::Input:: *)
(*Z5/Z6 == -(b51^2/b41^2)*(F11*F13)/(F10*F12)*)