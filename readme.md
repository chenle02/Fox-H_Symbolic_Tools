![Fox H-function Diagram](./media/FoxH-Diagram.png)
![Screenshot](./media/Screenshot.png)
[![asciicast](https://asciinema.org/a/620136.svg)](https://asciinema.org/a/620136)

# Symbolic computation tools for Fox-H function
1. In this repo, we have some Mathematica codes that are used to show conditions for Fox-H function.
2. The codes are used to verify Theorem C.1 of [arXiv:2206.10069](https://arxiv.org/abs/2206.10069).

# Prerequisites
1. Wolfram Mathematica
2. Python 3.8
3. [lualatex](https://www.luatex.org/) for generating pdf files.

# Usage
1. The input file for the Fox H function can be either csv file or wls file.
  * If the input the file is csv file, it should contain four rows, corresponding four lists:
    * Upper Front List
    * Upper Rear List
    * Lower Front List
    * Lower Rear List
  * Example is here: [test csv](test.csv), where comment lines start with `#`.
    ```
# Comment line starts with #
{1, \[Alpha]^(-1)}, {1, 1}
{Ceil[\[Beta]], \[Beta]}, {1, 1}
{1/2, \[Alpha]/2}, {1, 1}, {3, 3}, {2, 2}
# The following is the Lower Rear List
{1, \[Alpha]/2}

    ```
  * Or you can directly write the wls file in the format given in [test.wls](test.wls). Here is one example in the compact form:
    ```
{
  (* Upper List *) {
    (* Upper Front list *) {{1, \[Alpha]^(-1)}, {1, 1}},
    (* Upper Rear List *)  {{Ceil[\[Beta]], \[Beta]}, {1, 1}}
  },
  (* Lower List *) {
    (* Lower Front List *) {{1/2, \[Alpha]/2}, {1, 1}, {3, 3}, {2, 2}},
    (* Lower Rear List *)  {{1, \[Alpha]/2}}
  }
}
    ```
  * You can use the python script [parseArg py](./parseArg.py) to convert the csv file to wls file.
  * You can use [PrettyFoxH wls](./PrettyFoxH.wls) to convert the nested list of wls file to the pretty form with comment lines as above.

2. Use [FoxH wls](./FoxH.wls) to compute all conditions:
  * Run
    ```bash
    ./FoxH.wls
    ```
    to see the usage.
  * Run
    ```bash
    ./FoxH.wls --help
    ```
    to see how to type Greek letters.
  * In action, run
    ```bash
    ./FoxH.wls FoxH32-21.wls
    ```
4. The results are stored in [FoxH_Results mx](./FoxH_Results.mx). See the Mathematica Notebook [Result_Handle nb](./Result_Handle.nb) for how to load the results.
5. To load the results from the Mathematica notebook, do the following `<<FoxH_Results.mx`, make sure
```
Quit[] (* start a fresh kernel *)
```
6. Documentation [Fox Parametration pdf](./documentation/FoxH-Parametration.pdf) (Under construction)
7. Several examples are given in [examples](./examples) folder.

# References

1. To refer to this code, please use

  * Chen, Le. 2022. "Some Symbolic Tools for the Fox $H$-Function." <https://github.com/chenle02/Fox-H_Symbolic_Tools>; GitHub Repository.

3. Conditions and conventions for the Fox H function follow from

  * Kilbas, Anatoly A., and Megumi Saigo. 2004. $H$*-Transforms*. Vol. 9. Analytical Methods and Special Functions. Chapman & Hall/CRC, Boca Raton, FL. <https://doi.org/10.1201/9780203487372>.

4. Related papers that use this code include:

  * Chen, Le, Yuhui Guo, and Jian Song. 2022. "Moments and Asymptotics for a Class of SPDEs with Space-Time White Noise." *Preprint arXiv:2206.10069, to Appear in Trans. Amer. Math. Soc.* <https://www.arxiv.org/abs/2206.10069>.
  * Chen, Le, Guannan Hu, Yaozhong Hu, and Jingyu Huang. 2017. "Space-Time Fractional Diffusions in Gaussian Noisy Environment." *Stochastics* 89 (1): 171--206. <https://doi.org/10.1080/17442508.2016.1146282>.
  * Chen, Le, Yaozhong Hu, and David Nualart. 2019. "Nonlinear Stochastic Time-Fractional Slow and Fast Diffusion Equations on $\mathbb{R}^d$." *Stochastic Process. Appl.* 129 (12): 5073--5112. <https://doi.org/10.1016/j.spa.2019.01.003>.

5. The original paper by Fox on this special function:

  * Fox, Charles. 1961. "The $G$ and $H$ Functions as Symmetrical Fourier Kernels." *Trans. Amer. Math. Soc.* 98: 395--429. <https://doi.org/10.2307/1993339>.

6. Bib entries can be found [here](./refs/refs.bib). References are produced using the reference bank: [SPDEs-Bib](https://github.com/chenle02/SPDEs-Bib).


# LICENSE
[MIT License](LICENSE)
