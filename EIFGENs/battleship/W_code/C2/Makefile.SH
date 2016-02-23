case $CONFIG in
'')
	if test ! -f ../config.sh; then
		(echo "Can't find ../config.sh."; exit 1)
	fi 2>/dev/null
	. ../config.sh
	;;
esac
case "$O" in
*/*) cd `expr X$0 : 'X\(.*\)/'` ;;
esac
echo "Compiling C code in C2"
$spitshell >Makefile <<!GROK!THIS!
INCLUDE_PATH =  -I"\$(EIFFEL_LIBRARY)\contrib\library\game2\C_lib_win\OpenAL\include" -I"\$(EIFFEL_LIBRARY)\contrib\library\game2\cpf\spec\include" -I"\$(EIFFEL_LIBRARY)/contrib/library/game2/audio_sound_file/spec/include" -I"\$(EIFFEL_LIBRARY)\contrib\library\game2\C_lib_win\libsndfile\include" -I"\$(EIFFEL_LIBRARY)/contrib/library/game2/game_core/spec/include" -I"\$(EIFFEL_LIBRARY)\contrib\library\game2\C_lib_win\SDL2\include" -I"\$(EIFFEL_LIBRARY)\contrib\library\game2\C_lib_win\SDL2_gfx\include" -I"\$(EIFFEL_LIBRARY)\contrib\library\game2\C_lib_win\SDL2_image\include" -I"\$(EIFFEL_LIBRARY)\contrib\library\game2\C_lib_win\SDL2_ttf\include"
SHELL = /bin/sh
CC = $cc
CPP = $cpp
CFLAGS = $wkoptimize $ccflags $large -DEIF_IEEE_BEHAVIOR -DWORKBENCH -I"$rt_include" -I. \$(INCLUDE_PATH)
CPPFLAGS = $wkoptimize $cppflags $large -DWORKBENCH -I"$rt_include" -I. \$(INCLUDE_PATH)
LDFLAGS = $ldflags
CCLDFLAGS = $ccldflags  $console_flags
LDSHAREDFLAGS =  $ldsharedflags
EIFLIB = "$rt_lib/$prefix$wkeiflib$suffix"
EIFTEMPLATES = $rt_templates
LIBS = $libs
MAKE = $make
AR = $ar
LD = $ld
MKDEP = $mkdep \$(DPFLAGS) --
MV = $mv
CP = $cp
RANLIB = $ranlib
RM = $rm -f
FILE_EXIST = $file_exist
RMDIR = $rmdir
X2C = "$x2c"
SHAREDLINK = $sharedlink
SHAREDLIBS = $sharedlibs
SHARED_SUFFIX = $shared_suffix
COMMAND_MAKEFILE = 
START_TEST = $start_test 
END_TEST = $end_test 
CREATE_TEST = $create_test 
SYSTEM_IN_DYNAMIC_LIB = battleship$shared_suffix 
!GROK!THIS!
$spitshell >>Makefile <<'!NO!SUBS!'

.SUFFIXES:.cpp .o

.c.o:
	$(CC) $(CFLAGS) -c $<

.cpp.o:
	$(CPP) $(CPPFLAGS) -c $<

OBJECTS = big_file_C2_c.obj 

OLDOBJECTS =  ga900.o ga900d.o ga903.o ga903d.o ga918.o ga918d.o ga914.o ga914d.o \
	ga907.o ga907d.o ga920.o ga920d.o ga913.o ga913d.o ga902.o ga902d.o \
	ch925.o ch925d.o ga924.o ga924d.o ga917.o ga917d.o ga923.o ga923d.o \
	ga915.o ga915d.o ga901.o ga901d.o ga912.o ga912d.o ga906.o ga906d.o \
	ga911.o ga911d.o ga910.o ga910d.o ga922.o ga922d.o ga921.o ga921d.o \
	ga893.o ga893d.o ga909.o ga909d.o ga899.o ga899d.o ga895.o ga895d.o \
	ga916.o ga916d.o ga919.o ga919d.o ga894.o ga894d.o ga908.o ga908d.o \
	ga905.o ga905d.o ga904.o ga904d.o ga898.o ga898d.o ga897.o ga897d.o \
	ga896.o ga896d.o 

all: Cobj2.o

Cobj2.o: $(OBJECTS) Makefile
	$(LD) $(LDFLAGS) -r -o Cobj2.o $(OBJECTS)
	$(RM) $(OBJECTS)
	$(CREATE_TEST)

clean: local_clean
clobber: local_clobber

local_clean::
	$(RM) core finished *.o

local_clobber:: local_clean
	$(RM) Makefile

!NO!SUBS!
chmod 644 Makefile
$eunicefix Makefile

