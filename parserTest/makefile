cppDir=./cpp
compiler=g++-8
objDir=./obj
objs=$(addprefix $(objDir)/,$(addsuffix .o,Reply ReqParser Request CharPrinter main))
hdrDir=./hpp
compOpts=-I$(hdrDir) -save-temps -DDEBUG -ggdb3
exeName=parserTest
libDirs=$(addprefix -L/usr/local/lib/,boost icu)
libs=$(addprefix -l,boost_program_options-mt-d-x64 boost_locale-mt-d-x64 boost_filesystem-mt-d-x64 $(addprefix icu,data i18n io test tu uc))

$(exeName): $(objs)
	$(compiler) -o $@ $^ $(libDirs) $(libs) $(compOpts)

$(objDir)/%.o: $(cppDir)/%.cpp
	$(compiler) -o $@ -c $^ $(compOpts)

#$(cppDir)/ReqParser.cpp: $(cppDir)/ReqParser.hpp

clean:
	rm -f $(exeName) $(objs)

rebuild: clean $(exeName)
