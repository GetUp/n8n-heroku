FROM n8nio/n8n:1.76.1

# Can't use the standard update-ca-certificates approach here since
# the RDS CA certs file contains the complete chain of certs, and
# that utility works only with files containing single certificates.
#
# It is likely easiest to include RDS CA certs globally by setting
# NODE_EXTRA_CA_CERTS to the dest path below:

ADD 20250127-RDS-global-bundle.pem /usr/local/share/ca-certificates/global-bundle.pem

USER root

WORKDIR /home/node/packages/cli
ENTRYPOINT []

COPY ./entrypoint.sh /
RUN chmod +x /entrypoint.sh
CMD ["/entrypoint.sh"]
