progName=malLenCounter
objs=main.o
compiler=g++-8
dbgOpts=-DDEBUG -ggdb3
icuOpts=-DU_DISABLE_RENAMING=1 -DUCONFIG_ENABLE_PLUGINS=1
compOpts=$(addprefix -I,./hpp /usr/local/include) $(icuOpts)
libDirs=$(addprefix -L,/home/victor/lib $(addprefix /usr/local/lib/,boost icu))
icuLibs=$(addprefix icu,data i18n io test tu uc)
objDir=./obj

# Libraries which all builds need
commonLibs=$(icuLibs) pthread dl

dbgLibs=$(addprefix -l,vuu-debug $(addprefix boost_,$(addsuffix -mt-d-x64,program_options filesystem locale thread)) $(commonLibs))
prodLibs=$(addprefix -l,vuu-prod $(addprefix boost_,$(addsuffix -mt-x64,program_options filesystem locale thread)) $(commonLibs))
cppDir=./cpp

all: $(progName)-debug-dynamic $(progName)-prod-dynamic $(progName)-debug-static $(progName)-prod-static

$(progName)-debug-static: $(objs)
	$(compiler) -o $@ $^ $(dbgOpts) -static $(libDirs) $(dbgLibs)

$(progName)-debug-dynamic: $(objs)
	$(compiler) -o $@ $^ $(dbgOpts) $(libDirs) $(dbgLibs)

$(progName)-prod-dynamic: $(objs)
	$(compiler) -o $@ $^ $(libDirs) $(prodLibs)

$(progName)-prod-static: $(objs)
	$(compiler) -o $@ $^ -static $(libDirs) $(prodLibs)

main.o: $(cppDir)/main.cpp
	$(compiler) -o $@ -c $^ $(compOpts)

rebuild: clean all

clean: $(addprefix clean_,debug prod)
	rm -f $(objDir)/*

clean_debug: 
	rm -f $(progName)-debug-dynamic $(progName)-debug-static

clean_prod: 
	rm -f $(progName)-prod-dynamic $(progName)-prod-static
