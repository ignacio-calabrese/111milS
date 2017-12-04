.phony: clean

CLIENT = psql
FLAGS = -c

all: deploy 

deploy: banco.sql \
	functions.sql \
	getters.sql
	$(CLIENT) $(FLAGS) "DROP DATABASE IF EXISTS banco" postgres
	$(CLIENT) $(FLAGS) "CREATE DATABASE banco" postgres
	$(CLIENT) banco < banco.sql
	$(CLIENT) banco < functions.sql
	$(CLIENT) banco < getters.sql
	
banco.sql: \
	configuration.sql \
	customer/person_adt.sql \
	customer/contact_information_adt.sql \
	customer/physical_person_adt.sql \
	customer/legal_person_adt.sql \
	accounting/account_adt.sql \
	accounting/movement_adt.sql
	
	touch banco.sql
	cat configuration.sql >> banco.sql
	cat customer/person_adt.sql >> banco.sql
	cat customer/contact_information_adt.sql >> banco.sql
	cat customer/physical_person_adt.sql >> banco.sql
	cat customer/legal_person_adt.sql >> banco.sql
	cat accounting/account_adt.sql >> banco.sql
	cat accounting/movement_adt.sql >> banco.sql

functions.sql: \
	functions/f1_physical_person_adt.sql \
	functions/f2_physical_person_adt.sql \
	functions/f3_customer_person_adt.sql \
	functions/f4_customer_person_adt.sql \
	functions/f5_customer_physical_person_adt.sql \
	functions/f6_customer_contact_information_adt.sql \
	functions/f7_customer_legal_person_adt.sql \
	functions/f8_accounting_account_adt.sql
	
	touch functions.sql
	cat functions/f1_physical_person_adt.sql >> functions.sql
	cat functions/f2_physical_person_adt.sql >> functions.sql
	cat functions/f3_customer_person_adt.sql >> functions.sql
	cat functions/f4_customer_person_adt.sql >> functions.sql
	cat functions/f5_customer_physical_person_adt.sql >> functions.sql
	cat functions/f6_customer_contact_information_adt.sql >> functions.sql
	cat functions/f7_customer_legal_person_adt.sql >> functions.sql
	cat functions/f8_accounting_account_adt.sql >> functions.sql
	

getters.sql: \
	getters/g1_customer_physical_person_identify_by_dni_adt.sql \
	getters/g2_customer_physical_person_identify_by_cuit_adt.sql \
	getters/g3_customer_physical_person_lookup_adt.sql \
	getters/g4_customer_physical_person_lookup_adt.sql
	
	touch getters.sql
	cat getters/g1_customer_physical_person_identify_by_dni_adt.sql >> getters.sql
	cat getters/g2_customer_physical_person_identify_by_cuit_adt.sql >> getters.sql
	cat getters/g3_customer_physical_person_lookup_adt.sql >> getters.sql
	cat getters/g4_customer_physical_person_lookup_adt.sql >> getters.sql
	
clean:
	$(RM) banco.sql functions.sql getters.sql
