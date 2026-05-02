FROM nousresearch/hermes-agent:latest

COPY entrypoint.sh /opt/hermes/railway-entrypoint.sh
RUN chmod +x /opt/hermes/railway-entrypoint.sh

ENTRYPOINT ["/usr/bin/tini", "-g", "--", "/opt/hermes/railway-entrypoint.sh"]
