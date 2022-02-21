.PHONY: all upload-all count-all clean

all:
	$(MAKE) -C data
upload-all: 
	make -C data
	bash control.sh upload-all
count-all: 
	bash control.sh count-all

stop-all:
	make -C server stop-all

clean:
	make -C data clean
	make -C server clean
