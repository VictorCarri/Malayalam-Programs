cppDir=./cpp
compiler=g++-9
objDir=./obj
files=functors/PtrResetter $(addprefix exceptions/,Exception BadHeaderValue DBError $(addprefix MissingDB,ConfFile Info) UnknownHeader) $(addprefix data/,DBInfo) Header Reply Request ReqParser ReqHandler
dbgStatObjs=$(addprefix $(objDir)/debug/static/,$(addsuffix .o,$(files)))
dbgDynObjs=$(addprefix $(objDir)/debug/dynamic/,$(addsuffix .o,$(files)))
prodStatObjs=$(addprefix $(objDir)/production/static/,$(addsuffix .o,$(files)))
prodDynObjs=$(addprefix $(objDir)/production/dynamic/,$(addsuffix .o,$(files)))
libName=mpp
hppDir=./hpp
compOpts=$(addprefix -O,3 s) $(addprefix -I,$(hppDir) /home/victor/include /usr/include/mysql) -save-temps -std=gnu++17 $(addprefix -W,all error)
dbgOpts=-DDEBUG $(addprefix -g,gdb3 gnu-pubnames variable-location-views inline-points) -Og -fvar-tracking-assignments

# Directory where the libraries will be built
buildDir=./build

# Directory where library should be installed
instDir=~/lib/mpp

all: $(addprefix $(buildDir)/,lib$(libName)-debug.so lib$(libName).so lib$(libName).a lib$(libName)-debug.a) ~/include/$(libName)
	rm -rf ~/include/$(libName)
	cp -r $(hppDir)/$(libName) ~/include/

$(objDir)/debug/static/%.o: $(cppDir)/%.cpp
	$(compiler) -o $@ -c $^ -static $(compOpts) $(dbgOpts)

$(objDir)/debug/dynamic/%.o: $(cppDir)/%.cpp
	$(compiler) -o $@ -c $^ -fPIC $(compOpts) $(dbgOpts)

$(objDir)/production/dynamic/%.o: $(cppDir)/%.cpp
	$(compiler) -o $@ -c $^ -fPIC $(compOpts)

$(objDir)/production/static/%.o: $(cppDir)/%.cpp
	$(compiler) -o $@ -c $^ -static $(compOpts)

$(buildDir)/lib$(libName)-debug.so: $(dbgDynObjs)
	$(compiler) -o $@ -shared $^
	cp $@ $(instDir)

$(buildDir)/lib$(libName).so: $(prodDynObjs)
	$(compiler) -o $@ -shared $^
	cp $@ $(instDir)

$(buildDir)/lib$(libName).a: $(prodStatObjs)
	ar rcs $@ $^
	cp $@ $(instDir)

$(buildDir)/lib$(libName)-debug.a: $(dbgStatObjs)
	ar rcs $@ $^
	cp $@ $(instDir)

clean: $(addprefix clean_,debug production)
	rm -rf $(instDir)/*
	rm -f *.{ii,s}

clean_debug: $(addprefix clean_debug_,static dynamic)

clean_production: $(addprefix clean_production_,static dynamic)

clean_debug_static:
	find $(objDir)/debug/static/ -type f -exec rm {} \;
	rm -f $(buildDir)/lib$(libName)-debug.a

clean_debug_dynamic:
	find $(objDir)/debug/dynamic/ -type f -exec rm {} \;
	rm -f $(buildDir)/lib$(libName)-debug.so

clean_production_dynamic:
	find $(objDir)/production/dynamic/ -type f -exec rm {} \;
	rm -f $(buildDir)/lib$(libName).so

clean_production_static:
	find $(objDir)/production/static/ -type f -exec rm {} \;
	rm -f $(buildDir)/lib$(libName).a

rebuild: clean all
