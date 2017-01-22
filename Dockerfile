FROM ubuntu

MAINTAINER James Campbell <james@jamescampbell.us>

RUN     export DEBIAN_FRONTEND=noninteractive && \
        apt-get -y update && \
        apt-get install -yq git build-essential libssl-dev openssl

RUN	(cd /tmp && git clone https://github.com/ReclaimYourPrivacy/eschalot.git)

RUN	mkdir /usr/lib/eschalot

RUN	(cd /tmp/eschalot && make clean && make && cp eschalot /usr/bin && cp worgen /usr/bin && cp *.txt /usr/lib/eschalot)

RUN apt-get update && apt-get install -y openssh-server
RUN mkdir /var/run/sshd
RUN echo 'root:changeme' | chpasswd
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd
ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile
EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
RUN	apt-get -y remove --purge git build-essential
RUN 	apt-get -y autoremove --purge

RUN	apt-get -y clean

#RUN     touch /tmp/results

#COPY eschalot.sh /
#RUN chmod +x ./eschalot.sh

#VOLUME	["/tmp/results"]

#ENTRYPOINT	["./eschalot.sh"]
