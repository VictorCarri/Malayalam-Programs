cppDir=./cpp
compiler=g++-8
objDir=./obj
objs=$(addprefix $(objDir)/,$(addsuffix .o,main))
hdrDir=/home/victor/include
compOpts=-I$(hdrDir) -save-temps -DDEBUG -ggdb3 -std=gnu++1z $(shell mariadb_config --cflags)
exeName=parserTest
myLibDirs=$(addprefix /home/victor/lib/,mpp vuu)
usrLocalLibDirs=$(addprefix /usr/local/lib/,boost icu)
libDirs=$(addprefix -L,$(usrLocalLibDirs) $(myLibDirs)) $(shell mariadb_config --libs)
myLibs=$(addsuffix -debug,mpp vuu)
boostLibs=$(addprefix boost_,$(addsuffix -mt-d-x64,regex program_options locale filesystem system))
icuLibs=$(addprefix icu,data i18n io test tu uc)
libs=$(addprefix -l,$(myLibs) $(boostLibs) $(icuLibs) pthread mariadbclientpp) $(shell mariadb_config --libs_sys)

$(exeName): $(objs)
	$(compiler) -o $@ $^ $(libDirs) $(libs) $(compOpts)

$(objDir)/%.o: $(cppDir)/%.cpp
	$(compiler) -o $@ -c $^ $(compOpts)

clean:
	rm -f $(exeName) $(objs)

rebuild: clean $(exeName)
