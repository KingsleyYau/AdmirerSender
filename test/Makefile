# Copyright (C) 2015 The CamShareMiddleware
# php_tester Makefile
#
# Created on: 2015/10/10
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

CXXFLAGS +=	-Wall -fmessage-length=0 -Wunused-variable -Wno-write-strings -Wno-narrowing -Wno-unused-variable
CXXFLAGS +=	-I. -I../ -I../libev

LIBS =		-L. \
			-Wl,-Bdynamic -ldl -lz -lpthread 

COMMON  	=
				
OBJS	+= $(COMMON)
OBJS	+= php_tester.o ../PhpObject.o

TARGET =	php-tester

.PHONY: clean $(TARGET)

$(TARGET):	$(OBJS)
	$(CXX) -o $(TARGET) $(OBJS) $(LIBS)
	@echo '################################################################'
	@echo ''
	@echo '# Bulid php-tester completed!'
	@echo ''
	@echo '################################################################'

all:	$(TARGET)

clean:
	rm -f $(OBJS) $(TARGET)