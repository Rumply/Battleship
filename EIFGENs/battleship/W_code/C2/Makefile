INCLUDE_PATH =  -I"C:\Program Files\Eiffel Software\EiffelStudio 15.11 GPL\contrib\library\game2\C_lib_win\OpenAL\include" -I"C:\Program Files\Eiffel Software\EiffelStudio 15.11 GPL\contrib\library\game2\cpf\spec\include" -I"C:\Program Files\Eiffel Software\EiffelStudio 15.11 GPL\contrib\library\game2\audio_sound_file\spec\include" -I"C:\Program Files\Eiffel Software\EiffelStudio 15.11 GPL\contrib\library\game2\C_lib_win\libsndfile\include" -I"C:\Program Files\Eiffel Software\EiffelStudio 15.11 GPL\contrib\library\game2\game_core\spec\include" -I"C:\Program Files\Eiffel Software\EiffelStudio 15.11 GPL\contrib\library\game2\C_lib_win\SDL2\include" -I"C:\Program Files\Eiffel Software\EiffelStudio 15.11 GPL\contrib\library\game2\C_lib_win\SDL2_gfx\include" -I"C:\Program Files\Eiffel Software\EiffelStudio 15.11 GPL\contrib\library\game2\C_lib_win\SDL2_image\include" -I"C:\Program Files\Eiffel Software\EiffelStudio 15.11 GPL\contrib\library\game2\C_lib_win\SDL2_ttf\include"
SHELL = \bin\sh
CC = cl
CPP = cl
CFLAGS = -Od -MT -w -nologo -D_WIN32_WINNT=0x0500 -DWINVER=0x0500 -D_CRT_SECURE_NO_DEPRECATE -D_UNICODE -DUNICODE   -DEIF_IEEE_BEHAVIOR -DWORKBENCH -I"C:\Program Files\Eiffel Software\EiffelStudio 15.11 GPL\studio\spec\win64\include" -I. $(INCLUDE_PATH)
CPPFLAGS = -Od -MT -w -nologo -D_WIN32_WINNT=0x0500 -DWINVER=0x0500 -D_CRT_SECURE_NO_DEPRECATE -D_UNICODE -DUNICODE   -DWORKBENCH -I"C:\Program Files\Eiffel Software\EiffelStudio 15.11 GPL\studio\spec\win64\include" -I. $(INCLUDE_PATH)
LDFLAGS = -STACK:5000000 -NODEFAULTLIB:libc
CCLDFLAGS = -STACK:5000000 -NODEFAULTLIB:libc  -SUBSYSTEM:CONSOLE
LDSHAREDFLAGS =  -dll -incremental:no -NODEFAULTLIB:libc
EIFLIB = "C:\Program Files\Eiffel Software\EiffelStudio 15.11 GPL\studio\spec\win64\lib\msc\wkbench.lib"
EIFTEMPLATES = C:\Program Files\Eiffel Software\EiffelStudio 15.11 GPL\studio\config\win64\templates
LIBS = 
MAKE = nmake -s -nologo
AR = 
LD = 
MKDEP =   --
MV = copy
CP = copy
RANLIB = echo
RM = del
FILE_EXIST = if exist
RMDIR = rd
X2C = "C:\Program Files\Eiffel Software\EiffelStudio 15.11 GPL\studio\spec\win64\bin\x2c.exe"
SHAREDLINK = link
SHAREDLIBS = USER32.lib WS2_32.lib ADVAPI32.lib GDI32.lib SHELL32.lib MSIMG32.lib \
	COMDLG32.lib UUID.lib OLE32.lib OLEAUT32.lib COMCTL32.lib MPR.LIB SHLWAPI.LIB WINSPOOL.LIB 
SHARED_SUFFIX = .dll
COMMAND_MAKEFILE = 
START_TEST = if not exist finished 
END_TEST =  
CREATE_TEST = echo "finished" >> finished 
SYSTEM_IN_DYNAMIC_LIB = battleship.dll 

.SUFFIXES:.cpp .obj 

.c.obj:
	$(CC) $(CFLAGS) -c $<

.cpp.obj:
	$(CPP) $(CPPFLAGS) -c $<

OBJECTS = big_file_C2_c.obj 

OLDOBJECTS =  ga900.obj ga900d.obj ga903.obj ga903d.obj ga918.obj ga918d.obj ga914.obj ga914d.obj \
	ga907.obj ga907d.obj ga920.obj ga920d.obj ga913.obj ga913d.obj ga902.obj ga902d.obj \
	ch925.obj ch925d.obj ga924.obj ga924d.obj ga917.obj ga917d.obj ga923.obj ga923d.obj \
	ga915.obj ga915d.obj ga901.obj ga901d.obj ga912.obj ga912d.obj ga906.obj ga906d.obj \
	ga911.obj ga911d.obj ga910.obj ga910d.obj ga922.obj ga922d.obj ga921.obj ga921d.obj \
	ga893.obj ga893d.obj ga909.obj ga909d.obj ga899.obj ga899d.obj ga895.obj ga895d.obj \
	ga916.obj ga916d.obj ga919.obj ga919d.obj ga894.obj ga894d.obj ga908.obj ga908d.obj \
	ga905.obj ga905d.obj ga904.obj ga904d.obj ga898.obj ga898d.obj ga897.obj ga897d.obj \
	ga896.obj ga896d.obj 

all::  Cobj2.lib

Cobj2.lib: $(OBJECTS) Makefile
	if exist $@ $(RM) $@
	lib -nologo -OUT:$@ $(OBJECTS)
	$(CREATE_TEST)
	$(RM) $(OBJECTS)


clean: local_clean
clobber: local_clobber

local_clean::
	$(RM) core finished *.o

local_clobber:: local_clean
	$(RM) Makefile

