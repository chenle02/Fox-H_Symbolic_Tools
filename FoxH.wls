#!/usr/bin/env wolframscript
(* By Le Chen, Auburn University *)
(* Le.Chen@auburn.edu, chenle02@gmail.com *)
(* Thu Nov 9 09:01:26 AM EST 2023 *)

argv = Rest @ $ScriptCommandLine;
argc = Length @ argv;
(* Do[Print[argv[[i]]], {i, argc}] *)

If[argc == 0,
  (* No arguments were passed. Print help information *)
  Print["Usage: scriptname.wls <argument>"];
  Print["<argument>: Description of what the argument should be."];
  Print[""];
  Print["Help Options:"];
  Print["-h, --help           Show help options."];
  Print[""];
  Print["Common Greek Letters Input:"];
  Print["\[Alpha]              Type \\[Alpha] to get the α character."];
  Print["\[Beta]               Type \\[Beta] to get the β character."];
  Print["\[Gamma]              Type \\[Gamma] to get the γ character."];
  Print["... and so on for other Greek letters."];
  Print[""];
  Print["Please provide an argument or use -h for help."];
  Exit[]
];

(* Check for help argument *)
If[argv[[1]] == "-h" || argv[[1]] == "--help",
  (* Help argument was passed. Print help information *)
  Print["Usage: scriptname.wls <argument>"];
  Print["<argument>: Description of what the argument should be."];
  Print[""];
  Print["Help Options:"];
  Print["-h, --help           Show help options."];
  Print[""];
  Print["Common Greek Letters Input:"];
  Print["Complete list of Greek letters and their Mathematica input:"];
  Print["\[Alpha]        Type \\[Alpha] for α (alpha)"];
  Print["\[Beta]         Type \\[Beta] for β (beta)"];
  Print["\[Gamma]        Type \\[Gamma] for γ (gamma)"];
  Print["\[Delta]        Type \\[Delta] for δ (delta)"];
  Print["\[Epsilon]      Type \\[Epsilon] for ϵ (epsilon)"];
  Print["\[Zeta]         Type \\[Zeta] for ζ (zeta)"];
  Print["\[Eta]          Type \\[Eta] for η (eta)"];
  Print["\[Theta]        Type \\[Theta] for θ (theta)"];
  Print["\[Iota]         Type \\[Iota] for ι (iota)"];
  Print["\[Kappa]        Type \\[Kappa] for κ (kappa)"];
  Print["\[Lambda]       Type \\[Lambda] for λ (lambda)"];
  Print["\[Mu]           Type \\[Mu] for μ (mu)"];
  Print["\[Nu]           Type \\[Nu] for ν (nu)"];
  Print["\[Xi]           Type \\[Xi] for ξ (xi)"];
  Print["\[Omicron]      Type \\[Omicron] for ο (omicron)"];
  Print["\[Pi]           Type \\[Pi] for π (pi)"];
  Print["\[Rho]          Type \\[Rho] for ρ (rho)"];
  Print["\[Sigma]        Type \\[Sigma] for σ (sigma)"];
  Print["\[Tau]          Type \\[Tau] for τ (tau)"];
  Print["\[Upsilon]      Type \\[Upsilon] for υ (upsilon)"];
  Print["\[Phi]          Type \\[Phi] for φ (phi)"];
  Print["\[Chi]          Type \\[Chi] for χ (chi)"];
  Print["\[Psi]          Type \\[Psi] for ψ (psi)"];
  Print["\[Omega]        Type \\[Omega] for ω (omega)"];
  Print[""]
  Print["For capital Greek letters, capitalize the first letter of the input:"];
  Print["\[CapitalAlpha] Type \\[CapitalAlpha] for Α (Alpha)"];
  Print["\[CapitalBeta]  Type \\[CapitalBeta] for Β (Beta)"];
  Print["\[CapitalGamma] Type \\[CapitalGamma] for Γ (Gamma)"];
  Print["... and so on."];
  Print[""]
  Print["For the variant forms of certain Greek letters:"];
  Print["\[CurlyEpsilon] Type \\[CurlyEpsilon] for ε (curly epsilon)"];
  Print["\[CurlyTheta]   Type \\[CurlyTheta] for ϑ (curly theta)"];
  Print["\[CurlyKappa]   Type \\[CurlyKappa] for ϰ (curly kappa)"];
  Print["\[CurlyPi]      Type \\[CurlyPi] for ϖ (curly pi)"];
  Print["\[CurlyPhi]     Type \\[CurlyPhi] for φ (curly phi)"];
  Print["\[CurlyRho]     Type \\[CurlyRho] for ϱ (curly rho)"];
  Print["\[CurlySigma]   Type \\[CurlySigma] for ς (curly sigma)"];
  Print["\[CurlyOmega]   Type \\[CurlyOmega] for ϖ (curly omega)"];
  Print["... and so on for other Greek letters."];
  Exit[]
];

(* Only the first argument will be passed *)
A = Get[argv[[1]]]


(* First print the FoxH parameters *)
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

Print["Upper Front List  = ", A[[1]][[1]]]
sumafront = If[Length[A[[1]][[1]]] == 0, 0,Total[A[[1]][[1]]][[1]]]
Print["Sum of front a's = ", sumafront]
sumalphafront = If[Length[A[[1]][[1]]] == 0, 0,Total[A[[1]][[1]]][[2]]]
Print["Sum of front \[Alpha]'s = ", sumalphafront]
Print["\n"]

Print["Upper Rear List = ", A[[1]][[2]]]
sumabehind = If[Length[A[[1]][[2]]] == 0, 0, Total[A[[1]][[2]]][[1]]]
Print["Sum of rear a's = ", sumabehind]
sumalphabehind = If[Length[A[[1]][[2]]] == 0, 0, Total[A[[1]][[2]]][[2]]]
Print["Sum of rear \[Alpha]'s = ", sumalphabehind]
Print["\n"]

Print["Lower = ", A[[2]]]
Print["\n"]

Print["Lower Front List  = ", A[[2]][[1]]]
sumbfront = If[Length[A[[2]][[1]]] == 0, 0, Total[A[[2]][[1]]][[1]]]
Print["Sum of front b's = ", sumbfront]
sumbetafront = If[Length[A[[2]][[1]]] == 0, 0, Total[A[[2]][[1]]][[2]]]
Print["Sum of front \[Beta]'s = ", sumbetafront]
Print["\n"]

Print["Lower Rear List = ", A[[2]][[2]]]
sumbbehind = If[Length[A[[2]][[2]]] == 0, 0, Total[A[[2]][[2]]][[1]]]
Print["Sum of rear b's = ", sumbbehind]
sumbetabehind = If[Length[A[[2]][[2]]] == 0, 0, Total[A[[2]][[2]]][[2]]]
Print["Sum of rear \[Beta]'s = ", sumbetabehind]
Print["\n"]

Print["Summary:"]
Spaces = StringJoin[Table["\[NonBreakingSpace]", {6}]]

astar = FullSimplify[sumalphafront - sumalphabehind + sumbetafront - sumbetabehind]
(* Print[ToString[SuperStar[a],InputForm], " = ", astar] *)
Print["(1.1.7)", Spaces, "a^* = ", astar]

Delta = FullSimplify[sumbetafront + sumbetabehind - sumalphafront - sumalphabehind]
Print["(1.1.8)", Spaces, "\[CapitalDelta] = ", Delta]

f[x_] := x^x
delta = FullSimplify[(Total[f /@ A[[2]][[1]]] Total[f /@ A[[2]][[2]]] / Total[f /@ A[[1]][[1]]] / Total[f /@ A[[1]][[2]]] )[[2]]]
Print["(1.1.9)", Spaces, "\[Delta] = ", delta]

mu = FullSimplify[sumbfront + sumbbehind - sumafront - sumabehind + (p-q)/2]
Print[ \[Mu], " = ", mu]

a1star = FullSimplify[sumbetafront - sumalphabehind]
(* Print[ToString[SuperStar[Subscript[a, 1]],InputForm], " = ", a1star] *)
Print["a_1^* = ", a1star]

a2star = FullSimplify[sumalphafront - sumbetabehind]
(* Print[ToString[SuperStar[Subscript[a, 2]],InputForm], " = ", a2star] *)
Print["a_2^* = ", a2star]

xi = FullSimplify[sumbfront - sumbbehind + sumafront - sumabehind]
Print["(1.1.15)   \[Xi]  = ", xi ]

cstar = FullSimplify[m+n-(p+q)/2]
(* Print[ToString[SuperStar[c],InputForm], " = ", cstar] *)
Print["(1.1.15)    c^* = ", cstar]
Print["\n"]

(* Poles *)
aik = FullSimplify[Table[Table[(1-A[[1]][[1]][[i]][[1]] + k) / A[[1]][[1]][[i]][[2]],{i,1,n}],{k,0,10}]]
Print["First ten Poles aik = ", Flatten[aik]]
bjl = FullSimplify[Table[Table[(-A[[2]][[1]][[j]][[1]] - l) / A[[2]][[1]][[j]][[2]],{j,1,m}],{l,0,10}]]
Print["First ten Poles bjl = ", Flatten[bjl]]
poles = FullSimplify[Table[Solve[(1-A[[1]][[1]][[i]][[1]] + k) / A[[1]][[1]][[i]][[2]] == (-A[[2]][[1]][[j]][[1]] - l) / A[[2]][[1]][[j]][[2]], {k}], {i,1,n}, {j,1,m}]]
Print["Poles overlap? ", Flatten[poles]]

(* Save all variables *)
Names["Global `*"];
DumpSave["FoxH_Results.mx", "Global`"];



