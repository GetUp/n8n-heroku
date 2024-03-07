FROM n8nio/n8n:1.32.0

USER root

ADD https://s3.amazonaws.com/rds-downloads/rds-combined-ca-bundle.pem /usr/local/share/ca-certificates/rds-combined-ca-bundle.pem

# This command complains about the PEM when it runs, but seems to work anyway
RUN update-ca-certificates

WORKDIR /home/node/packages/cli
ENTRYPOINT []

COPY ./entrypoint.sh /
RUN chmod +x /entrypoint.sh
CMD ["/entrypoint.sh"]
