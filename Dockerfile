FROM crystallang/crystal

RUN apt-get update && \
    apt-get install -y \
    libbsd-dev \
     libedit-dev \
  libevent-dev \
  libgmp-dev \
  libgmpxx4ldbl \
  libssl-dev \
  libxml2-dev \
  libyaml-dev \
  automake \
  libtool \
  git \
  llvm-8 \
  llvm-8-dev \
  lld-8 \
  libpcre3-dev \
  build-essential -y
  
RUN ln -sf /usr/bin/ld.lld-8 /usr/bin/ld.lld
RUN git clone https://github.com/crystal-lang/crystal
WORKDIR crystal
RUN make
RUN make std_spec compiler_spec
