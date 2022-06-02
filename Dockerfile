FROM 812206152185.dkr.ecr.us-west-2.amazonaws.com/wf-base:fbe8-main

# Download ViennaRNA
RUN curl -O -L https://github.com/ViennaRNA/ViennaRNA/releases/download/v2.5.0/ViennaRNA-2.5.0.tar.gz &&\
    tar -zxvf ViennaRNA-2.5.0.tar.gz &&\
    cd ViennaRNA-2.5.0 &&\
    ./configure &&\
    make &&\
    make install &&\
    mv ViennaRNA-2.5.0 viennarna

# Or use managed library distributions through the container OS's package
# # manager.
# RUN apt-get update -y &&\
#     apt-get install -y autoconf samtools


# # You can use local data to construct your workflow image.  Here we copy a
# # pre-indexed reference to a path that our workflow can reference.
# COPY data /root/reference
# ENV BOWTIE2_INDEXES="reference"

# STOP HERE:
# The following lines are needed to ensure your build environement works
# correctly with latch.
COPY wf /root/wf
RUN  sed -i 's/latch/wf/g' flytekit.config
ARG tag
ENV FLYTE_INTERNAL_IMAGE $tag
RUN python3 -m pip install --upgrade latch
WORKDIR /root
