FROM ubuntu:20.04

# gitと便利なパッケージをインストール
RUN apt update && apt upgrade -y
RUN apt install -y bash-completion
RUN apt install -y sudo nano
RUN apt-get install -y git

# ユーザーとグループの設定
ARG USERNAME="devuser"
ARG UID=9999
ARG PASSWORD="dev"
ARG GNAME="developers"
ARG GID=9999

# ユーザーとグループの作成
RUN groupadd -g $GID $GNAME
RUN useradd -m -u $UID -g $GID -G sudo $USERNAME
RUN echo "$USERNAME:$PASSWORD" | sudo chpasswd
RUN echo "$USERNAME   ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
RUN mkdir /home/$USERNAME/src
USER $USERNAME
WORKDIR /home/$USERNAME/src

# shunit2をクローン
RUN git clone https://github.com/kward/shunit2.git ~/shunit2