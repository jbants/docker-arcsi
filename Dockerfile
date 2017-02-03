#Download Ubuntu
FROM ubuntu
MAINTAINER James Banting <jbanting@deltageo.ca>

#Set Mode to not interactive
ENV DEBIAN_FRONTEND noninteractive

#Install missing libraries
RUN apt-get update --fix-missing && apt-get install -y wget bzip2 ca-certificates \
    libglib2.0-0 libxext6 libsm6 libxrender1 \
    git mercurial subversion

#Download Miniconda
RUN wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
RUN echo 'export PATH=/opt/conda/bin:$PATH' > /etc/profile.d/conda.sh 

#Install Miniconda
RUN /bin/bash Miniconda3-latest-Linux-x86_64.sh  -b -p /opt/conda && \
rm Miniconda3-latest-Linux-x86_64.sh 

ENV PATH /opt/conda/bin:$PATH

#Install RSGIS
RUN conda install numpy -y
RUN conda install -c conda-forge -c rios scikit-learn rios h5py -y
RUN conda install -c conda-forge -c rios rsgislib arcsi -y

#Install Nano
RUN apt-get install nano -y
