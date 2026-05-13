FROM nousresearch/hermes-agent:latest

# Auto-update Hermes on startup (can be disabled with HERMES_AUTO_UPDATE=0)
ENV HERMES_AUTO_UPDATE=1

COPY start.sh /opt/hermes/railway-start.sh
RUN chmod +x /opt/hermes/railway-start.sh

ENTRYPOINT ["/usr/bin/tini", "-g", "--", "/opt/hermes/docker/entrypoint.sh"]
CMD ["/opt/hermes/railway-start.sh"]
