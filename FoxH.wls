#!/usr/bin/env wolframscript
(* By Le Chen, Auburn University *)
(* Le.Chen@auburn.edu, chenle02@gmail.com *)
(* Thu Nov 9 09:01:26 AM EST 2023 *)


CreateOutputFilePath[inputFilePath_] := Module[
  {inputDirectory, inputBaseName, outputFilePath, file},

  (* Extract the directory and base name from the input file path *)
  inputDirectory = DirectoryName[inputFilePath];
  inputBaseName = FileBaseName[inputFilePath];

  (* If the input file path does not contain a directory, use the current directory *)
  If[inputDirectory === "", inputDirectory = Directory[]];

  (* Construct the output file name *)
  outputFilePath = FileNameJoin[{inputDirectory, inputBaseName <> "_output"}];
  (* Print["Output file: ", outputFilePath]; *)

  (* Check if the directory exists, if not, exit or handle as needed *)
  If[!DirectoryQ[inputDirectory],
    Print["The specified directory does not exist: ", inputDirectory];
    Abort[];  (* or handle error as needed *)
  ];

  (* Try to open the output file *)
  file = OpenWrite[outputFilePath <> ".tex", PageWidth -> Infinity];
  If[file === $Failed,
    Print["Cannot open file for writing: ", outputFilePath];
    Abort[];  (* or handle error as needed *)
  ];

  (* Print["successfully open file"] *)
  {file, outputFilePath}
];


(* Main function start from here *)
argv = Rest @ $ScriptCommandLine;
argc = Length @ argv;
(* Do[Print[argv[[i]]], {i, argc}] *)

PrintUsage[scriptName_] := Module[{},
  Print["Usage: ", scriptName, " <Fox-H-File>"];
  Print["<Fox-H-File>: The file for the parameters of the Fox H function."];
  Print["              1. It can be wls file."];
  Print["              2. It can also be csv file, which contains four rows that corresponding to four lists:"];
  Print["                 * Upper Front List"];
  Print["                 * Upper Rear List"];
  Print["                 * Lower Front List"];
  Print["                 * Lower Rear List"];
]

If[argc == 0,
  (* No arguments were passed. Print help information *)
  PrintUsage["./FoxH.wls"]
  Print[""];
  Print["Help Options:"];
  Print["-h, --help           Show help for typing Greek letters."];
  Print["-s, --standalone     Generate standalone latex and pdf."];
  Print["-t, --transpose      Show eigth poles in column vector."];
  Print[""];
  Print["Common Greek Letters Input:"];
  Print["\[Alpha]              Type \\[Alpha] to get the α character."];
  Print["\[Beta]               Type \\[Beta] to get the β character."];
  Print["\[Gamma]              Type \\[Gamma] to get the γ character."];
  Print["... and so on for other Greek letters."];
  Print[""];
  Print["Please provide an argument or use -h for more help regarding typing Greek letters."];
  Exit[]
];

(* Check for help argument *)
If[MemberQ[argv, "-h"] || MemberQ[argv, "--help"],
  PrintUsage["./FoxH.wls"]
  Print[""];
  Print["More help Options:"];
  Print["-h, --help           Show help options."];
  Print[""];
  Print["Common Greek Letters Input:"];
  Print[""];
  Print["Complete list of Greek letters and their Mathematica input:"];
  Print[""];
  Print["\[Alpha]        Type \\[Alpha] for \[Alpha] (alpha)"];                       (* α *)
  Print["\[Beta]         Type \\[Beta] for \[Beta] (beta)"];                          (* β *)
  Print["\[Gamma]        Type \\[Gamma] for \[Gamma] (gamma)"];                       (* γ *)
  Print["\[Delta]        Type \\[Delta] for \[Delta] (delta)"];                       (* δ *)
  Print["\[Epsilon]      Type \\[Epsilon] for \[Epsilon] (epsilon)"];                 (* ϵ *)
  Print["\[Zeta]         Type \\[Zeta] for \[Zeta] (zeta)"];                          (* ζ *)
  Print["\[Eta]          Type \\[Eta] for \[Eta] (eta)"];                             (* η *)
  Print["\[Theta]        Type \\[Theta] for \[Theta] (theta)"];                       (* θ *)
  Print["\[Iota]         Type \\[Iota] for \[Iota] (iota)"];                          (* ι *)
  Print["\[Kappa]        Type \\[Kappa] for \[Kappa] (kappa)"];                       (* κ *)
  Print["\[Lambda]       Type \\[Lambda] for \[Lambda] (lambda)"];                    (* λ *)
  Print["\[Mu]           Type \\[Mu] for \[Mu] (mu)"];                                (* μ *)
  Print["\[Nu]           Type \\[Nu] for \[Nu] (nu)"];                                (* ν *)
  Print["\[Xi]           Type \\[Xi] for \[Xi] (xi)"];                                (* ξ *)
  Print["\[Omicron]      Type \\[Omicron] for \[Omicron] (omicron)"];                 (* ο *)
  Print["\[Pi]           Type \\[Pi] for \[Pi] (pi)"];                                (* π *)
  Print["\[Rho]          Type \\[Rho] for \[Rho] (rho)"];                             (* ρ *)
  Print["\[Sigma]        Type \\[Sigma] for \[Sigma] (sigma)"];                       (* σ *)
  Print["\[Tau]          Type \\[Tau] for \[Tau] (tau)"];                             (* τ *)
  Print["\[Upsilon]      Type \\[Upsilon] for \[Upsilon] (upsilon)"];                 (* υ *)
  Print["\[Phi]          Type \\[Phi] for \[Phi] (phi)"];                             (* φ *)
  Print["\[Chi]          Type \\[Chi] for \[Chi] (chi)"];                             (* χ *)
  Print["\[Psi]          Type \\[Psi] for \[Psi] (psi)"];                             (* ψ *)
  Print["\[Omega]        Type \\[Omega] for \[Omega] (omega)"];                       (* ω *)
  Print[""]
  Print[""];
  Print["For capital Greek letters, capitalize the first letter of the input:"];
  Print[""];
  Print["\[CapitalAlpha] Type \\[CapitalAlpha] for \[CapitalAlpha] (Alpha)"];         (* Α *)
  Print["\[CapitalBeta]  Type \\[CapitalBeta] for \[CapitalBeta] (Beta)"];            (* Β *)
  Print["\[CapitalGamma] Type \\[CapitalGamma] for \[CapitalGamma] (Gamma)"];         (* Γ *)
  Print["... and so on."];
  Print[""]
  Print["For the variant forms certain Greek letters:"];
  Print[""];
  Print["\[CurlyEpsilon] Type \\[CurlyEpsilon] for \[CurlyEpsilon] (curly epsilon)"]; (* ε *)
  Print["\[CurlyTheta]   Type \\[CurlyTheta] for \[CurlyTheta] (curly theta)"];       (* ϑ *)
  Print["\[CurlyKappa]   Type \\[CurlyKappa] for \[CurlyKappa] (curly kappa)"];       (* ϰ *)
  Print["\[CurlyPi]      Type \\[CurlyPi] for \[CurlyPi] (curly pi)"];                (* ϖ *)
  Print["\[CurlyPhi]     Type \\[CurlyPhi] for \[CurlyPhi] (curly phi)"];             (* φ *)
  Print["\[CurlyRho]     Type \\[CurlyRho] for \[CurlyRho] (curly rho)"];             (* ϱ *)
  Print["... and so on for other Greek letters."];
  Exit[]
];

(* Function to retrieve the input file path and ignore flags *)
GetInputFilePath[args_List] := Module[
  {fileArg},
  fileArg = Select[args, Not[StringStartsQ[#, "-"]] &]; (* Select arguments that are not flags *)
  If[Length[fileArg] >= 1,
    First[fileArg], (* Return the first non-flag argument as the file path *)
    None (* or a default value indicating no file path was provided *)
  ]
];

argv = Drop[$ScriptCommandLine, 1]; (* Drop the script's own name *)
inputFilePath = GetInputFilePath[argv];

(* Check if an input file path was provided *)
If[inputFilePath === None,
  Print["No input file path provided."];
  (* Handle error or provide usage message *)
  Exit[]
];
Print["Input file: ", inputFilePath]

(* Set the path of your Python script for conversion from csv to wls *)
pythonScriptPath = "./parseArg.py";

(* Determine the file extension *)
fileExtension = ToLowerCase[FileExtension[inputFilePath]];

wlsFilePath = "";

If[fileExtension === "wls",
  (* If the file is a .wls file, use it directly *)
  wlsFilePath = inputFilePath,
  If[fileExtension === "csv",
    (* If the file is a .csv file, run the Python script parseArg.py to convert it *)
    RunProcess[{"python", pythonScriptPath, inputFilePath}];
    wlsFilePath = StringReplace[inputFilePath, ".csv" -> ".wls"];
    If[!FileExistsQ[wlsFilePath],
      (* If the .wls file does not exist, handle the error *)
      Print["The conversion to .wls did not succeed or the file does not exist."];
      Exit[]
    ];
    Print["The file ", inputFilePath, " has been transformed to ", wlsFilePath]
  ,
    (* If the file is neither .wls nor .csv, handle accordingly *)
    Print["Unsupported file type."];
    Exit[]
  ]
];

(* Load the Mathematica content from the .wls file *)
If[wlsFilePath =!= "",
  A = Get[wlsFilePath]
,
  Print["No valid .wls file path available."];
  Exit[]
];


(* First print the FoxH parameters *)
Print["\n"]
Print["Here is the input:"]
fileContent = RunProcess[{"cat", wlsFilePath}, "StandardOutput"];
Print[fileContent];
Print["The input in the compact form:"]
Print["A = ", A]
Print["Upper = ", A[[1]]]
Print["Lower = ", A[[2]]]
Print["\n"]

(* Now computing the parameters *)
Print["First determine the configure numbers (m,n,p,q):"]
p = Length[A[[1]][[1]]] + Length[A[[1]][[2]]]
q = Length[A[[2]][[1]]] + Length[A[[2]][[2]]]
m = Length[A[[2]][[1]]]
n = Length[A[[1]][[1]]]

Print["m = ", m, ", n = ", n]
Print["p = ", p, ", q = ", q]
Print["\n"]

Print["Upper List = ", A[[1]]]
Print["\n"]

Print["Upper Front List = ", A[[1]][[1]]]
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

Print["Lower List = ", A[[2]]]
Print["\n"]

Print["Lower Front List = ", A[[2]][[1]]]
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
Print["(1.1.7) ", Spaces, "a^* = ", astar]

Delta = FullSimplify[sumbetafront + sumbetabehind - sumalphafront - sumalphabehind]
Print["(1.1.8) ", Spaces, "\[CapitalDelta] = ", Delta]

f[x_] := x^x
delta = FullSimplify[(Total[f /@ A[[2]][[1]]] Total[f /@ A[[2]][[2]]] / Total[f /@ A[[1]][[1]]] / Total[f /@ A[[1]][[2]]] )[[2]]]
Print["(1.1.9) ", Spaces, "\[Delta] = ", delta]

mu = FullSimplify[sumbfront + sumbbehind - sumafront - sumabehind + (p-q)/2]
Print["(1.1.10)", Spaces, "\[Mu] = ", mu]

a1star = FullSimplify[sumbetafront - sumalphabehind]
(* Print[ToString[SuperStar[Subscript[a, 1]],InputForm], " = ", a1star] *)
Print["(1.1.11)", Spaces, "a_1^* = ", a1star]

a2star = FullSimplify[sumalphafront - sumbetabehind]
(* Print[ToString[SuperStar[Subscript[a, 2]],InputForm], " = ", a2star] *)
Print["(1.1.12)", Spaces, "a_2^* = ", a2star]

xi = FullSimplify[sumbfront - sumbbehind + sumafront - sumabehind]
Print["(1.1.14)", Spaces, "\[Xi] = ", xi ]

cstar = FullSimplify[m+n-(p+q)/2]
(* Print[ToString[SuperStar[c],InputForm], " = ", cstar] *)
Print["(1.1.15)", Spaces, "c^* = ", cstar]
Print["\n"]

(* Call the function to create the output LaTex file path and open the file *)
{file, outputFilePath} = CreateOutputFilePath[inputFilePath];

(* Check if the file was opened successfully *)
If[file === $Failed,
  Print["Failed to open the output file."];
  (* Handle error or exit *)
  Exit[];
];

(* Format the upper and lower lists as comma-separated LaTeX compatible strings *)
upperList = StringJoin[Riffle["\\left(" <> ToString[#[[1]], TeXForm] <> ", " <> ToString[#[[2]], TeXForm] <> "\\right)" & /@ Flatten[A[[1]], 1], ", "]];
lowerList = StringJoin[Riffle["\\left(" <> ToString[#[[1]], TeXForm] <> ", " <> ToString[#[[2]], TeXForm] <> "\\right)" & /@ Flatten[A[[2]], 1], ", "]];

(* Format each sublist as a comma-separated LaTeX compatible string *)
formatList[list_] := StringJoin[Riffle[
  "\\left(" <> ToString[#[[1]], TeXForm] <> ", " <> ToString[#[[2]], TeXForm] <> "\\right)" & /@ list,
  ", "
]];

(* Parse each list *)
upperFrontList = formatList[A[[1, 1]]];
upperRearList = formatList[A[[1, 2]]];
lowerFrontList = formatList[A[[2, 1]]];
lowerRearList = formatList[A[[2, 2]]];
(* Print[upperFrontList] *)
(* Print[upperRearList] *)
(* Print[lowerFrontList] *)
(* Print[lowerRearList] *)



(* LaTeX header *)
If[MemberQ[argv, "-s"] || MemberQ[argv, "--standalone"],
  WriteString[file, "\\documentclass[preview]{standalone}\n"],
  WriteString[file, "\\documentclass[11pt]{article}\n"]
];

WriteString[file, "\\usepackage{amsmath, url, hyperref, minted, fontspec}\n"];
WriteString[file, "\\setmonofont{DejaVu Sans Mono}[Scale=MatchLowercase]\n"];
WriteString[file, "\\newcommand{\\FoxH}[5]{H_{#2}^{#1}\\left(#3\\:\\middle\\vert\\: \\begin{array}{l}#4\\\\[0.4em] #5\\end{array}\\right)}\n"];
WriteString[file,
"\\input{../latex_sources/preamble.tex}",
"\\addbibresource{../latex_sources/Fox-H_biber.bib}",
"}\n",
"\\begin{document}\n\n",
];
WriteString[file, "\\section{Example \\url{" <> inputFilePath <>"}}\n\n"];
WriteString[file, "\\paragraph{File content}\n\n"];
(* WriteString[file, "\\begin{minted}{text}\n"]; *)
(* WriteString[file, fileContent]; *)
(* WriteString[file, "\\end{minted}\n\n"]; *)
WriteString[file, "\\inputminted{text}{" <> inputFilePath <> "}\n\n"];
WriteString[file, "\\paragraph{Fox H-function}\n\n"];
WriteString[file, "\\begin{align*}\n"];
WriteString[file, "  \\FoxH\n    {" <> ToString[m] <> "," <> ToString[n] <> "}\n    {" <> ToString[p] <> "," <> ToString[q] <> "}\n    {\\cdot}\n    {" <> upperList <> "}\n    {" <> lowerList <> "}\n"];
WriteString[file, "\\end{align*}", "\n\n"];
WriteString[file, "\\begin{align*}\n"];
WriteString[file, "  \\FoxHext\n    {" <> ToString[m] <> "," <> ToString[n] <> "}\n    {" <> ToString[p] <> "," <> ToString[q] <> "}\n    {\\cdot}\n    {" <> upperFrontList <> "}\n    {" <> upperRearList <> "}\n    {" <> lowerFrontList <> "}\n    {" <> lowerRearList <> "}\n"];
WriteString[file, "\\end{align*}", "\n\n"];
WriteString[file, "\\paragraph{Summary}\n\n"];
WriteString[file, "\\begin{align*}\n"];
WriteString[file, "  a^*    & = ",  TeXForm[astar],  " \\\\", "\n"];
WriteString[file, "  \\Delta & = ", TeXForm[Delta],  " \\\\", "\n"];
WriteString[file, "  \\delta & = ", TeXForm[delta],  " \\\\", "\n"];
WriteString[file, "  \\mu    & = ", TeXForm[mu],     " \\\\", "\n"];
WriteString[file, "  a_1^*  & = ",  TeXForm[a1star], " \\\\", "\n"];
WriteString[file, "  a_2^*  & = ",  TeXForm[a2star], " \\\\", "\n"];
WriteString[file, "  \\xi    & = ", TeXForm[xi],     " \\\\", "\n"];
WriteString[file, "  c^*    & = ",  TeXForm[cstar],  " \\\\", "\n"];
WriteString[file, "\\end{align*}",  "\n\n"];

(* Poles *)
Print["Poles:"]

(* Compute aik if n is greater than zero *)
If[n > 0,
  aik = FullSimplify[Table[Table[(1-A[[1]][[1]][[i]][[1]] + k) / A[[1]][[1]][[i]][[2]], {i, 1, n}], {k, 0, 7}]];
  Print["First eight Poles aik = ", Flatten[aik]],
  (* Handle the case when n is zero *)
  Print["n is zero, aik computation skipped"];
  aik = {}  (* Assign an empty list to aik *)
];

(* Compute bjl if m is greater than zero *)
If[m > 0,
  bjl = FullSimplify[Table[Table[(-A[[2]][[1]][[j]][[1]] - l) / A[[2]][[1]][[j]][[2]], {j, 1, m}], {l, 0, 7}]];
  Print["First eight Poles bjl = ", Flatten[bjl]],
  (* Handle the case when m is zero *)
  Print["m is zero, bjl computation skipped"];
  bjl = {}  (* Assign an empty list to bjl *)
];

(* Check and compute pole overlaps only if both m and n are greater than zero *)
If[n > 0 && m > 0,
  poles = FullSimplify[Table[Solve[(1-A[[1]][[1]][[i]][[1]] + k) / A[[1]][[1]][[i]][[2]] == (-A[[2]][[1]][[j]][[1]] - l) / A[[2]][[1]][[j]][[2]], {k}], {i, 1, n}, {j, 1, m}]];
  Print["Poles overlap? ", Flatten[poles]],
  (* No pole overlap if either m or n is zero *)
  Print["No pole overlap as either m or n is zero"];
  poles = {}  (* Assign an empty list to poles *)
];


WriteString[file, "\\paragraph{Poles}\n\n"];
WriteString[file, "\\noindent\\textbf{1. First eight poles from upper front list}\n\n"];
WriteString[file, "\\begin{align*}\n"];

(* If[MemberQ[argv, "-t"] || MemberQ[argv, "--transpose"], *)
(*   WriteString[file, "  a_{i,k} = \n  ", TeXForm[aik],  "\n"], *)
(*   WriteString[file, "  a_{i,k} = \n  ", TeXForm[Transpose[aik]],  "\n"] *)
(* ] *)

If[MemberQ[argv, "-t"] || MemberQ[argv, "--transpose"],
  WriteString[file, "  a_{i,k} = \n  ", TeXForm[aik],  "^T \n"],
  WriteString[file, "  a_{i,k} = \n  ", TeXForm[Transpose[aik]],  "\n"]
]

WriteString[file, "\\end{align*}", "\n"];
WriteString[file, "\\noindent\\textbf{2. First eight poles from lower front list}\n\n"];
WriteString[file, "\\begin{align*}\n"];
If[MemberQ[argv, "-t"] || MemberQ[argv, "--transpose"],
  WriteString[file, "  b_{j,\\ell} = \n  ", TeXForm[bjl], "^T \n"],
  WriteString[file, "  b_{j,\\ell} = \n  ", TeXForm[Transpose[bjl]], "\n"]
]
WriteString[file, "\\end{align*}", "\n\n"];


additionalFilePath = StringReplace[outputFilePath, "_output" -> "_additional"];
(* If outputFilePath <> "_additional.tex" exists, then append the content to the output file *)
If[FileExistsQ[additionalFilePath <> ".tex"],
  WriteString[file, 
  "\n",
  "\\input{../Examples/" <> additionalFilePath <> ".tex",
  "\n"];

WriteString[file, "\\printbibliography[title={References}]\n\n"];
WriteString[file, "\\end{document}"];
Close[file];

result = RunProcess[{"lualatex", "--interaction=nonstopmode --shell-escape", outputFilePath}, "StandardOutput", "StandardError"];
result = RunProcess[{"biber", "--shell-escape", outputFilePath}, "StandardOutput", "StandardError"];
result = RunProcess[{"lualatex", "--shell-escape", outputFilePath}, "StandardOutput", "StandardError"];
(* Print[result["StandardOutput"]]; *)
(* Print[result["StandardError"]]; *)

If[MemberQ[argv, "-s"] || MemberQ[argv, "--standalone"],
  RunProcess[{"convert", "-density", "300", "-quality", "90", "-background", "white", "-alpha", "remove", "-alpha", "off", outputFilePath <> ".pdf", outputFilePath <> ".png"}, "StandardOutput", "StandardError"];
];
(* Save all variables *)
Names["Global `*"];
DumpSave["FoxH_Results.mx", "Global`"];

