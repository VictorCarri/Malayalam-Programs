exeName=malPlSrv
cppDir=./cpp
files=IoContextPool Connection Server main
compiler=g++-8
objDir=./obj
dbgStatObjs=$(addprefix $(objDir)/debug/static/,$(addsuffix .o,$(files)))
dbgDynObjs=$(addprefix $(objDir)/debug/dynamic/,$(addsuffix .o,$(files)))
prodDynObjs=$(addprefix $(objDir)/production/dynamic/,$(addsuffix .o,$(files)))
prodStatObjs=$(addprefix $(objDir)/production/static/,$(addsuffix .o,$(files)))
libDirs=$(addprefix -L,/usr/local/lib/boost /home/victor/lib)
dbgLibs=$(addprefix -l,mpp-debug vuu-debug boost_program_options-mt-d-x64 boost_thread-mt-d-x64 pthread)
prodLibs=$(addprefix -l,mpp vuu boost_program_options-mt-x64 boost_thread-mt-x64 pthread)
dbgOpts=-DDEBUG $(addprefix -g,gdb3 gnu-pubnames variable-location-views inline-points) -Og -fvar-tracking-assignments -save-temps
hdrDir=./hpp
compOpts=$(addprefix -I,$(hdrDir) /home/victor/include)

all: $(addsuffix -dynamic, $(exeName)-debug $(exeName)-production) $(addsuffix -static,$(exeName)-debug $(exeName)-production)

$(exeName)-production-dynamic: $(prodDynObjs)
	$(compiler) -o $@ $^ $(libDirs) $(prodLibs)

$(exeName)-production-static: $(prodStatObjs)
	$(compiler) -o $@ $^ -static $(libDirs) $(prodLibs)

$(exeName)-debug-static: $(dbgStatObjs)
	$(compiler) -o $@ $^ -static $(libDirs) $(dbgLibs)

$(exeName)-debug-dynamic: $(dbgDynObjs)
	$(compiler) -o $@ $^ $(libDirs) $(dbgLibs)

$(objDir)/debug/static/%.o: $(cppDir)/%.cpp
	$(compiler) -o $@ -c $^ -static $(compOpts) $(dbgOpts)

$(objDir)/debug/dynamic/%.o: $(cppDir)/%.cpp
	$(compiler) -o $@ -c $^ -fPIC $(compOpts) $(dbgOpts)

$(objDir)/production/dynamic/%.o: $(cppDir)/%.cpp
	$(compiler) -o $@ -c $^ -fPIC $(compOpts) $(dbgOpts)

$(objDir)/production/static/%.o: $(cppDir)/%.cpp
	$(compiler) -o $@ -c $^ -static $(compOpts) $(dbgOpts)

clean: $(addprefix clean_,debug production)

clean_debug: $(addprefix clean_debug_,static dynamic)

clean_production: $(addprefix clean_production_,static dynamic)

clean_debug_static:
	rm -f $(objDir)/debug/static/*

clean_debug_dynamic:
	rm -f $(objDir)/debug/dynamic/*

clean_production_static:
	rm -f $(objDir)/production/static/*

clean_production_dynamic:
	rm -f $(objDir)/production/dynamic/*

rebuild: clean all
