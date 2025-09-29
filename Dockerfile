FROM nuxeo:latest

# Set environment variables
ENV NUXEO_DEV_MODE=true
#ENV NUXEO_HOME=/opt/nuxeo/server
ENV NUXEO_CLID="bc6062de-7121-4cca-8b2b-8204be63cfa8.1760785134.ijGpSxSE3xZzn60uktp67xdkUfBc7gOBctrrVM80Ay/k+9oCHHitMfymE5zBmjHLhI3r5Fsgg/fxgHt3qBhP1HYPtO9dTwcNmcPX69fSLiWAMGA/Kgn7wmWPUy9UEpDDCOMZSvP2TrpStGgSyD20F0nZ4I3CgL/tEPe49y4CSiZzcFjykWDV8NJ6Eev3KI+77NXKJEsjLF6FE2Do4sdZC7pxA9dom4K1cAJUcfRftKtxLI32jJRZReuTbCR788pwLgY70DF49VoQ80wR/cZhiloM0Jgm3qtVkbJazoD1GEkDjFI3qLa6KX9VichBleB+SZxjX+wThNDkpwPvgX3F4g==--88597e06-34e5-4476-bc28-af3424babb9e"

# Create necessary directories
USER root
#RUN mkdir -p /tmp/packages /opt/nuxeo/server/nxserver/config

# Copy packages to temporary location
COPY packages/*.zip /tmp/packages/

# Copy custom nuxeo.conf
#COPY nuxeo.conf /opt/nuxeo/server/bin/nuxeo.conf

# Copy any additional configuration files
#COPY config/ /opt/nuxeo/server/nxserver/config/

# Switch back to nuxeo user
USER 1000

# Install packages
#RUN for package in /tmp/packages/*.zip; do \
#    if [ -f "$package" ]; then \
#        echo "Installing package: $package"; \
#        /opt/nuxeo/server/bin/nuxeoctl mp-install "$package" --accept=yes; \
#    fi; \
#done

# Clean up temporary files
USER root
#RUN rm -rf /tmp/packages
USER 1000

# Expose port
EXPOSE 8091

# Start Nuxeo
#CMD ["/opt/nuxeo/server/bin/nuxeoctl", "console"]
RUN echo "org.nuxeo.dev=true" >> /opt/nuxeo/server/bin/nuxeo.conf
RUN echo "org.nuxeo.rest.stack.enable=true" >> /opt/nuxeo/server/bin/nuxeo.conf
RUN echo "nuxeo.server.sdkInstallReloadTimer=true" >> /opt/nuxeo/server/bin/nuxeo.conf
RUN echo "nuxeo.server.sdk=true" >> /opt/nuxeo/server/bin/nuxeo.conf
