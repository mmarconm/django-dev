# syntax=docker/dockerfile:1
FROM python:3.11.5-slim-bookworm

SHELL ["/bin/bash", "-c"]

ENV LANG=C.UTF-8
ENV TZ=America/Cuiaba
ENV DEBIAN_FRONTEND=noninteractive
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
ENV WORKDIR_NAME=/home/coder/app

# Instalação de dependências em uma única camada
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime \
    && echo $TZ > /etc/timezone \
    && apt-get update && apt upgrade -y \
    && apt-get install -y --no-install-recommends \
    build-essential \
    curl \
    locales \
    lsb-release \
    nano \
    unzip \
    git \
    nodejs \
    sqlite3 \
    npm \
    openssh-client \
    sudo \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Criação do usuário
ARG USERNAME=coder
ARG USER_UID=1001
ARG USER_GID=${USER_UID}
RUN groupadd --gid ${USER_GID} ${USERNAME} \
    && useradd --uid ${USER_UID} --gid ${USER_GID} --shell /bin/bash --create-home ${USERNAME} \
    && echo ${USERNAME} ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/${USERNAME}\
    && chmod 0440 /etc/sudoers.d/${USERNAME}

COPY --chown=${USERNAME}:${USERNAME} ./app/.vscode ${WORKDIR_NAME}/.vscode

USER ${USERNAME}

WORKDIR ${WORKDIR_NAME}

RUN bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)" \
    # && echo "source ~/.bashrc" >> ~/.bash_profile \
    && sed -i 's/OSH_THEME=".*"/OSH_THEME="zork"/' ~/.bashrc \
    && sed -i '$ s/^/#/' ~/.bashrc
    
EXPOSE 8000

# docker build --no-cache -t coderpy:3.11 -f Dockerfile .