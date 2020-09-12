exeName=malPlSrv
cppDir=./cpp
files=IoContextPool Connection Server main
compiler=g++-9
objDir=./obj
dbgStatObjs=$(addprefix $(objDir)/debug/static/,$(addsuffix .o,$(files)))
dbgDynObjs=$(addprefix $(objDir)/debug/dynamic/,$(addsuffix .o,$(files)))
prodDynObjs=$(addprefix $(objDir)/production/dynamic/,$(addsuffix .o,$(files)))
prodStatObjs=$(addprefix $(objDir)/production/static/,$(addsuffix .o,$(files)))
libDirs=$(addprefix -L,/usr/local/lib/boost $(addprefix /home/victor/lib/,mpp vuu))

# Libraries which are common to both the debug and production builds
commonLibs=pthread mariadbclientpp 

# MariaDB libraries
mariadbLibs=$(shell mariadb_config --libs) $(shell mariadb_config --libs_sys)

# Libraries that are specific to the debug build
dbgLibs=$(addprefix -l,mpp-debug vuu-debug $(addprefix boost_,$(addsuffix -mt-d-x64,filesystem program_options thread locale regex)) $(commonLibs)) $(mariadbLibs)

# Libraries that are specific to the production build
prodLibs=$(addprefix -l,mpp vuu $(addprefix boost_,$(addsuffix -mt-x64,filesystem program_options thread locale regex)) $(commonLibs)) $(mariadbLibs)

# Debug build options
dbgOpts=-DDEBUG $(addprefix -g,gdb3 gnu-pubnames variable-location-views inline-points) -Og -fvar-tracking-assignments -save-temps

# Directory where our headers are located
hdrDir=./hpp

# Use the latest GNU dialect of C++
standard=gnu++17

# Standard compilation options for everything
compOpts=$(addprefix -I,$(hdrDir) /home/victor/include /usr/include/mysql) $(addprefix -W,all error) -std=$(standard) $(shell mariadb_config --cflags)

# Defines that control whether the boost or std implementations are used
boostOrStd=$(addprefix -DUSE_STD_,ENABLE_SHARED_FROM_THIS SHARED_PTR THREAD ANY BIND)

# Redirect stderr > stdout
redirect=2>&1

all: $(addsuffix -dynamic, $(exeName)-debug $(exeName)-production) $(addsuffix -static,$(exeName)-debug $(exeName)-production)

$(exeName)-production-dynamic: $(prodDynObjs)
	$(compiler) -o $@ $^ $(libDirs) $(prodLibs) $(redirect)

$(exeName)-production-static: $(prodStatObjs)
	$(compiler) -o $@ $^ -static $(libDirs) $(prodLibs) $(redirect)

$(exeName)-debug-static: $(dbgStatObjs)
	$(compiler) -o $@ $^ -static $(libDirs) $(dbgLibs) $(redirect)

$(exeName)-debug-dynamic: $(dbgDynObjs)
	$(compiler) -o $@ $^ $(libDirs) $(dbgLibs) $(redirect)

$(objDir)/debug/static/%.o: $(cppDir)/%.cpp
	$(compiler) -o $@ -c $^ -static $(compOpts) $(dbgOpts) $(boostOrStd) $(redirect)

$(objDir)/debug/dynamic/%.o: $(cppDir)/%.cpp
	$(compiler) -o $@ -c $^ -fPIC $(compOpts) $(dbgOpts) $(boostOrStd) $(redirect)

$(objDir)/production/dynamic/%.o: $(cppDir)/%.cpp
	$(compiler) -o $@ -c $^ -fPIC $(compOpts) $(boostOrStd) $(redirect)

$(objDir)/production/static/%.o: $(cppDir)/%.cpp
	$(compiler) -o $@ -c $^ -static $(compOpts) $(boostOrStd) $(redirect)

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
