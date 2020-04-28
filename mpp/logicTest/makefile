cppDir=./cpp
compiler=g++-8
objDir=./obj
objs=$(addprefix $(objDir)/,$(addsuffix .o,main))
hdrDir=/home/victor/include
compOpts=-I$(hdrDir) -save-temps -DDEBUG -ggdb3 -std=gnu++1z
exeName=parserTest
libDirs=$(addprefix -L,$(addprefix /usr/local/lib/,boost icu) /home/victor/lib)
libs=$(addprefix -l,mpp-debug boost_program_options-mt-d-x64 boost_locale-mt-d-x64 boost_filesystem-mt-d-x64 $(addprefix icu,data i18n io test tu uc) pthread)

$(exeName): $(objs)
	$(compiler) -o $@ $^ $(libDirs) $(libs) $(compOpts)

$(objDir)/%.o: $(cppDir)/%.cpp
	$(compiler) -o $@ -c $^ $(compOpts)

clean:
	rm -f $(exeName) $(objs)

rebuild: clean $(exeName)
