FROM n8nio/n8n:1.18.1

USER root
ADD https://s3.amazonaws.com/rds-downloads/rds-combined-ca-bundle.pem /tmp/rds-ca/aws-rds-ca-bundle.pem
WORKDIR /home/node/packages/cli
ENTRYPOINT []

COPY ./entrypoint.sh /
RUN chmod +x /entrypoint.sh
CMD ["/entrypoint.sh"]
