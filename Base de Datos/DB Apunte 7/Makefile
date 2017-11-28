.phony: clean

CLIENT = psql
FLAGS = -c

all: deploy 

deploy: comercio.sql
	$(CLIENT) $(FLAGS) "DROP DATABASE IF EXISTS comercio" postgres
	$(CLIENT) $(FLAGS) "CREATE DATABASE comercio" postgres
	$(CLIENT) comercio < comercio.sql

comercio.sql: \
	configuration.sql \
	customer/customer_adt.sql \
	provider/provider_adt.sql 
	
	touch comercio.sql
	cat configuration.sql >> comercio.sql
	cat customer/customer_adt.sql >> comercio.sql
	cat provider/provider_adt.sql >> comercio.sql

clean:
	$(RM) comercio.sql
