MEX=mex
CXX?=g++
CC?=gcc
CFLAGS=-Wall -Wconversion -O3 -fPIC
MEX_OPTION=-largeArrayDims CXX\#$(CXX) CXXFLAGS\#"$(CFLAGS)"
MEX_EXT=$(shell mexext)

%.$(MEX_EXT): %.cpp
	$(MEX) $(MEX_OPTION) $^

clean:
	rm -f *.$(MEX_EXT)
