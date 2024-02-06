FROM registry.access.redhat.com/ubi9/php-81@sha256:965ff8084c1bee1f264f708d060238af411f0a093f027f41e86648c640d47000

ENV WORDPRESS_VERSION="6.4.3"

USER 0

# Add wordpress
ADD https://wordpress.org/wordpress-${WORDPRESS_VERSION}.tar.gz .

# Untar
RUN tar zxf wordpress-${WORDPRESS_VERSION}.tar.gz && \
    chown default:root -R wordpress && \
    mv wordpress/* . && \
    rmdir wordpress && \
    rm -f wordpress-${WORDPRESS_VERSION}

USER default

CMD ["/usr/libexec/s2i/run"]
