exeName=malPlSrv
cppDir=./cpp
files=main
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

clean:
	rm $(exeName) $(exeName)-debug $(objs) $(dbgObjs)
