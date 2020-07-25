# Additional directories to search for headers
# ./hpp - our headers
# /home/victor/include - Headers for libraries that I built
incDirs=$(addprefix -I,./hpp /home/victor/include)

# Standard to use. Use GNU dialect of C++17
std=gnu++17

# Warning options
warnOpts=$(addprefix -W,all error extra old-style-cast overloaded-virtual extra pedantic null-dereference init-self $(addprefix missing-,include-dirs noreturn declarations) $(addprefix switch-,default enum) $(addprefix un,initialized known-pragmas def) no-prio-ctor-dtor stringop-truncation $(addprefix suggest-,$(addprefix final-,types methods) override) alloca $(addprefix duplicated-,branches cond) float-equal shadow unsafe-loop-optimizations placement-new $(addprefix cast-,qual align) catch-value=3 conditionally-supported conversion zero-as-null-pointer-constant useless-cast date-time extra-semi logical-op $(addprefix no-,aggressive-loop-optimizations builtin-declaration-mismatch) normalized packed redundant-decls invalid-pch no-virtual-move-assign disabled-optimization)

# Optimization options
optimOpts=$(addprefix -f,$(addprefix tree-loop-i,m vcanon) ivopts tree-pta variable-expansion-in-unroller unroll-loops $(addprefix lt,o o-odr-type-merging) tracer unroll-loops move-loop-invariants split-loops unswitch-loops)

# Defines that control whether STD or Boost is used
boostOrStd=$(addprefix -DUSE_STD_,BIND)

# Compilation options that are common to all builds
compOpts=$(incDirs) $(addprefix -O,3 s) -std=$(std) -pedantic-errors $(warnOpts) $(optimOpts) $(boostOrStd)

# Directory where C++ files are stored
cppDir=./cpp

# Compiler to use
compiler=g++-9

# Directory where object files are stored
objDir=./obj

# The name that's common to all executables
exeName=mpp-client

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
commonLibs=pthread

# Libraries for the debug builds
# vuu-debug - Debug build of my Unicode utilities
dbgLibs=$(addprefix -l,$(commonLibs) vuu-debug)

# Libraries for the production builds
# vuu- Production build of my Unicode utilities
prodLibs=$(addprefix -l,$(commonLibs) vuu)

# Additional directories to search for libraries
# /home/victor/lib/vuu - my Unicode utilities library
libDirs=$(addprefix -L,/home/victor/lib/vuu)

all: $(addsuffix -dynamic,$(addprefix $(exeName)-,debug production)) $(addsuffix -static,$(addprefix $(exeName)-,debug production))

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

rebuild: $(addprefix rebuild_,debug production)

rebuild_debug: $(addprefix rebuild_debug_,dynamic static)

rebuild_production: $(addprefix rebuild_production_,dynamic static)

rebuild_debug_dynamic: clean_debug_dynamic $(exeName)-debug-dynamic

rebuild_debug_static: clean_debug_static $(exeName)-debug-static

rebuild_production_dynamic: clean_production_dynamic $(exeName)-production-dynamic

rebuild_production_static: clean_production_static $(exeName)-production-static
