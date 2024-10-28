(* ::Package:: *)

(* ::Title:: *)
(*Farkas for one orthogonal pair and 2A4B*)


(* ::Input:: *)
(*Z2 = - (F4*F5*F6);*)
(*Z3 =(-1)*F2*F3*F6;*)
(*Z5 = F1*F3*F5;*)
(*Z6 = (-1)*F1*F2*F4;*)
(**)
(*ZZ2 = Z2/Z6;*)
(*ZZ3 = Z3/Z6;*)
(*ZZ5= Z5/Z6;*)


(* ::Input:: *)
(*nr = 0; (* number of combinations resulting in only positive entries in generator *)*)
(*Do[W1=ZZ2/.{F1->i, F2->j, F3->k,F4-> l, F5->m,F6-> n};*)
(*W2=ZZ3/.{F1->i, F2->j, F3->k,F4-> l, F5->m,F6-> n};*)
(*W3=ZZ5/.{F1->i, F2->j, F3->k,F4-> l, F5->m,F6-> n};*)
(*If[W1==1&&W2==1&&W3==1,nr = nr +1;Print[i,j,k,l,m,n], Nothing],{i,{-1,1}},{j,{-1,1}},{k,{-1,1}},{l,{-1,1}},{m,{-1,1}},{n,{-1,1}}]*)
(*nr*)
