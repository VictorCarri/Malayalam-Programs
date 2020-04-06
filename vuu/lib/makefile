libName=vuu
dbgLibs=$(addprefix lib,$(addprefix $(libName)-debug,.a .so))
prodLibs=$(addprefix lib,$(addprefix $(libName)-prod,.a .so))
files=LenCounter InvByteInCodePoint
objDir=./obj
statDbgObjs=$(addprefix $(objDir)/static/debug/,$(addsuffix .o,$(files)))
dynDbgObjs=$(addprefix $(objDir)/dynamic/debug/,$(addsuffix .o,$(files)))
dynProdObjs=$(addprefix $(objDir)/dynamic/prod/,$(addsuffix .o,$(files)))
statProdObjs=$(addprefix $(objDir)/static/prod/,$(addsuffix .o,$(files)))
cppDir=./cpp
compiler=g++-8
compOpts=-I./hpp
dbgOpts=-DDEBUG -ggdb3
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

clean:
	rm -f $(objDir)/{static,dynamic}/{debug,prod}/* $(dbgLibs) $(prodLibs)

rebuild: clean all
