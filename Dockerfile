FROM voxxit/base:alpine

#RUN addgroup -S vault && adduser -S -g vault vault

RUN  wget https://releases.hashicorp.com/vault/0.11.4/vault_0.11.4_linux_amd64.zip  \
  && unzip vault_0.11.4_linux_amd64.zip \
  && mv vault /usr/local/bin/ \
  && rm -f vault_0.11.4_linux_amd64.zip

#COPY entrypoint.sh /entrypoint.sh

COPY config.hcl.example /tmp/config.hcl

EXPOSE 8200

ENTRYPOINT ["vault"]
CMD [ "server", "-config=/tmp/config.hcl" ]
