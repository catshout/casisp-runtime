FROM openjdk:11-jre

# Set karaf environment variables
ENV KARAF_INSTALL_PATH /opt
ENV KARAF_HOME $KARAF_INSTALL_PATH/apache-karaf
ENV PATH $PATH:$KARAF_HOME/bin

# Copy and untar the karaf distribution
COPY *.tgz* /tmp/
RUN cat /tmp/*.tgz* | tar xzf - --directory $KARAF_INSTALL_PATH && \
    rm /tmp/*.tgz*

# Install build dependencies and karaf
RUN set -x && \
  ln -s $KARAF_INSTALL_PATH/apache-karaf* $KARAF_HOME

# Create casisp user
RUN groupadd --gid 2000 casisp && \
    useradd --uid 2000 --create-home --home-dir /var/casisp --gid casisp casisp

# Set user permissions
RUN mkdir -p /var/casisp/files && \
    mkdir /opt/apache-karaf/templates && \
    chown -R casisp:casisp /var/casisp && \
    chown -R casisp:casisp /opt/apache-karaf*

EXPOSE 8101 1099 44444 8181 8443
USER casisp
CMD ["karaf", "run"]
