.phony: clean

CLIENT = psql
FLAGS = -c

all: deploy 

deploy: prueba11.sql
	$(CLIENT) $(FLAGS) "DROP DATABASE IF EXISTS prueba11" postgres
	$(CLIENT) $(FLAGS) "CREATE DATABASE prueba11" postgres
	$(CLIENT) prueba11 < configuration.sql
	$(CLIENT) prueba11 < 1_adt.sql
	$(CLIENT) prueba11 < 2_adt.sql
	
prueba11.sql: \
	configuration.sql \
	1_adt.sql \
	2_adt.sql 
	
	touch prueba11.sql
	cat configuration.sql >> prueba11.sql
	cat 1_adt.sql >> prueba11.sql
	cat 2_adt.sql >> prueba11.sql
	
clean:
	$(RM) prueba11.sql
