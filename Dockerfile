FROM alpine:latest

WORKDIR /root

ADD https://storage.googleapis.com/kubernetes-release/release/v1.15.0/bin/linux/amd64/kubectl /usr/bin/kubectl

COPY requirements.txt .

RUN chmod +x /usr/bin/kubectl && \
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
	jq \
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
	py3-psycopg2 \
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
	pip3 install -r requirements.txt && \
	ln -s /usr/bin/pip3 /usr/bin/pip && \
	ln -s /usr/bin/python3 /usr/bin/python

CMD ["/bin/bash"]
