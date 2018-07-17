FROM debian
RUN apt-get update
RUN apt-get install -y wget 
RUN mkdir /download && wget https://dev.mysql.com/get/mysql-apt-config_0.8.10-1_all.deb -P /download
RUN apt-get install -y lsb-release gnupg
RUN apt-get install -y gnupg
RUN dpkg -i /download/mysql-apt-config_0.8.10-1_all.deb

RUN apt-get update
RUN apt-get install -y mysql-apt-config
RUN apt-get install -y mysql-shell

COPY docker-entrypoint.sh /entrypoint.sh
RUN chmod 777 /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]

CMD ["mysqlsh"]
