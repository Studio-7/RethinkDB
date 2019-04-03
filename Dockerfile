# TODO - Use debian
FROM debian

RUN apt-get update -y
RUN apt-get install wget -y
RUN apt-get install libcurl3 -y
RUN wget https://github.com/srh/rethinkdb/releases/download/v2.3.6.srh.1/rethinkdb_2.3.6.srh.1.0stretch_amd64.deb
RUN apt-get install libprotobuf-dev -y
RUN apt-get install procps -y

RUN dpkg -i rethinkdb_2.3.6.srh.1.0stretch_amd64.deb

VOLUME ["/data"]
WORKDIR /data

EXPOSE 29015
EXPOSE 28015
EXPOSE 8080
CMD ["rethinkdb", "--config-file", "./default.conf"]