exeName=uniLenCounter
libName=vuh
dbgExes=$(addprefix $(exeName)-debug,-dynamic -static)
prodExes=$(addprefix $(exeName)-prod,-dynamic -static)
dbgLibs=$(addprefix $(libName).debug,.a .so)
prodLibs=$(addprefix $(libName).prod,.a .so)
files=$(adddprefix $(libName)/,UniLenCounter) main
objDir=./obj
dbgStaticObjs=$(addprefix $(objDir)/prog/static/debug/,$(addsuffix .o,$(files)))
dbgDynamicObjs=$(addprefix $(objDir)/prog/dynamic/debug/,$(addsuffix .o,$(files)))
prodDynamicObjs=$(addprefix $(objDir)/prog/dynamic/prod/,$(addsuffix .o,$(files)))
prodStaticObjs=$(addprefix $(objDir)/prog/static/prod/,$(addsuffix .o,$(files)))
dbgSharedLibObjs=$(addprefix $(objDir)/lib/shared/debug,$(addsuffix .o,$(files)))
prodSharedLibObjs=$(addprefix $(objDir)/lib/shared/prod,$(addsuffix .o,$(files)))

all: $(dbgExes) $(prodExes) $(dbgLibs) $(prodLibs)

$(exeName)-debug-static: $(dbgStaticObjs)

$(exeName)-debug-dynamic: $(dbgDynamicObjs)

$(exeName)-prod-dynamic: $(prodDynamicObjs)

$(exeName)-prod-static: $(prodStaticObjs)

$(libName).debug.a: $(dbgStaticObjs)

$(libName).prod.a: $(prodStaticObjs)

$(libName).debug.so: $(dbgSharedLibObjs)

$(libName).prod.so: $(prodSharedLibObjs)

clean:
	rm *.{ii,s}
