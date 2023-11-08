[![asciicast](https://asciinema.org/a/619828.svg)](https://asciinema.org/a/619828)

# Symbolic computation tools for Fox-H function
1. In this repo, we have some Mathematica codes that are used to show conditions for Fox-H function.
2. The codes are used to verify Theorem C.1 of [arXiv:2206.10069](https://arxiv.org/abs/2206.10069).

# Procedures
1. Write the parameters of Fox H as FoxH and save the file
```
A = {{{{1, \[Alpha]^(-1)}}, {{Ceil[\[Beta]], \[Beta]}}}, {{{1/2, \[Alpha]/2}, {1, 1}}, {{1, \[Alpha]/2}}}}
Save["./FoxH32-21", A]
```
2. Use [FoxH wls](./FoxH.wls) to show the parameters `./FoxH.wls FoxH32-21.wls`
3. The results are stored in [FoxH_Results mx](./FoxH_Results.mx)
4. To load the results, do the following `<<FoxH_Results.mx`, make sure
```
Quit[] (* start a fresh kernel *)
```
<details>
<summary>References</summary>

1. To refer to this code, please use @chen:22:some

  * Chen, Le. 2022. "Some Symbolic Tools for the Fox $H$-Function." <https://github.com/chenle02/Fox-H_Symbolic_Tools>; GitHub Repository.

3. Conditions and conventions for the Fox H function follow from @kilbas.saigo:04:h-transforms

  * Kilbas, Anatoly A., and Megumi Saigo. 2004. *$H$-Transforms*. Vol. 9. Analytical Methods and Special Functions. Chapman & Hall/CRC, Boca Raton, FL. <https://doi.org/10.1201/9780203487372>.

4. Related papers that use this code include @chen.hu.ea:17:space-time, @chen.hu.ea:19:nonlinear, and @chen.guo.ea:22:moments

  * Chen, Le, Yuhui Guo, and Jian Song. 2022. "Moments and Asymptotics for a Class of SPDEs with Space-Time White Noise." *Preprint arXiv:2206.10069, to Appear in Trans. Amer. Math. Soc.* <https://www.arxiv.org/abs/2206.10069>.
  * Chen, Le, Guannan Hu, Yaozhong Hu, and Jingyu Huang. 2017. "Space-Time Fractional Diffusions in Gaussian Noisy Environment." *Stochastics* 89 (1): 171--206. <https://doi.org/10.1080/17442508.2016.1146282>.
  * Chen, Le, Yaozhong Hu, and David Nualart. 2019. "Nonlinear Stochastic Time-Fractional Slow and Fast Diffusion Equations on $\mathbb{R}^d$." *Stochastic Process. Appl.* 129 (12): 5073--5112. <https://doi.org/10.1016/j.spa.2019.01.003>.

5. References are produced using the reference bank: [SPDEs-Bib](https://github.com/chenle02/SPDEs-Bib).

</details>

# LICENSE
[MIT License](LICENSE)
