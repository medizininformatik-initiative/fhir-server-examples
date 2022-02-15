start-all:
	make -C hapi start 
	make -C vonk start 
	make -C ibm start 
	make -C blaze start 
stop-all:
	make -C hapi stop 
	make -C vonk stop 
	make -C ibm stop 
	make -C blaze stop 

count-all: 
	make -sC hapi count | jq 
	make -sC vonk count | jq
	make -sC ibm count | jq
	make -sC blaze count | jq
