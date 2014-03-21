MEX = mex
CXX ?= g++
CC ?= gcc

CFLAGS = -fPIC
CXXFLAGS = -fPIC

MEX = mex
MEX_OPTION = CC\#$(CC) CFLAGS\#"$(CFLAGS)" \
						 CXX\#$(CXX) CXXFLAGS\#"$(CXXFLAGS)" \
					   -Wl,--as-needed -O -outdir build
MEX_EXT = $(shell mexext)

CFLAGS_OPENCV=`pkg-config opencv --cflags --libs`

%.$(MEX_EXT): %.cpp
	$(MEX) $(MEX_OPTION) $< $(CFLAGS_OPENCV)

clean:
	rm -f *.$(MEX_EXT)
