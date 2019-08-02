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
	pip3 install -r requirements.txt

CMD ["/bin/bash"]
