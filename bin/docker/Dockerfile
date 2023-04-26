FROM apache/karaf:4.4.2

# Create casisp user
RUN groupadd --gid 2000 casisp && \
    useradd --uid 2000 --home-dir /var/casisp --gid casisp casisp

# Set user permissions
RUN chown -R casisp:casisp /opt/apache-karaf*

# Set user
USER casisp

# Start command
CMD ["karaf","run"]
