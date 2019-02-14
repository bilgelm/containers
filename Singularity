BootStrap: shub
From: NIH-HPC/singularity-examples:rstudio

%labels
    Maintainer Murat Bilgel <murat.bilgel@nih.gov>

%post
#
# Choose your mirror from the list at
# http://cran.r-project.org/mirrors.html
#
    export r_mirror="http://mirrors.nics.utk.edu/cran"

# Disable interactive package configuration prompts
    export DEBIAN_FRONTEND=noninteractive

    apt-get update
    apt-get install -y texlive
    tlmgr update --self
    tlmgr install framed
#
# Install additional R packages from CRAN
#
    r <<__INSTALLCMDS__
install.packages(c('knitr','readxl','ggpubr','stargazer','tables'),repos="$r_mirror")
__INSTALLCMDS__

#
# Create some useful mountpoints to be used in addition to /mnt
#
mkdir /code
