# Symbolic computation tools for Fox-H function
1. In this repo, we have some Mathematica codes that are used to show conditions for Fox-H function.
2. The codes are used to verify Theorem C.1 of [arXiv:2206.10069](https://arxiv.org/abs/2206.10069).

# Procedures
1. Write the parameters of Fox H as FoxH and save the file
```
A = {{{{1, \[Alpha]^(-1)}}, {{Ceil[\[Beta]], \[Beta]}}}, {{{1/2, \[Alpha]/2}, {1, 1}}, {{1, \[Alpha]/2}}}}
Save["./FoxH32-21", A]
```
2. Use [FoxH wls](./FoxH.wls) to show the parameters `./FoxH.wls FoxH32-21`
3. The results are stored in [FoxH_Results mx](./FoxH_Results.mx)
4. To load the results, do the following `<<FoxH_Results.mx`, make sure 
```
Quit[] (* start a fresh kernel *)
```

