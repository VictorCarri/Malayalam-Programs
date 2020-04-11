exeName=malPlSrv
cppDir=./cpp
files=IoContextPool ReqHandler ReqParser Connection Server main
#files=IoContextPool Server main
compiler=g++-8
objDir=./obj
objs=$(addprefix $(objDir)/,$(addsuffix .prod.o,$(files)))
dbgObjs=$(addprefix $(objDir)/,$(addsuffix .debug.o,$(files)))
libDirs=$(addprefix -L,/usr/local/lib/boost)
libs=$(addprefix -l,boost_program_options-mt-x64 boost_thread-mt-x64 pthread)
dbgLibs=$(addprefix -l,boost_program_options-mt-d-x64 boost_thread-mt-d-x64 pthread)
dbgOpts=-DDEBUG
hdrDir=./hpp
compOpts=-I$(hdrDir)

all: $(exeName) $(exeName)-debug

$(exeName): $(objs)
	$(compiler) -o $@ $^ $(libDirs) $(libs)

$(exeName)-debug: $(dbgObjs)
	$(compiler) -o $@ $^ $(libDirs) $(dbgLibs)

#$(objDir)/main.o: $(cppDir)/main.cpp
#	$(compiler) -o $@ -c $^ $(compOpts)
#
#$(objDir)/main.debug.o: $(cppDir)/main.cpp
#	$(compiler) -o $@ -c $^ $(dbgOpts) $(compOpts)
#
#$(objDir)/Server.o: $(cppDir)/Server.cpp
#	$(compiler) -o $@ -c $^ $(compOpts)
#
#$(objDir)/Server.debug.o: $(cppDir)/Server.cpp
#	$(compiler) -o $@ -c $^ $(dbgOpts) $(compOpts)
#
#$(objDir)/IoContextPool.o: $(cppDir)/IoContextPool.cpp
#	$(compiler) -o $@ -c $^ $(compOpts)
#
#$(objDir)/IoContextPool.debug.o: $(cppDir)/IoContextPool.cpp
#	$(compiler) -o $@ -c $^ $(dbgOpts) $(compOpts)
#
#$(objDir)/Connection.o: $(cppDir)/Connection.cpp
#	$(compiler) -o $@ -c $^ $(compOpts)
#
#$(objDir)/Connection.debug.o: $(cppDir)/Connection.cpp
#	$(compiler) -o $@ -c $^ $(dbgOpts) $(compOpts)
#
#$(objDir)/ReqHandler.o: $(cppDir)/ReqHandler.cpp
#	$(compiler) -o $@ -c $^ $(compOpts)
#
#$(objDir)/ReqHandler.debug.o: $(cppDir)/ReqHandler.cpp
#	$(compiler) -o $@ -c $^ $(dbgOpts) $(compOpts)

$(objDir)/%.debug.o: $(cppDir)/%.cpp
	$(compiler) -o $@ -c $^ $(compOpts) $(dbgOpts)

$(objDir)/%.prod.o: $(cppDir)/%.cpp
	$(compiler) -o $@ -c $^ $(compOpts)

clean:
	rm -f $(exeName)* $(objDir)/*
