#-------------------------------------------------------------------------------------------------------------
# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License. See https://go.microsoft.com/fwlink/?linkid=2090316 for license information.
#-------------------------------------------------------------------------------------------------------------

# To fully customize the contents of this image, use the following Dockerfile instead:
# https://github.com/microsoft/vscode-dev-containers/tree/v0.128.0/containers/codespaces-linux/.devcontainer/Dockerfile
FROM mcr.microsoft.com/vscode/devcontainers/universal:1-linux

# ** [Optional] Uncomment this section to install additional packages. **
#
USER root
RUN apt-get update --fix-missing -qy \
    && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -qy install --no-install-recommends curl wget zip unzip pv file git


# install cfnflip for yaml/json magic
RUN apt-get install -qy python-pip python-dev build-essential && apt-get install -qy python3-pip python3-dev build-essential python3-setuptools \
    && pip3 install cfn_flip


# custom tools & bootstrapping
ADD init.ps1 .

### The following would require explicit sudo if you want to run command this way. Otherwise it's all now under codespace user

USER codespace
RUN echo ">>> Running init.ps1 <<<" && sudo chmod +x ./init.ps1 && sudo pwsh -nologo -noprofile -c '$ProgressPreference = "Ignore"; &./init.ps1'

RUN bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)" \
    && echo 'eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)' >> /home/codespace/.profile \
    && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)


ENV PATH "$PATH:/home/linuxbrew/.linuxbrew/bin"

RUN export PATH="$PATH:/home/linuxbrew/.linuxbrew/bin/brew" \
    && /home/linuxbrew/.linuxbrew/bin/brew install tfenv \
    && /home/linuxbrew/.linuxbrew/bin/brew install git-town

ENV SHELL=/opt/microsoft/powershell/7/pwsh
