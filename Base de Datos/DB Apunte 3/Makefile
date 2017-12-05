.phony: clean

CLIENT = psql
FLAGS = -c
JC = javac
J = java
JFLAGS = -cp
CLASSPATH = postgresql-42.1.4.jar


all: deploy 
	
deploy: persona.sql \
	jdbcExample.class
	$(CLIENT) $(FLAGS) "DROP DATABASE IF EXISTS prueba" postgres
	$(CLIENT) $(FLAGS) "CREATE DATABASE prueba" postgres
	$(CLIENT) prueba < persona.sql
	$(J) $(JFLAGS) .:./$(CLASSPATH) jdbcExample
	
jdbcExample.class: jdbcExample.java
	$(JC) $(JFLAGS) $(CLASSPATH) jdbcExample.java

clean:
	$(RM) jdbcExample.class
