cppDir=./cpp
objDir=./obj
compiler=g++-9
exeName=malRegTests
files=main
dbgDynObjs=$(addprefix $(objDir)/debug/dynamic/,$(addsuffix .o,$(files)))
libDirs=$(addprefix -L/usr/local/lib/,boost icu)
dbgLibs=$(addprefix -l,boost_regex-mt-d-x64) $(shell icu-config --ldflags-libsonly)
objCompOpts=$(shell icu-config --cppflags)
sharedCompOpts=$(addprefix -W,all error)

$(exeName)-debug-dynamic: $(dbgDynObjs)
	$(compiler) -o $@ $^ $(libDirs) $(dbgLibs) $(sharedCompOpts)

$(objDir)/debug/dynamic/%.o: $(cppDir)/%.cpp
	$(compiler) -o $@ -c $^ $(objCompOpts) $(sharedCompOpts)

rebuild_debug_dynamic: clean_debug_dynamic $(exeName)-debug-dynamic

clean_debug_dynamic:
	rm -f $(exeName)-debug-dynamic
	find $(objDir)/debug/dynamic -type f -delete
