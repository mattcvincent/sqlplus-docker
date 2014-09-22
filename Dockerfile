# Copyright (c) 2014, ninckblokje
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#
# * Redistributions of source code must retain the above copyright notice, this
#   list of conditions and the following disclaimer.
#
# * Redistributions in binary form must reproduce the above copyright notice,
#   this list of conditions and the following disclaimer in the documentation
#   and/or other materials provided with the distribution.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
# DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
# FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
# DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
# SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
# CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
# OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
# OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

FROM centos:centos6

MAINTAINER ninckblokje

RUN groupadd dba
RUN useradd -d /home/oracle -g dba -m -s /bin/bash oracle

ADD oracle-instantclient12.1-basic-12.1.0.2.0-1.x86_64.rpm /tmp/oracle-instantclient12.1-basic-12.1.0.2.0-1.x86_64.rpm
ADD oracle-instantclient12.1-sqlplus-12.1.0.2.0-1.x86_64.rpm /tmp/oracle-instantclient12.1-sqlplus-12.1.0.2.0-1.x86_64.rpm

RUN yum install -y libaio

RUN rpm -ivh /tmp/oracle-instantclient12.1-basic-12.1.0.2.0-1.x86_64.rpm
RUN rpm -ivh /tmp/oracle-instantclient12.1-sqlplus-12.1.0.2.0-1.x86_64.rpm

RUN mkdir /home/oracle/scripts

USER oracle

ENV LD_LIBRARY_PATH /usr/lib/oracle/12.1/client64/lib
ENV ORACLE_HOME /usr/lib/oracle/12.1/client64
ENV PATH $ORACLE_HOME/bin:$PATH

CMD cd /home/oracle/scripts
