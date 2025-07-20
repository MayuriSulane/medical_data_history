FROM mysql:latest

# COPY queries.sql /queries.sql

# CMD ["sh","-c","mysql -h $MYSQL_HOST -u $MYSQL_USER -p$MYSQL_PASSWORD $MYSQL_DATABASE < /queries.sql"]
CMD ["sh","-c","mysql -h $MYSQL_HOST -u $MYSQL_USER -p$MYSQL_PASSWORD $MYSQL_DATABASE "]
