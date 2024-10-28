(* ::Package:: *)

(* ::Title:: *)
(*Farkas computations 3A3B*)


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
(*F10 = a11 a22-a12 a21; (* det(a1 a2)*)*)
(*F11 =a11 a32-a12 a31; (* det(a1 a3) *)*)
(*F12 = a21 a32- a22 a31; (* det(a2 a3) *)*)
(**)
(*F13 =b11 b22 -b12 b21; (* det(b1 b2) *)*)
(*F14 = b11 b32-b12 b31; (* det(b1 b3) *)*)
(*F15 = b21 b32-b22 b31;  (* det(b2 b3) *)*)
(**)
(**)
(*Z1 =-2*F4*F5*F6*F7*F8*F9* F12*F13*F14*F15;*)
(*Z2 = 2 *F1*F2*F3*F7*F8*F9*F11*F13*F14*F15;*)
(*Z3 = -2*F1*F2*F3*F4*F5*F6*F10*F13*F14*F15;*)
(*Z4= -2 *F2*F3*F5*F6*F8*F9*F10*F11*F12*F15;*)
(*Z5 = 2 *F1*F3*F4*F6*F7*F9*F10*F11*F12*F14;*)
(*Z6= -2*F1*F2*F4*F5*F7*F8*F10*F11*F12*F13;*)


(* ::Input:: *)
(*ClearAll[F1,F2,F3,F4,F5,F6, F7,F8,F9,F10,F11,F12,F13,F14,F15]*)
(*Z1 =-2*F4*F5*F6*F7*F8*F9* F12*F13*F14*F15;*)
(*Z2 = 2 *F1*F2*F3*F7*F8*F9*F11*F13*F14*F15;*)
(*Z3 = -2*F1*F2*F3*F4*F5*F6*F10*F13*F14*F15;*)
(*Z4= -2 *F2*F3*F5*F6*F8*F9*F10*F11*F12*F15;*)
(*Z5 = 2 *F1*F3*F4*F6*F7*F9*F10*F11*F12*F14;*)
(*Z6= -2*F1*F2*F4*F5*F7*F8*F10*F11*F12*F13;*)


(* ::Input:: *)
(*nr =0; (* number of combinations resulting in only positive entries in generator *)*)
(*Do[W1=Z1/.{F1->i, F2->j, F3->k,F4-> l, F5->m,F6-> n, F7->o,F8->p, F9->q,F10-> r,F11-> s,F12->t, F13->u,F14->v, F15->x  };*)
(*W2=Z2/.{F1->i, F2->j, F3->k,F4-> l, F5->m,F6-> n, F7->o,F8->p, F9->q,F10-> r,F11-> s,F12->t, F13->u,F14->v, F15->x  };*)
(*W3=Z3/.{F1->i, F2->j, F3->k,F4-> l, F5->m,F6-> n, F7->o,F8->p, F9->q,F10-> r,F11-> s,F12->t, F13->u,F14->v, F15->x  };*)
(*W4=Z4/.{F1->i, F2->j, F3->k,F4-> l, F5->m,F6-> n, F7->o,F8->p, F9->q,F10-> r,F11-> s,F12->t, F13->u,F14->v, F15->x  };*)
(*W5=Z5/.{F1->i, F2->j, F3->k,F4-> l, F5->m,F6-> n, F7->o,F8->p, F9->q,F10-> r,F11-> s,F12->t, F13->u,F14->v, F15->x  };*)
(*W6=Z6/.{F1->i, F2->j, F3->k,F4-> l, F5->m,F6-> n, F7->o,F8->p, F9->q,F10-> r,F11-> s,F12->t, F13->u,F14->v, F15->x  };*)
(*If[W1/W2==1&&W2/W3==1&&W3/W4==1&&W4/W5==1&&W5/W6==1,nr = nr+1; Print[i,j,k,l,m,n,o,p,q,r,s,t,u,v,x],Nothing],{i,{-1,1}},{j,{-1,1}},{k,{-1,1}},{l,{-1,1}},{m,{-1,1}},{n,{-1,1}},{o,{-1,1}},{p,{-1,1}},{q,{-1,1}},{r,{-1,1}},{s,{-1,1}},{t,{-1,1}},{u,{-1,1}},{v,{-1,1}},{x,{-1,1}}]*)