FROM solidnerd/bookstack:latest
WORKDIR /var/www/bookstack
COPY docker-entrypoint.sh /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD
