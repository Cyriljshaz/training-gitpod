FROM gitpod/workspace-full:latest
#FROM ligolang/ligo:0.15.0

# Install ligo

# RUN export RUNLEVEL=1

#RUN wget 'https://gitlab.com/ligolang/ligo/-/jobs/artifacts/dev/download?job=docker_extract' -O ligo.zip && unzip ligo.zip ligo.deb
#RUN sudo dpkg -i ligo.deb
#RUN sudo rm ./ligo.zip ligo.deb

FROM ligolang/ligo:0.40.0 as ligo
FROM gitpod/workspace-full:latest

RUN npm i -g @esy-nightly/esy
COPY --from=ligo /root/ligo /usr/local/bin/ligo


# Install tezos-client

RUN sudo add-apt-repository ppa:serokell/tezos && sudo apt-get update
RUN sudo touch /.containerenv
RUN sudo apt-get install -y apt-transport-https tezos-client

# Install completium-cli

RUN npm i '@completium/completium-cli@0.4.12' -g
RUN completium-cli init
RUN completium-cli mockup init

# Download NL's Michelson vs-studio plugin
RUN sudo wget -q http://france-ioi.org/extension.vsix -O /home/.2HzpexT7tKMixL.vsix
#RUN code --install-extension /tmp/.2HzpexT7tKMixL.vsix
