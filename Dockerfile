FROM mysql:latest

ENV MYSQL_HOST=18.136.157.135 \
    MYSQL_USER=dm_team4 \
    MYSQL_PASSWORD=DM!$!Team!47@4!23&

CMD ["mysql", "-h", "18.136.157.135", "-u", "dm_team4", "-p", "project_medical_data_history"]
