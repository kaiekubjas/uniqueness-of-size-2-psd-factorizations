(* ::Package:: *)

(* ::Title:: *)
(*Farkas computations for one orthogonal pair and 3A3B*)


(* ::Text:: *)
(*There are only six factors whose sign affects the signs of the entries of the left generator, hence it is enough to iterate over them.*)


(* ::Input:: *)
(*F1 = a21 b21+a22 b22; (* a2.b2 *)*)
(*F2 = a21 b31+a22 b32; (* a2.b3*)*)
(**)
(*F3 = a31 b21+a32 b22; (* a3.b2 *)*)
(*F4 = a31 b31+a32 b32; (* a3.b3 *)*)
(**)
(*F5 =b21 b32-b22 b31; (* det(b2 b3) *)*)
(*F6 = a21 a32-a22 a31; (* det (a2 a3)*)*)
(**)


(* ::Input:: *)
(*Z2 =(F4*F5)/(F6*F1);*)
(*Z3 = -(F2*F5)/(F6*F3);*)
(*Z5 = -(F2*F4)/(F1*F3);*)


(* ::Input:: *)
(*ClearAll[F1, F2, F3,F4, F5, F6]*)
(*Z2 =(F4*F5)/(F6*F1);*)
(*Z3 = -(F2*F5)/(F6*F3);*)
(*Z5 = -(F2*F4)/(F1*F3);*)


(* ::Input:: *)
(*nr = 0;(* How many cases where generator has only positive entries *)*)
(*Do[W1=Z2/.{F1->i, F2->j, F3->k,F4-> l, F5->m,F6-> n};*)
(*W2=Z3/.{F1->i, F2->j, F3->k,F4-> l, F5->m,F6-> n};*)
(*W3=Z5/.{F1->i, F2->j, F3->k,F4-> l, F5->m,F6-> n};*)
(*If[W1==1&&W2==1&&W3==1,Print[i,j,k,l,m,n]; nr = nr+1,Nothing],{i,{-1,1}},{j,{-1,1}},{k,{-1,1}},{l,{-1,1}},{m,{-1,1}},{n,{-1,1}}]*)
(*nr*)
