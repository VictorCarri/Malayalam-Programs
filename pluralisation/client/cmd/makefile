# Additional directories to search for headers
# ./hpp - our headers
# /home/victor/include - Headers for libraries that I built
# /usr/include/mysql - MySQL headers
# $(shell mariadb_config --cflags) - List of include paths for MariaDB
incDirs=$(addprefix -I,./hpp /home/victor/include /usr/include/mysql) $(shell mariadb_config --cflags)

# Standard to use. Use GNU dialect of C++17
std=gnu++17

# Warning options
#warnOpts=$(addprefix -W,all error extra old-style-cast overloaded-virtual extra pedantic null-dereference init-self $(addprefix missing-,include-dirs noreturn declarations) $(addprefix switch-,default enum) $(addprefix un,initialized known-pragmas def) no-prio-ctor-dtor stringop-truncation $(addprefix suggest-,$(addprefix final-,types methods) override) alloca $(addprefix duplicated-,branches cond) float-equal shadow unsafe-loop-optimizations placement-new $(addprefix cast-,qual align) catch-value=3 conditionally-supported conversion zero-as-null-pointer-constant useless-cast date-time extra-semi logical-op $(addprefix no-,aggressive-loop-optimizations builtin-declaration-mismatch) normalized packed redundant-decls invalid-pch no-virtual-move-assign disabled-optimization)
warnOpts=$(addprefix -W,all error)

# Optimization options
optimOpts=$(addprefix -f,$(addprefix tree-loop-i,m vcanon) ivopts tree-pta variable-expansion-in-unroller unroll-loops $(addprefix lt,o o-odr-type-merging) tracer unroll-loops move-loop-invariants split-loops unswitch-loops)

# Defines that control whether STD or Boost is used
boostOrStd=$(addprefix -DUSE_STD_,THREAD ANY)

# Compilation options that are common to all builds
# $(incDirs): self-explanatory
# $(addprefix -O,3 s): -O3 and -Os options
# -std=$(std): Use the standard chosen above
# -pedantic-errors - Catch as many errors as possible
# $(warnOpts) - self-explanatory
# $(optimOpts) - self-explanatory
# $(boostOrStd) - Defines that control whether Boost or STD implementations are used for various pieces of code that originated in Boost
# -pthread: Recommended option if using pthread lib (which we are)
# -D_GLIBCXX_USE_CXX11_ABI=0 - Gets g++-9 to use C++20 ABI for std::string, instead of failing at link time because it tries to use std::__cxx11::basic_string
#compOpts=$(incDirs) $(addprefix -O,3 s) -std=$(std) -pedantic-errors $(warnOpts) $(optimOpts) $(boostOrStd) -pthread -D_GLIBCXX_USE_CXX11_ABI=0
#compOpts=$(incDirs) $(addprefix -O,3 s) -std=$(std) $(warnOpts) $(optimOpts) $(boostOrStd) -pthread -D_GLIBCXX_USE_CXX11_ABI=0
compOpts=$(incDirs) $(addprefix -O,3 s) -std=$(std) $(warnOpts) $(boostOrStd) -pthread

# Directory where C++ files are stored
cppDir=./cpp

# Compiler to use
compiler=g++-10

# Directory where object files are stored
objDir=./obj

# The name that's common to all executables
exeName=mpp-cmd-client

# List of files to compile, in order from self-contained classes to main
files=Client main

# List of objects for the dynamically-linked debug build
dbgDynObjs=$(addprefix $(objDir)/debug/dynamic/,$(addsuffix .o,$(files)))

# Debug build options
dbgOpts=-DDEBUG -Og -save-temps $(addprefix -g,gdb3 gnu-pubnames $(addprefix as-lo,c-support cview-support) variable-location-views inline-points z)

# List of objects for the dynamically-linked production build
prodDynObjs=$(addprefix $(objDir)/production/dynamic/,$(addsuffix .o,$(files)))

# List of objects for the statically-linked production build
prodStatObjs=$(addprefix $(objDir)/production/static/,$(addsuffix .o,$(files)))

# List of objects for the statically-linked debug build
dbgStatObjs=$(addprefix $(objDir)/debug/static/,$(addsuffix .o,$(files)))

# List of libraries that are common to all builds
commonLibs=pthread mariadbclientpp

# List of MariaDB libraries
mariadbLibs=$(shell mariadb_config --libs) $(shell mariadb_config --libs_sys)

# Libraries for the debug builds
# vuu-debug - Debug build of my Unicode utilities
# mpp-debug - Debug build of my Malayalam Pluralisation Protocol library
# boost_program_options-mt-d-x64 - Boost.Program_Options
# boost_filesystem-mt-d-x64 - Boost.Filesystem
# boost_locale-mt-d-x64 - Boost.Locale
# boost_regex-mt-d-x64 - Boost.Regex
# boost_thread-mt-d-x64 - Boost.Thread
# commonLibs - Needed by all builds
# mariadbLibs - MariaDB libraries. Kept outside "-l" prefixing function because they're already prefixed
dbgLibs=$(addprefix -l,$(addsuffix -debug,mpp vuu) $(addprefix boost_,$(addsuffix -gcc10-mt-d-x64-1_75,thread program_options filesystem locale regex)) $(commonLibs)) $(mariadbLibs)

# Libraries for the production builds
# vuu - Production build of my Unicode utilities
# mpp - Production build of my Malayalam Pluralisation Protocol library
# boost_program_options-mt-x64 - Boost.Program_Options
# boost_filesystem-mt-x64 - Boost.Filesystem
# boost_locale-mt-x64 - Boost.Locale
# boost_regex-mt-x64 - Boost.Regex
# boost_thread-mt-x64 - Boost.Thread
# commonLibs - Needed by all builds
# mariadbLibs - MariaDB libraries. Kept outside "-l" prefixing function because they're already prefixed
prodLibs=$(addprefix -l,mpp vuu $(addprefix boost_,$(addsuffix -gcc10-mt-x64-1_75,thread program_options filesystem locale regex)) $(commonLibs)) $(mariadbLibs)

# Additional directories to search for libraries
# /home/victor/lib/vuu - my Unicode utilities library
# /home/victor/lib/mpp - the Malayalam Pluralisation Protocol library
# /usr/local/lib/boost - Boost libs
libDirs=$(addprefix -L,$(addprefix /home/victor/lib/,vuu mpp) $(addprefix /usr/local/lib,/boost))


# The executables are ordered with the dynamic builds first since thes static builds always fail, since MySQL relies on libs that are only dynamic
all: $(exeName)-debug-dynamic $(exeName)-production-dynamic $(exeName)-debug-static $(exeName)-production-static

# Dynamic debug executable
$(exeName)-debug-dynamic: $(dbgDynObjs)
	$(compiler) -o $@ $^ $(compOpts) $(dbgOpts) -fwhole-program $(libDirs) $(dbgLibs)
	echo

# Dynamic debug object
$(objDir)/debug/dynamic/%.o: $(cppDir)/%.cpp
	$(compiler) -o $@ -c $^ $(compOpts) $(dbgOpts) -fPIC

# Dynamic production executable
$(exeName)-production-dynamic: $(prodDynObjs)
	$(compiler) -o $@ $^ $(compOpts) -fwhole-program $(libDirs) $(prodLibs)
	echo

# Dynamic production object
$(objDir)/production/dynamic/%.o: $(cppDir)/%.cpp
	$(compiler) -o $@ -c $^ $(compOpts) -fPIC

# Static production executable
$(exeName)-production-static: $(prodStatObjs)
	$(compiler) -o $@ $^ $(compOpts) $(addprefix -stati,c c-libgcc) -fwhole-program $(libDirs) $(prodLibs)
	echo

# Static production object
$(objDir)/production/static/%.o: $(cppDir)/%.cpp
	$(compiler) -o $@ -c $^ $(compOpts)

# Static debug executable
$(exeName)-debug-static: $(dbgStatObjs)
	$(compiler) -o $@ $^ $(compOpts) $(addprefix -stati,c c-libgcc) $(dbgOpts) -fwhole-program $(libDirs) $(dbgLibs)
	echo

# Static debug object
$(objDir)/debug/static/%.o: $(cppDir)/%.cpp
	$(compiler) -o $@ -c $^ $(compOpts) $(dbgOpts)

clean: $(addprefix $(@)_,debug production)

clean_debug: $(addprefix $(@)_,static dynamic)

clean_production: $(addprefix $(@)_,static dynamic)

clean_debug_static:
	rm -f $(objDir)/debug/static/*

clean_debug_dynamic:
	rm -f $(objDir)/debug/dynamic/*

clean_production_static:
	rm -f $(objDir)/production/static/*

clean_production_dynamic:
	rm -f $(objDir)/production/dynamic/*

rebuild: $(addprefix rebuild_,dynamic static)

rebuild_dynamic: $(addprefix rebuild_dynamic_,debug production)

rebuild_static: $(addprefix rebuild_static_,debug production)

rebuild_dynamic_debug: clean_debug_dynamic $(exeName)-debug-dynamic

rebuild_dynamic_production: clean_production_dynamic $(exeName)-production-dynamic

rebuild_static_debug: clean_debug_static $(exeName)-debug-static

rebuild_static_production: clean_production_static $(exeName)-production-static
