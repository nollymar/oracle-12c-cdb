CREATE PLUGGABLE DATABASE orcl_pdb ADMIN USER pdb_user IDENTIFIED BY oracle
FILE_NAME_CONVERT=('/home/oracle/data/orcl/pdbseed/','/home/oracle/data/orcl/orcl_pdb/');

alter pluggable database orcl_pdb open;

select name,open_mode from v$pdbs;

exit;