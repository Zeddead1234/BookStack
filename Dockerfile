FROM solidnerd/bookstack:latest

WORKDIR /var/www/bookstack

COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD
