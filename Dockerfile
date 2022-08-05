FROM ubuntu:20.04

# Set Label
LABEL "info"="ElasticSearch node"
LABEL "node"="${EL_NODE}"

# Add user and group for security reasons
RUN groupadd elastic --system --gid 8877
RUN adduser elastic --system --uid 8877 --gid 8877

USER elastic

# Copy ElasticSearch App
COPY --chown=elastic:elastic elasticsearch-8.3.2/ /opt/elastic

# Set up workdir
WORKDIR /opt/elastic

# Run initial command
ENTRYPOINT ["bash", "-c"]
CMD ["/opt/elastic/bin/elasticsearch"]
