objDir=./obj
files=ReqHandler
cppDir=./cpp
compiler=g++-8
exeName=reqHandlerTest
files=main

dbgStatObjs=$(addprefix $(objDir)/dbg/stat/,$(addsuffix .o,$(files)))
dbgDynObjs=$(addprefix $(objDir)/dbg/dyn/,$(addsuffix .o,$(files)))
prodDynObjs=$(addprefix $(objDir)/prod/dyn/,$(addsuffix .o,$(files)))
prodStatObjs=$(addprefix $(objDir)/prod/stat/,$(addsuffix .o,$(files)))

compOpts=-std=gnu++17 $(addprefix -O,3 s) -save-temps $(shell mariadb_config --cflags) -I./hpp

libDirs=$(addprefix -L,$(addprefix /usr/local/lib/,boost icu) $(addprefix /home/victor/lib/,mpp vuu)) $(shell mariadb_config --libs)

dbgOpts=-DDEBUG $(addprefix -g,gdb3 gnu-pubnames variable-location-views inline-points) -Og -fvar-tracking-assignments

icuLibs=$(addprefix icu,data i18n io test tu uc) dl
commonLibs=$(addprefix -l,$(icuLibs) pthread mariadbclientpp) $(shell mariadb_config --libs_sys)
dbgBoostLibs=$(addprefix boost_,$(addsuffix -mt-d-x64,locale regex program_options filesystem system))
prodBoostLibs=$(addprefix boost_,$(addsuffix -mt-x64,locale regex program_options filesystem system)) 
dbgLibs=$(addprefix -l,mpp-debug vuu-debug $(dbgBoostLibs)) $(commonLibs)
libs=$(addprefix -l,mpp vuu $(prodBoostLibs)) $(commonLibs)

all: $(addsuffix Exes,dyn stat)

clean: $(addprefix clean_,dbg prod)
	rm -f *.{ii,s}

clean_dbg:
	clear
	find $(objDir)/dbg/stat -type f -delete
	find $(objDir)/dbg/dyn -type f -delete
	rm -f $(exeName)-debug-{static,dynamic}

clean_prod:
	find $(objDir)/prod/stat -type f -delete
	find $(objDir)/prod/dyn -type f -delete
	rm -f $(exeName)-prod-{static,dynamic}

rebuild: clean all

statExes: $(addsuffix -static,$(addprefix $(exeName)-,debug prod))

dynExes: $(addsuffix -dynamic,$(addprefix $(exeName)-,debug prod))

$(exeName)-debug-static: $(dbgStatObjs) /home/victor/lib/mpp/libmpp-debug.a
	$(compiler) -o $@ $^ -static $(libDirs) $(dbgLibs)

$(objDir)/dbg/stat/%.o: $(cppDir)/%.cpp
	$(compiler) -o $@ -static $(compOpts) $(dbgOpts) -c $^

$(exeName)-debug-dynamic: $(dbgDynObjs) /home/victor/lib/mpp/libmpp-debug.so
	$(compiler) -o $@ $^ $(libDirs) $(dbgLibs)

$(objDir)/dbg/dyn/%.o: $(cppDir)/%.cpp
	$(compiler) -o $@ $(compOpts) $(dbgOpts) -c $^ -fPIC

$(exeName)-prod-static: $(prodStatObjs) /home/victor/lib/mpp/libmpp.a
	$(compiler) -o $@ $^ -static $(libDirs) $(libs)

$(objDir)/prod/stat/%.o: $(cppDir)/%.cpp
	$(compiler) -o $@ -static $(compOpts) $(dbgOpts) -c $^

$(exeName)-prod-dynamic: $(prodDynObjs) /home/victor/lib/mpp/libmpp.so
	$(compiler) -o $@ $^ $(libDirs) $(libs)

$(objDir)/prod/dyn/%.o: $(cppDir)/%.cpp
	$(compiler) -o $@ $(compOpts) $(dbgOpts) -c $^ -fPIC
