#Base Image Name
FROM	centos:7
#Author
MAINTAINER	giriraj_789@hotmail.com
RUN	yum install openssh* -y && \
	yum clean all && \
	echo 'root:password' | chpasswd && \
	sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
	sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd
#Network Port for communication
EXPOSE	22
#Executing ssh server
CMD     ["/usr/bin/sshd", "-D"]
