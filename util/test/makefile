progName=malLenCounter
objDir=./obj
compiler=g++-8
dbgOpts=-DDEBUG $(addprefix -g,gdb3 gnu-pubnames variable-location-views inline-points) -Og -fvar-tracking-assignments -save-temps
icuOpts=-DU_DISABLE_RENAMING=1 -DUCONFIG_ENABLE_PLUGINS=1
compLevel=0
compOpts=$(addprefix -I,./hpp /usr/local/include) $(icuOpts) -O$(compLevel)
libDirs=$(addprefix -L,/home/victor/lib/malplsrv $(addprefix /usr/local/lib/,boost icu))
icuLibs=$(addprefix icu,data i18n io test tu uc)

# Libraries which all builds need
commonLibs=$(icuLibs) pthread dl

dbgLibs=$(addprefix -l,vuu-debug $(addprefix boost_,$(addsuffix -mt-d-x64,program_options filesystem locale thread)) $(commonLibs))
prodLibs=$(addprefix -l,vuu-prod $(addprefix boost_,$(addsuffix -mt-x64,program_options filesystem locale thread)) $(commonLibs))
cppDir=./cpp

## Set up objects for each type of build ##
objs=main
dbgStatObjs=$(addprefix ./$(objDir)/debug/static/,$(addsuffix .o,$(objs)))
dbgDynObjs=$(addprefix ./$(objDir)/debug/dynamic/,$(addsuffix .o,$(objs)))
prodStatObjs=$(addprefix ./$(objDir)/production/static/,$(addsuffix .o,$(objs)))
prodDynObjs=$(addprefix ./$(objDir)/production/dynamic/,$(addsuffix .o,$(objs)))

all: $(progName)-debug-dynamic $(progName)-prod-dynamic $(progName)-debug-static $(progName)-prod-static

$(progName)-debug-static: $(dbgStatObjs)
	$(compiler) -o $@ $^ -static $(dbgOpts) $(libDirs) $(dbgLibs)

$(progName)-debug-dynamic: $(dbgDynObjs)
	$(compiler) -o $@ $^ $(dbgOpts) $(libDirs) $(dbgLibs)

$(progName)-prod-dynamic: $(prodDynObjs)
	$(compiler) -o $@ $^ $(libDirs) $(prodLibs)

$(progName)-prod-static: $(prodStatObjs)
	$(compiler) -o $@ $^ -static $(libDirs) $(prodLibs)

$(objDir)/debug/static/%.o: $(cppDir)/%.cpp
	$(compiler) -o $@ -c $^ -static $(compOpts) $(dbgOpts)

$(objDir)/debug/dynamic/%.o: $(cppDir)/%.cpp
	$(compiler) -o $@ -c $^ $(compOpts) $(dbgOpts)

$(objDir)/production/dynamic/%.o: $(cppDir)/%.cpp
	$(compiler) -o $@ -c $^ $(compOpts) $(dbgOpts)

$(objDir)/production/static/%.o: $(cppDir)/%.cpp
	$(compiler) -o $@ -c $^ -static $(compOpts) $(dbgOpts)

rebuild: clean all

clean: $(addprefix clean_,debug prod)

clean_debug: 
	rm -f $(progName)-debug-dynamic $(progName)-debug-static
	rm -f $(objDir)/debug/{static,dynamic}/*

clean_prod: 
	rm -f $(progName)-prod-dynamic $(progName)-prod-static
	rm -f $(objDir)/production/{static,dynamic}/*
