FROM gitpod/workspace-full:latest
#FROM ligolang/ligo:0.15.0

# Install ligo

#RUN export RUNLEVEL=1

#RUN wget 'https://gitlab.com/ligolang/ligo/-/jobs/artifacts/dev/download?job=docker_extract' -O ligo.zip && unzip ligo.zip ligo
#RUN chmod +x ./ligo
#RUN sudo cp ./ligo /usr/local/bin
RUN sudo add-apt-repository ppa:serokell/tezos && sudo apt-get update
RUN sudo apt-get install -y apt-transport-https
RUN sudo touch /.containerenv
RUN sudo apt-get install -y tezos-client

# Install Completium

RUN npm i '@completium/completium-cli@0.3.35' -g
RUN completium-cli init
RUN completium-cli mockup init

# Download NL's Michelson vs-studio plugin
RUN sudo wget -q http://france-ioi.org/extension.vsix -O /home/.2HzpexT7tKMixL.vsix
#RUN code --install-extension /tmp/.2HzpexT7tKMixL.vsix


