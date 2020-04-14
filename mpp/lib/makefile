cppDir=./cpp
compiler=g++-8
objDir=./obj
files=CharPrinter Header Reply ReqParser ReqHandler Request
dbgStatObjs=$(addprefix $(objDir)/debug/static/,$(addsuffix .o,$(files)))
dbgDynObjs=$(addprefix $(objDir)/debug/dynamic/,$(addsuffix .o,$(files)))
prodStatObjs=$(addprefix $(objDir)/production/static/,$(addsuffix .o,$(files)))
prodDynObjs=$(addprefix $(objDir)/production/dynamic/,$(addsuffix .o,$(files)))
libName=mpp
hppDir=./hpp
compOpts=$(addprefix -O,3 s) -I$(hppDir) -save-temps
dbgOpts=-DDEBUG $(addprefix -g,gdb3 gnu-pubnames variable-location-views inline-points) -Og -fvar-tracking-assignments

# Directory where the libraries will be built
buildDir=./build

# Directory where library should be installed
instDir=~/lib

all: $(addprefix $(buildDir)/,lib$(libName)-debug.so lib$(libName).so lib$(libName).a lib$(libName)-debug.a)
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
	rm -f $(buildDir)/*
	rm -rf $(instDir)/*
	rm -f *.{ii,s}

clean_debug: $(addprefix clean_debug_,static dynamic)

clean_production: $(addprefix clean_production_,static dynamic)

clean_debug_static:
	rm -f $(objDir)/debug/static/*

clean_debug_dynamic:
	rm -f $(objDir)/debug/dynamic/*

clean_production_dynamic:
	rm -f $(objDir)/production/dynamic/*

clean_production_static:
	rm -f $(objDir)/production/static/*

rebuild: clean all
