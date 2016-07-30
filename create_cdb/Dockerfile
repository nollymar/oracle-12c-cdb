FROM oracle-12c:installed
MAINTAINER Nollymar Longa <nollymar@gmail.com>

RUN rm -rf /tmp/install

RUN cp /u01/app/oracle/product/12.1.0/dbhome_1/javavm/jdk/jdk6/lib/libjavavm12.a /u01/app/oracle/product/12.1.0/dbhome_1/lib/

ENV ORACLE_SID ORCL
ENV ORACLE_HOME $ORACLE_BASE/product/12.1.0/dbhome_1
ENV PATH $ORACLE_HOME/bin:$PATH

RUN $ORACLE_HOME/root.sh

RUN mkdir -p $ORACLE_BASE/oradata && chown -R oracle:oinstall $ORACLE_BASE/oradata && chmod -R 775 $ORACLE_BASE/oradata
RUN mkdir -p $ORACLE_BASE/fast_recovery_area && chown -R oracle:oinstall $ORACLE_BASE/fast_recovery_area && chmod -R 775 $ORACLE_BASE/fast_recovery_area

RUN yum -y install perl
RUN mv $ORACLE_HOME/perl/bin/perl $ORACLE_HOME/perl/bin/perl.bck

RUN yum install perl-TermReadKey -y

RUN mkdir -p /home/oracle && chown -R oracle:oinstall /home/oracle && chmod -R 775 /home/oracle
RUN mkdir -p /home/oracle/data && chown -R oracle:oinstall /home/oracle/data && chmod -R 775 /home/oracle/data
RUN mkdir -p /home/oracle/data/orcl && chown -R oracle:oinstall /home/oracle/data/orcl && chmod -R 775 /home/oracle/data/orcl
RUN mkdir -p /home/oracle/data/orcl/pdbseed && chown -R oracle:oinstall /home/oracle/data/orcl/pdbseed && chmod -R 775 /home/oracle/data/orcl/pdbseed

ADD initORCL.ora $ORACLE_HOME/dbs/initORCL.ora
ADD createdb.sql $ORACLE_HOME/config/scripts/createdb.sql
ADD conf_finish.sql $ORACLE_HOME/config/scripts/conf_finish.sql
ADD create /tmp/create

ADD create_pdb.sql $ORACLE_HOME/config/scripts/create_pdb.sql
ADD create_pdb /tmp/create_pdb