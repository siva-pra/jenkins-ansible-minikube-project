FROM ubuntu:latest
RUN sudo apt update
RUN sudo apt install -y httpd\
zip\
unzip
ADD https://www.free-css.com/assets/files/free-css-templates/download/page254/photogenic.zip /var/www/html/
RUN unzip photogenic.zip
RUN cp -rvf photogenic/* .
RUN rm -rf photogenic photogenic.zip
ENTRYPOINT ["/usr/sbin/apache2", "-k", "start"]
EXPOSE 80