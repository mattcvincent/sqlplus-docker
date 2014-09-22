# sqlplus-docker

## Introduction
A Docker container for running SQL*Plus (Instant Client) isolated from the operating system.

## Building
Download the following RPM's from Oracle (http://www.oracle.com/technetwork/topics/linuxx86-64soft-092277.html):
* oracle-instantclient12.1-basic-12.1.0.2.0-1.x86_64.rpm
* oracle-instantclient12.1-sqlplus-12.1.0.2.0-1.x86_64.rpm

Place the RPM's in the same directory as the Dockerfile and run the following command:
`docker build -t ninckblokje/sqlplus-docker:12.1.0 .`

## Running
To run this Docker container execute the following command:
`docker run -v `pwd`:/home/oracle/scripts -i -t ninckblokje/sqlplus-docker:12.1.0 sqlplus @[SCRIPT]`

Example:
`docker run -v `pwd`:/home/oracle/scripts -i -t ninckblokje/sqlplus-docker:12.1.0 sqlplus @example`
