This is the repo of materials for *"Interfacing EnergyPlus using R"* workshop. Slides are available online via: https://hongyuanjia.github.io/eplusrIntro.

## Description

This is a half-day hands on workshop on
[eplusr](https://hongyuanjia.github.io/eplusr). You will learn how to read,
parse, modify EnergyPlus IDF and EPW files, conduct parametric simulations and
collect results directly in R.

This workshop assumes that you already have basic knowledge of R
and [EnergyPlus](https://www.energyplus.net).

## Software Requirements

1. A recent version of R (>=v3.2) is required, which is available for free at
   [cran.r-project.org](http://www.cran.r-project.org)
2. A recent version of RStudio IDE is recommended, available for free at
   [www.rstudio.com/download](http://www.rstudio.com/download), or use your own
   flavored R IDE.
3. The current latest stable version of eplusr, which can be install via:
    ```r
    install.packages("eplusr")
    ```
4. In the workshop, EnergyPlus v8.8 is used. It is suggested to install
   EnergyPlus before the workshop since downloading it during the workshop may
   take time. You can do this using eplusr:
   ```r
   # On Windows, this requires R running with administrative privileges on Windows.
   # On OSX and Linux, admin authorization is automatically prompted
   eplusr::install_eplus(8.8)

   # OR download the installer and then follow instructions on https://energyplus.net/downloads
   eplusr::download_eplus(8.8, dir = "directory_to_save")
   ```
5. In the workshop, `tidyverse` package is also needed for data analysis. You can install it via:
   ```r
   install.packages("tidyverse")
   ```
6. Clone this repo to your computer. You can do this by clicking the `Clone or download` button above.

## License

<a rel="license" href="http://creativecommons.org/licenses/by/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by/4.0/88x31.png" /></a>

<span xmlns:dct="http://purl.org/dc/terms/" property="dct:title">*Interfacing EnergyPlus using R*</span> by <a xmlns:cc="http://creativecommons.org/ns#" href="https://github.com/hongyuanjia/" property="cc:attributionName" rel="cc:attributionURL">Hongyuan Jia</a> is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by/4.0/">Creative Commons Attribution 4.0 International License</a>.
