FROM alpine:latest

WORKDIR /root

COPY requirements.txt .

RUN apk update && \
		apk add \
			bash \
			bash-completion \
			bind-tools \
			bwm-ng \
			bzip2 \
			curl \
			git \
			gzip \
			jq \
			netcat-openbsd \
			ngrep \
			nmap \
			nmap-ncat \
			nmap-nping \
			openssh-client \
			openssl \
			python3 \
			redis \
			rsync \
			socat \
			tmux \
			unzip \
			vim \
			wget \
		&& \
		pip3 install -r requirements.txt

CMD ["/bin/bash"]
