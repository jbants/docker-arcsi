FROM continuumio/miniconda3
MAINTAINER James Banting <jbanting@deltageo.ca>

# update conda and install arcsi using conda package manager and clean up (rm tar packages to save space) 
RUN conda update --yes conda  && \
conda install --yes -c conda-forge -c au-eoed arcsi  && \
conda clean -t

# set gdal paths
ENV GDAL_DRIVER_PATH /opt/anaconda/gdalplugins:$GDAL_DRIVER_PATH
ENV GDAL_DATA /opt/anaconda/share/gdal

# add debian packages required by arcsi
RUN apt-get update && apt-get install -y libc-dev libgfortran3 libglib2.0-0 libsm6 libxrender1 libfontconfig1 libxext6

