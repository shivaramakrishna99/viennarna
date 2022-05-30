FROM 812206152185.dkr.ecr.us-west-2.amazonaws.com/wf-base:fbe8-main

# Download ViennaRNA and compile from source
RUN curl -O -L https://github.com/ViennaRNA/ViennaRNA/releases/download/v2.5.0/ViennaRNA-2.5.0.tar.gz &&\
    tar -zxvf ViennaRNA-2.5.0.tar.gz &&\
    cd ViennaRNA-2.5.0 &&\
    ./configure &&\
    make &&\
    make install &&\
    mv ViennaRNA-2.5.0 viennarna

COPY wf /root/wf

RUN  sed -i 's/latch/wf/g' flytekit.config
ARG tag
ENV FLYTE_INTERNAL_IMAGE $tag
RUN python3 -m pip install --upgrade latch
WORKDIR /root
