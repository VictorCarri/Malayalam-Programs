exeName=malPlSrv
cppDir=./cpp
files=Server main
compiler=g++-8
objDir=./obj
objs=$(addprefix $(objDir)/,$(addsuffix .o,$(files)))
dbgObjs=$(addprefix $(objDir)/,$(addsuffix .debug.o,$(files)))
libDirs=$(addprefix -L,/usr/local/lib/boost)
libs=$(addprefix -l,boost_program_options-mt-x64)
dbgLibs=$(addprefix -l,boost_program_options-mt-d-x64)
dbgOpts=-DDEBUG

all: $(exeName) $(exeName)-debug

$(exeName): $(objs)
	$(compiler) -o $@ $^ $(libDirs) $(libs)

$(exeName)-debug: $(dbgObjs)
	$(compiler) -o $@ $^ $(libDirs) $(libs)

$(objDir)/main.o: $(cppDir)/main.cpp
	$(compiler) -o $@ -c $^

$(objDir)/main.debug.o: $(cppDir)/main.cpp
	$(compiler) -o $@ -c $^ $(dbgOpts)

$(objDir)/Server.o: $(cppDir)/Server.cpp
	$(compiler) -o $@ -c $^

$(objDir)/Server.debug.o: $(cppDir)/Server.cpp
	$(compiler) -o $@ -c $^ $(dbgOpts)

$(objDir)/IoContextPool.o: $(cppDir)/IoContextPool.cpp
	$(compiler) -o $@ -c $^

$(objDir)/IoContextPool.debug.o: $(cppDir)/IoContextPool.cpp
	$(compiler) -o $@ -c $^ $(dbgOpts)

clean:
	rm $(exeName) $(exeName)-debug $(objs) $(dbgObjs)
