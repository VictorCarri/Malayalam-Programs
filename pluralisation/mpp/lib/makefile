cppDir=./cpp
compiler=g++-9
objDir=./obj
files=functors/PtrResetter $(addprefix exceptions/,Exception BadHeaderValue DBError $(addprefix MissingDB,ConfFile Info) $(addprefix Unknown,Header Noun)) $(addprefix data/,DBInfo) Header $(addprefix Req,uest Parser Handler) $(addprefix Rep,ly Parser)
dbgStatObjs=$(addprefix $(objDir)/debug/static/,$(addsuffix .o,$(files)))
dbgDynObjs=$(addprefix $(objDir)/debug/dynamic/,$(addsuffix .o,$(files)))
prodStatObjs=$(addprefix $(objDir)/production/static/,$(addsuffix .o,$(files)))
prodDynObjs=$(addprefix $(objDir)/production/dynamic/,$(addsuffix .o,$(files)))
libName=mpp
hppDir=./hpp

# Defines used to control whether or not the library uses Boost or standard versions of various libraries
# -DUSE_STD_FILESYSTEM - Use std::filesystem::path & std::filesystem::exists from <filesystem> rather than boost::filesystem::path & boost::filesystem::exists from <boost/filesystem.hpp>
# -DUSE_STD_ANY - Use std::any from <any> rather than boost::any from <boost/any.hpp>
# -DUSE_STD_ARRAY - Use std::array from <array> rather than boost::array from <boost/array.hpp>
boostOrStd=$(addprefix -DUSE_STD_,FILESYSTEM ANY ARRAY)

# Compilation options that are common to all builds
compOpts=$(addprefix -O,3 s) $(addprefix -I,$(hppDir) /home/victor/include /usr/include/mysql) -save-temps -std=gnu++17 $(addprefix -W,all error) $(boostOrStd)

# Debug build options
dbgOpts=-DDEBUG $(addprefix -g,gdb3 gnu-pubnames variable-location-views inline-points) -Og -fvar-tracking-assignments

# Directory where the libraries will be built
buildDir=./build

# Directory where library should be installed
instDir=~/lib/mpp

# Redirect stderr > stdout
redir=2>&1

all: $(addprefix $(buildDir)/,lib$(libName)-debug.so lib$(libName).so lib$(libName).a lib$(libName)-debug.a) ~/include/$(libName)
	rm -rf ~/include/$(libName)
	cp -r $(hppDir)/$(libName) ~/include/

$(objDir)/debug/static/%.o: $(cppDir)/%.cpp
	$(compiler) -o $@ -c $^ -static $(compOpts) $(dbgOpts) $(redir)

$(objDir)/debug/dynamic/%.o: $(cppDir)/%.cpp
	$(compiler) -o $@ -c $^ -fPIC $(compOpts) $(dbgOpts) $(redir)

$(objDir)/production/dynamic/%.o: $(cppDir)/%.cpp
	$(compiler) -o $@ -c $^ -fPIC $(compOpts) $(redir)

$(objDir)/production/static/%.o: $(cppDir)/%.cpp
	$(compiler) -o $@ -c $^ -static $(compOpts) $(redir)

$(buildDir)/lib$(libName)-debug.so: $(dbgDynObjs)
	$(compiler) -o $@ -shared $^ $(redir)
	cp $@ $(instDir) $(redir)

$(buildDir)/lib$(libName).so: $(prodDynObjs)
	$(compiler) -o $@ -shared $^ $(redir)
	cp $@ $(instDir) $(redir)

$(buildDir)/lib$(libName).a: $(prodStatObjs)
	ar rcs $@ $^ $(redir)
	cp $@ $(instDir) $(redir)

$(buildDir)/lib$(libName)-debug.a: $(dbgStatObjs)
	ar rcs $@ $^ $(redir)
	cp $@ $(instDir) $(redir)

clean: $(addprefix clean_,debug production)
	rm -rf $(instDir)/* $(redir)
	rm -f *.{ii,s} $(redir)

clean_debug: $(addprefix clean_debug_,static dynamic)

clean_production: $(addprefix clean_production_,static dynamic)

clean_debug_static:
	find $(objDir)/debug/static/ -type f -exec rm {} \; $(redir)
	rm -f $(buildDir)/lib$(libName)-debug.a $(redir)

clean_debug_dynamic:
	find $(objDir)/debug/dynamic/ -type f -exec rm {} \; $(redir)
	rm -f $(buildDir)/lib$(libName)-debug.so $(redir)

clean_production_dynamic:
	find $(objDir)/production/dynamic/ -type f -exec rm {} \; $(redir)
	rm -f $(buildDir)/lib$(libName).so $(redir)

clean_production_static:
	find $(objDir)/production/static/ -type f -exec rm {} \; $(redir)
	rm -f $(buildDir)/lib$(libName).a $(redir)

rebuild: clean all
