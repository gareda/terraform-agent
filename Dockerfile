FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt list --upgradable

RUN echo "APT::Get::Assume-Yes \"true\";" > /etc/apt/apt.conf.d/90assumeyes

RUN apt install -y --no-install-recommends \
        apt-transport-https \
        ca-certificates \
        curl \
        jq \
        git \
        gnupg \
        iputils-ping \
        libcurl4 \
        libicu66 \
        libunwind8 \
        lsb-release gnupg \
        netcat \
        unzip \
        wget 

WORKDIR /azp

COPY ./start.sh .

RUN chmod +x start.sh

CMD ["./start.sh"]