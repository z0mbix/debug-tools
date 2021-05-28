FROM alpine:latest

WORKDIR /root

ADD https://storage.googleapis.com/kubernetes-release/release/v1.18.17/bin/linux/amd64/kubectl /usr/bin/kubectl
ADD https://hey-release.s3.us-east-2.amazonaws.com/hey_linux_amd64 /usr/bin/hey
ADD https://github.com/birdayz/kaf/releases/download/v0.1.40/kaf_0.1.40_Linux_x86_64.tar.gz /tmp/kaf.tar.gz

COPY requirements.txt .

RUN chmod +x /usr/bin/kubectl && \
	chmod +x /usr/bin/hey && \
	apk update && \
	apk add \
	bash \
	bash-completion \
	bind-tools \
	bwm-ng \
	bzip2 \
	curl \
	gawk \
	gcc \
	git \
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
	openssh-client \
	openssl \
	postgresql-client \
	python3 \
	py3-pip \
	py3-psycopg2 \
	py3-pip \
	redis \
	rsync \
	sed \
	socat \
	tar \
	tmux \
	unzip \
	vim \
	wget \
	&& \
	curl -sL https://github.com/smallstep/cli/releases/download/v0.14.3/step_linux_0.14.3_amd64.tar.gz | tar -C /usr --strip=1 -xz step_0.14.3/bin/step && \
	curl -sL https://releases.hashicorp.com/consul/1.7.2/consul_1.7.2_linux_amd64.zip -o consul.zip && unzip consul.zip && mv consul /usr/bin/ && \
	ln -s /usr/bin/python3 /usr/bin/python && \
	pip install --ignore-installed distlib -r requirements.txt && \
	tar -C /usr/bin/ -xvzf /tmp/kaf.tar.gz kaf

CMD ["/bin/bash"]
