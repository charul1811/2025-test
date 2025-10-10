FROM nuxeo:latest

USER root

# Create necessary directories
RUN mkdir -p /var/lib/nuxeo/data \
    && mkdir -p /opt/nuxeo/packages \
    && mkdir -p /etc/nuxeo/conf.d

# Write CLID file only if it doesn't exist
#RUN if [ ! -f /var/lib/nuxeo/data/instance.clid ]; then \
#    printf '%s\n%s\n' \
#    'bc6062de-7121-4cca-8b2b-8204be63cfa8.1760785134.ijGpSxSE3xZzn60uktp67xdkUfBc7gOBctrrVM80Ay/k+9oCHHitMfymE5zBmjHLhI3r5Fsgg/fxgHt3qBhP1HYPtO9dTwcNmcPX69fSLiWAMGA/Kgn7wmWPUy9UEpDDCOMZSvP2TrpStGgSyD20F0nZ4I3CgL/tEPe49y4CSiZzcFjykWDV8NJ6Eev3KI+77NXKJEsjLF6FE2Do4sdZC7pxA9dom4K1cAJUcfRftKtxLI32jJRZReuTbCR788pwLgY70DF49VoQ80wR/cZhiloM0Jgm3qtVkbJazoD1GEkDjFI3qLa6KX9VichBleB+SZxjX+wThNDkpwPvgX3F4g==' \
#    '88597e06-34e5-4476-bc28-af3424babb9e' \
#    > /var/lib/nuxeo/data/instance.clid; \
#fi

# Copy nuxeo.conf to the proper location
COPY nuxeo.conf /etc/nuxeo/nuxeo.conf

# Copy packages
RUN mkdir -p /opt/nuxeo/packages && \
    (shopt -s nullglob && cp -n packages/*.zip /opt/nuxeo/packages/ 2>/dev/null || true)

# Set proper ownership
RUN chown -R 1000:0 /var/lib/nuxeo \
    && chown -R 1000:0 /opt/nuxeo/packages \
    && chown -R 1000:0 /etc/nuxeo


# Switch back to nuxeo user
USER 1000

EXPOSE 8080