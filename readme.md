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

# References
1. To refer to this code, please use
```
@misc{ chen:22:some,
  author       = {Chen, Le},
  title        = {Some symbolic tools for the {F}ox {$H$}-function},
  year         = {2022},
  publisher    = {GitHub Repository},
  howpublished = {\url{https://github.com/chenle02/Fox-H_Symbolic_Tools}},
  note         = {Accessed: 11/08/2023}
}
```
2. Conditions and conventions for the Fox H function follow from
```
@book{kilbas.saigo:04:h-transforms,
  author        = {Kilbas, Anatoly A. and Saigo, Megumi},
  publisher     = {Chapman \& Hall/CRC, Boca Raton, FL},
  url           = {https://doi.org/10.1201/9780203487372},
  date          = {2004},
  doi           = {10.1201/9780203487372},
  isbn          = {0-415-29916-0},
  note          = {Theory and applications},
  pages         = {xii+389},
  series        = {Analytical Methods and Special Functions},
  title         = {{$H$}-transforms},
  volume        = {9}
}
``` 
3. Related papers that use this code:
```
@article{chen.hu.ea:17:space-time,
  author        = {Chen, Le and Hu, Guannan and Hu, Yaozhong and Huang, Jingyu},
  url           = {https://doi.org/10.1080/17442508.2016.1146282},
  date          = {2017},
  doi           = {10.1080/17442508.2016.1146282},
  issn          = {1744-2508},
  journaltitle  = {Stochastics},
  number        = {1},
  pages         = {171--206},
  title         = {Space-time fractional diffusions in {G}aussian noisy environment},
  volume        = {89}
}
@article{chen.hu.ea:19:nonlinear,
  author        = {Chen, Le and Hu, Yaozhong and Nualart, David},
  url           = {https://doi.org/10.1016/j.spa.2019.01.003},
  date          = {2019},
  doi           = {10.1016/j.spa.2019.01.003},
  issn          = {0304-4149},
  journaltitle  = {Stochastic Process. Appl.},
  number        = {12},
  pages         = {5073--5112},
  title         = {Nonlinear stochastic time-fractional slow and fast diffusion equations on {$\mathbb{R}^d$}},
  volume        = {129}
}
@article{arXiv:2206.10069,
  title         = {Moments and asymptotics for a class of SPDEs with space-time white noise},
  author        = {Le Chen and Yuhui Guo and Jian Song},
  year          = {2022},
  month         = {June},
  journal       = {preprint arXiv:2206.10069, to appear in Trans. Amer. Math. Soc.},
  url           = {https://www.arxiv.org/abs/2206.10069}
}
``` 
4. References are produced using the reference bank: [SPDEs-Bib](https://github.com/chenle02/SPDEs-Bib)

# LICENSE
[MIT License](LICENSE)
