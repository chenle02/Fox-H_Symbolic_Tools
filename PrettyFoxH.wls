#!/usr/bin/env wolframscript
(* By Le Chen, Auburn University *)
(* Le.Chen@auburn.edu, chenle02@gmail.com *)
(* Thu Nov 9, 2023 *)

(* Function to display help information *)
PrintHelp[] := Module[{},
  Print["Usage: FormatLists.wls <input_file> [-m]"];
  Print["<input_file>: The path to the Mathematica (.wls) file containing the lists to format."];
  Print["-m: Modify the input file in place with the formatted lists."];
  Print["-h: Display this help information."];
];

(* Function to format a Mathematica list with comments and newlines *)
FormatExpressionWithComments[expr_] := Module[
  {formattedExpr, upperList, lowerList, upperFront, upperRear, lowerFront, lowerRear},

  (* Extract upper and lower lists *)
  {upperList, lowerList} = expr;

  (* Format each list *)
  upperFront = "(* Upper Front List *) " <> ToString[upperList[[1]], InputForm];
  upperRear  = "(* Upper Rear List *)  " <> ToString[upperList[[2]], InputForm];
  lowerFront = "(* Lower Front List *) " <> ToString[lowerList[[1]], InputForm];
  lowerRear  = "(* Lower Rear List *)  " <> ToString[lowerList[[2]], InputForm];

  (* Combine into the final formatted expression *)
  formattedExpr = "{\n" <>
    "  (* Upper List *) {\n" <>
    "    " <> upperFront <> ",\n" <>
    "    " <> upperRear <> "\n" <>
    "  },\n" <>
    "  (* Lower List *) {\n" <>
    "    " <> lowerFront <> ",\n" <>
    "    " <> lowerRear <> "\n" <>
    "  }\n}";

  formattedExpr
];

(* Main script execution *)
Begin["`Private`"];

(* Parse command-line arguments *)
ARGS = Drop[$ScriptCommandLine, 1];

(* Check for help or no arguments *)
If[Length[ARGS] == 0 || MemberQ[ARGS, "-h"],
  PrintHelp[];
  Exit[];
];

(* Extract input file path and modify flag *)
inputFilePath = ARGS[[1]];
modifyFlag = MemberQ[ARGS, "-m"];

(* Read the expression from the file *)
If[!FileExistsQ[inputFilePath],
  Print["Error: The specified input file does not exist."];
  Exit[];
];

expr = Get[inputFilePath];

(* Format the expression with comments *)
formattedContent = FormatExpressionWithComments[expr];

(* Overwrite the input file or print the result *)
If[modifyFlag,
  (* Modify the input file *)
  Put[formattedContent, inputFilePath];
  Print["File modified: ", inputFilePath];
,
  (* Print the result to the screen *)
  Print[formattedContent]
];

End[];
