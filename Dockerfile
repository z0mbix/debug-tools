FROM alpine:latest

WORKDIR /root

ADD https://storage.googleapis.com/kubernetes-release/release/v1.28.1/bin/linux/amd64/kubectl /usr/bin/kubectl
ADD https://hey-release.s3.us-east-2.amazonaws.com/hey_linux_amd64 /usr/bin/hey
ADD https://github.com/birdayz/kaf/releases/download/v0.2.3/kaf_0.2.3_Linux_x86_64.tar.gz /tmp/kaf.tar.gz
ADD https://archive.apache.org/dist/kafka/2.6.1/kafka_2.13-2.6.1.tgz /tmp/kafka.tgz
ADD https://releases.hashicorp.com/consul/1.16.2/consul_1.16.2_linux_amd64.zip /tmp/consul.zip
ADD https://github.com/smallstep/cli/releases/download/v0.24.4/step_linux_0.24.4_amd64.tar.gz /tmp/step-cli.tar.gz
ADD https://github.com/fullstorydev/grpcurl/releases/download/v1.8.7/grpcurl_1.8.7_linux_x86_64.tar.gz /tmp/grpcurl.tar.gz
ADD https://github.com/peak/s5cmd/releases/download/v2.2.2/s5cmd_2.2.2_Linux-arm64.tar.gz /tmp/s5cmd.tar.gz

COPY requirements.txt .

RUN chmod 755 /usr/bin/kubectl && \
  chmod 755 /usr/bin/hey && \
  apk update && \
  apk add --no-cache \
  bash \
  bash-completion \
  bind-tools \
  bwm-ng \
  bzip2 \
  curl \
  fd \
  gawk \
  gcc \
  git \
  groff \
  gzip \
  ipython \
  jq \
  kafkacat \
  mosh-client \
  mysql-client \
  netcat-openbsd \
  ngrep \
  nmap \
  nmap-ncat \
  nmap-nping \
  nodejs \
  openjdk11-jre-headless \
  openssh-client \
  openssl \
  postgresql-client \
  py3-pip \
  py3-psycopg2 \
  python3 \
  redis \
  ripgrep \
  rsync \
  sed \
  socat \
  tar \
  tmux \
  unzip \
  vim \
  wget \
  && \
  tar -f /tmp/step-cli.tar.gz -C /usr --strip=1 -xz step_0.24.4/bin/step && rm /tmp/step-cli.tar.gz && \
  unzip /tmp/consul.zip && mv consul /usr/bin/ && rm /tmp/consul.zip && \
  tar -f /tmp/grpcurl.tar.gz -C /usr/bin/ -xz grpcurl && rm /tmp/grpcurl.tar.gz && \
  pip install --ignore-installed distlib -r requirements.txt && \
  tar -C /usr/bin/ -xzf /tmp/kaf.tar.gz kaf && rm /tmp/kaf.tar.gz && mkdir /root/.kaf && \
  mkdir /opt/kafka && tar -C /opt/kafka --strip 1 -xzf /tmp/kafka.tgz && rm /tmp/kafka.tgz && \
  tar -C /usr/bin/ -xzf /tmp/s5cmd.tar.gz s5cmd && rm /tmp/s5cmd.tar.gz && \
  echo 'export PATH=$PATH:/opt/kafka/bin' > /etc/profile.d/kafka.sh && \
  echo 'export PS1="\u@\h:\w $ "' > /etc/profile.d/prompt.sh && \
  sed -i '/^root:/ s@/bin/ash@/bin/bash@' /etc/passwd

CMD ["/bin/bash" , "-l"]
