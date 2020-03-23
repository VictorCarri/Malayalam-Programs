exeName=malPlSrv
cppDir=./cpp
files=main
compiler=g++-8
objDir=./obj
objs=$(addprefix $(objDir)/,$(addsuffix .o,$(files)))

$(exeName): $(objs)
	$(compiler) -o $@ $^

$(objDir)/main.o: $(cppDir)/main.cpp
	$(compiler) -o $@ -c $^
