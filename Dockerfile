FROM solidnerd/bookstack:latest

# Set working directory to BookStack dir
WORKDIR /var/www/bookstack

# Fix Apache DocumentRoot to serve BookStack correctly
ENV APACHE_DOCUMENT_ROOT=/var/www/bookstack/public

# Apply DocumentRoot fix to Apache config
RUN sed -ri -e 's!/var/www/localhost/htdocs!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf
RUN sed -ri -e 's!/var/www/localhost/htdocs!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf

# Copy your custom entrypoint (if needed)
COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["apache2-foreground"]
