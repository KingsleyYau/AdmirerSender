# Copyright (C) 2015 The QpidNetwork
# AdmirerSender Makefile
#
# Created on: 2015/11/2
# Author: Max.Chiu
# Email: Kingsleyyau@gmail.com
#

export MAKE	:=	make

release=0
ifeq ($(release), 1)
CXXFLAGS = -O3 
else
CXXFLAGS = -O2 -g
endif

CXXFLAGS +=	-Wall -fmessage-length=0
CXXFLAGS +=	-I. -Ilibev -I/usr/include/mysql

LIBS =		-L. \
			-Wl,-Bstatic -Llibev/.libs -lev \
			-Wl,-Bdynamic -L/usr/lib64/mysql -L/usr/lib/mysql -lmysqlclient \
			-Wl,-Bdynamic -ldl -lz -lpthread 
			
OBJS =		server.o KThread.o LogManager.o LogFile.o ConfFile.o Arithmetic.o  md5.o \
			TcpServer.o MessageList.o DataParser.o DataHttpParser.o DBSpool.o DBManager.o \
			AdmirerSender.o LadyDBLetterSender.o
JSONOBJS = 	json_reader.o json_value.o json_writer.o
OBJS += 	$(JSONOBJS)
TARGET =	admirersender

DEPDIRS	:= libev
CLEAN_DEPS := $(addprefix _clean_, $(DEPDIRS))

.PHONY: all deps clean cleanall install $(DEPDIRS) $(TARGET)

$(TARGET):	deps $(OBJS)
	$(CXX) -o $(TARGET) $(OBJS) $(LIBS)
	@echo '################################################################'
	@echo ''
	@echo '# Bulid matchserver completed!'
	@echo ''
	@echo '################################################################'

$(DEPDIRS):
	$(MAKE) -C $@
	
$(CLEAN_DEPS):	
	$(MAKE) -C $(patsubst _clean_%, %, $@) clean
	
deps:	$(DEPDIRS)
	@echo '################################################################'
	@echo ''
	@echo '# Bulid deps completed!'
	@echo ''
	@echo '################################################################'
	
all:	deps $(TARGET)
	
clean:
	rm -f $(OBJS) $(TARGET)

cleanall: clean	$(CLEAN_DEPS) 
	@echo '################################################################'
	@echo ''
	@echo '# Clean all finished!'
	@echo ''
	@echo '################################################################'
	
install: 
	copy admirersender.config /etc/ -rf
	copy admirersender /usr/local/bin
	chmod +x /usr/local/bin/admirersender
	@echo '################################################################'
	@echo ''
	@echo '# Install admirersender finished!'
	@echo ''
	@echo '################################################################'
