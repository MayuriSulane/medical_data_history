FROM mysql:latest

CMD ["sh","-c","mysql -h $MYSQL_HOST -u $MYSQL_USER -p $MYSQL_PASSWORD $MYSQL_DATABASE "]
