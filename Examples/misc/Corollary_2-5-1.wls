#!/usr/bin/env wolframscript

argv = Rest @ $ScriptCommandLine;
argc = Length @ argv;
(* Do[Print[argv[[i]]], {i, argc}] *)
(* Only the first argument will be passed *)
A = Get[argv[[1]]]


(* Set up for Bessel J function *)
\[Eta] = (d-2)/2
\[Omega] = -d/2
\[Tau] = \[Alpha]
\[Sigma] = 1
x =  \[Xi]
a = 1
b = 1/( 2^( \[Alpha] - 1 ) \[Nu] t^( \[Beta] ) )


(* Print the FoxH parameters *)
Print["\n"]
Print["Here is the input:"]
(* A={{{{1, 1/\[Alpha]}}, {{Ceil[\[Beta]], \[Beta]}}}, {{{1/2, \[Alpha]/2}, {1, 1}}, {{1, \[Alpha]/2}}}} *)
Print["A= ", A]
Print["Upper = ", A[[1]]]
Print["Lower = ", A[[2]]]
Print["\n"]

(* Now computing the parameters *)
p = Length[A[[1]][[1]]] + Length[A[[1]][[2]]]
q = Length[A[[2]][[1]]] + Length[A[[2]][[2]]]
m = Length[A[[2]][[1]]]
n = Length[A[[1]][[1]]]

Print["m = ", m, ", n = ", n]
Print["p = ", p, ", q = ", q]
Print["\n"]

Print["Upper = ", A[[1]]]
Print["\n"]

Print["Upper Front  = ", A[[1]][[1]]]
sumafront = Total[A[[1]][[1]]][[1]]
Print["sum a front = ", sumafront]
sumalphafront = Total[A[[1]][[1]]][[2]]
Print["sum alpha front = ", sumalphafront]
Print["\n"]

Print["Upper Behind = ", A[[1]][[2]]]
sumabehind = Total[A[[1]][[2]]][[1]]
Print["sum a behind = ", sumabehind]
sumalphabehind = Total[A[[1]][[2]]][[2]]
Print["sum alpha behind = ", sumalphabehind]
Print["\n"]

Print["Lower = ", A[[2]]]
Print["\n"]

Print["Lower Front  = ", A[[2]][[1]]]
sumbfront = Total[A[[2]][[1]]][[1]]
Print["sum b front = ", sumbfront]
sumbetafront = Total[A[[2]][[1]]][[2]]
Print["sum beta front = ", sumbetafront]
Print["\n"]

Print["Lower Behind = ", A[[2]][[2]]]
sumbbehind = Total[A[[2]][[2]]][[1]]
Print["sum b behind = ", sumbbehind]
sumbetabehind = Total[A[[2]][[2]]][[2]]
Print["sum beta behind = ", sumbetabehind]
Print["\n"]

Print["Summary:"]
astar = sumalphafront - sumalphabehind + sumbetafront - sumbetabehind
Print[ToString[SuperStar[a],InputForm], " = ", astar]

Delta = sumbetafront + sumbetabehind - sumalphafront - sumalphabehind
Print[\[CapitalDelta], " = ", Delta]

f[x_] := x^x
delta = (Total[f /@ A[[2]][[1]]] Total[f /@ A[[2]][[2]]] / Total[f /@ A[[1]][[1]]] / Total[f /@ A[[1]][[2]]] )[[2]]
Print[ \[Delta], " = ", delta]

mu = sumbfront + sumbbehind - sumafront - sumabehind + (p-q)/2
Print[ \[Mu], " = ", mu]

a1star = sumbetafront - sumalphabehind
Print[ToString[SuperStar[Subscript[a, 1]],InputForm], " = ", a1star]

a2star = sumalphafront - sumbetabehind
Print[ToString[SuperStar[Subscript[a, 2]],InputForm], " = ", a2star]

xi = sumbfront - sumbbehind + sumafront - sumabehind
Print[ \[Xi],  " = ", xi ]

cstar = m+n-(p+q)/2
Print[ToString[SuperStar[c],InputForm], " = ", cstar]
Print["\n"]

(* Poles *)
aik = Table[Table[(1-A[[1]][[1]][[i]][[1]] + k) / A[[1]][[1]][[i]][[2]],{i,1,n}],{k,0,10}]
Print["First ten Poles aik = ", Flatten[aik]]
bjl = Table[Table[(-A[[2]][[1]][[j]][[1]] - l) / A[[2]][[1]][[j]][[2]],{j,1,m}],{l,0,10}]
Print["First ten Poles bjl = ", Flatten[bjl]]
poles = Table[Solve[(1-A[[1]][[1]][[i]][[1]] + k) / A[[1]][[1]][[i]][[2]] == (-A[[2]][[1]][[j]][[1]] - l) / A[[2]][[1]][[j]][[2]], {k}], {i,1,n}, {j,1,m}]
Print["Poles overlap? ", Flatten[poles]]
Print["\n"]
Print["\n"]


(* Condition 2.6.8 *)
Print["Condition: SuperStar[a]>0: ", astar, ">0", "or"]
Print["SuperStar[a]=\[CapitalDelta]=0 and Re(\[Mu])<-1: ", astar, " = 0 and ", \[CapitalDelta], " = ", Delta, " and ", mu+1//FullSimplify,  " < 0"]
Print["\n"]

Print["Condition (2.6.8):  ", \[Sigma] \[Eta] + \[Omega] + \[Tau] Min[Table[A[[2]][[1]][[j]][[1]]/A[[2]][[1]][[j]][[2]], {j,1,m}]]+1 //FullSimplify, ">0"]
Print["Condition (2.6.9):  ", \[Tau] Min[Table[(1-A[[1]][[1]][[i]][[1]])/A[[2]][[1]][[i]][[2]], {i,1,n}]]- \[Omega] + \[Sigma]/2 -1 //FullSimplify, ">0"]
Print["Condition (2.6.10): ", \[Eta] + 1/2 //FullSimplify, ">0"]
Print["\n"]



Print["Here is the output"]
(* parameters for the output *)
B = A
B[[1]][[1]] = Prepend[B[[1]][[1]],{1- ( \[Omega] +1 )/( 2 \[Sigma] ) - \[Eta]/2 , \[Tau]/(2 \[Sigma])//FullSimplify}]
B[[1]][[2]] = Append[B[[1]][[2]], {1- ( \[Omega] +1 )/( 2 \[Sigma] ) + \[Eta]/2 , \[Tau]/(2 \[Sigma])//FullSimplify}]
Print[B]

Save["output.wls",B]
Run["./FoxH.wls output.wls"]


(* Save all variables *)
Names["Global `*"];
DumpSave["FoxH_Results.mx", "Global`"];



