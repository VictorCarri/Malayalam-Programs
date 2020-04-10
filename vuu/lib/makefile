libName=vuu
dbgLibs=$(addprefix lib,$(addprefix $(libName)-debug,.a .so))
prodLibs=$(addprefix lib,$(addprefix $(libName)-prod,.a .so))
files=internals/StateNamePrinter InvByteInCodePoint LenCounter 
objDir=./obj
statDbgObjs=$(addprefix $(objDir)/static/debug/,$(addsuffix .o,$(files)))
dynDbgObjs=$(addprefix $(objDir)/dynamic/debug/,$(addsuffix .o,$(files)))
dynProdObjs=$(addprefix $(objDir)/dynamic/prod/,$(addsuffix .o,$(files)))
statProdObjs=$(addprefix $(objDir)/static/prod/,$(addsuffix .o,$(files)))
cppDir=./cpp
compiler=g++-8
compOpts=-I./hpp -save-temps
dbgOpts=-DDEBUG $(addprefix -g,gdb3 gnu-pubnames variable-location-views inline-points) -Og -fvar-tracking-assignments
statOpts=$(compOpts)
dynOpts=-fPIC $(compOpts)

all: $(dbgLibs) $(prodLibs)

## All library targets ##

lib$(libName)-debug.a: $(statDbgObjs)
	ar rcs $@ $^
	cp $@ ~/lib

lib$(libName)-prod.a: $(statProdObjs)
	ar rcs $@ $^
	cp $@ ~/lib

lib$(libName)-debug.so: $(dynDbgObjs)
	$(compiler) -shared -o $@ $^
	cp $@ ~/lib

lib$(libName)-prod.so: $(dynProdObjs)
	$(compiler) -shared -o $@ $^
	cp $@ ~/lib

## All object file targets ##
$(objDir)/static/debug/%.o: $(cppDir)/%.cpp
	$(compiler) -o $@ -c $^ $(statOpts) $(dbgOpts)

$(objDir)/dynamic/debug/%.o: $(cppDir)/%.cpp
	$(compiler) -o $@ -c $^ $(dynOpts) $(dbgOpts)

$(objDir)/dynamic/prod/%.o: $(cppDir)/%.cpp
	$(compiler) -o $@ -c $^ $(dynOpts)

$(objDir)/static/prod/%.o: $(cppDir)/%.cpp
	$(compiler) -o $@ -c $^ $(statOpts)

$(objDir)/static/debug/internals/%.o: $(cppDir)/internals/%.cpp
	$(compiler) -o $@ -c $^ $(statOpts) $(dbgOpts)

$(objDir)/dynamic/debug/internals/%.o: $(cppDir)/internals/%.cpp
	$(compiler) -o $@ -c $^ $(dynOpts) $(dbgOpts)

$(objDir)/dynamic/prod/internals/%.o: $(cppDir)/internals/%.cpp
	$(compiler) -o $@ -c $^ $(dynOpts)

$(objDir)/static/prod/internals/%.o: $(cppDir)/internals/%.cpp
	$(compiler) -o $@ -c $^ $(statOpts)

clean_debug: $(addprefix clean_debug_,static dynamic)

clean_debug_static:
	find $(objDir)/static/debug/ -type f -iname '*.o' -delete
	rm -f {.,~}/lib$(libName)-debug.a

clean_debug_dynamic:
	find $(objDir)/dynamic/debug/ -type f -iname '*.o' -delete
	rm -f {.,~}/lib$(libName)-debug.so

clean_prod: $(addprefix clean_prod_,static dynamic)

clean_prod_static:
	find $(objDir)/static/prod/ -type f -iname '*.o' -delete
	rm -f {.,~}/lib$(libName).a

clean_prod_dynamic:
	find $(objDir)/dynamic/prod/ -type f -iname '*.o' -delete
	rm -f {.,~}/lib$(libName).so

rebuild: $(addprefix rebuild_,debug prod)

rebuild_debug: clean_debug lib$(libName)-debug.a lib$(libName)-debug.so

rebuild_prod: clean_prod lib$(libName)-prod.a lib$(libName)-prod.so

clean: $(addprefix clean_,debug prod)
