#!/bin/sh

set -e

generate_singularity() {
  singularity run neurodocker-0.4.3.simg generate singularity \
  --base neurodebian:stretch-non-free \
  --pkg-manager apt \
  --install gcc g++ graphviz emacs-nox xorg \
  --spm12 version=r7219 \
  --fsl version=5.0.11 \
  --miniconda \
    conda_install="python pandas matplotlib scikit-learn ipython scipy nibabel" \
    pip_install="https://github.com/nipy/nipype/tarball/master
                 nilearn duecredit xlrd" \
    create_env="neuro" \
    activate=true \
  --run 'mkdir /input /output /code /templates' \
  --run 'rm -rf /opt/conda/pkgs/*' \
  --run 'rm -rf /var/lib/apt/lists/*'
}

generate_singularity > Singularity.spm12-fsl-nipype
