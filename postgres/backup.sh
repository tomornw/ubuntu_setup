pg_dump -h localhost -p 5432 -U postgres -d esan_20181217 -v "/home/itfiledata/ftp/ESANIRON_20200703.backup"
pg_restore -h localhost -p 5432 -U postgres -d esan_20181217 -v "/home/itfiledata/ftp/ESANIRON_20200703.backup"
