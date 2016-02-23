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

OBJECTS = big_file_C1_c.obj 

OLDOBJECTS =  ap861.obj ap861d.obj im890.obj im890d.obj ga889.obj ga889d.obj im881.obj im881d.obj \
	ga864.obj ga864d.obj ga874.obj ga874d.obj ga888.obj ga888d.obj ga882.obj ga882d.obj \
	im863.obj im863d.obj im880.obj im880d.obj ga878.obj ga878d.obj ga887.obj ga887d.obj \
	ga886.obj ga886d.obj ga862.obj ga862d.obj ga885.obj ga885d.obj ga873.obj ga873d.obj \
	ga884.obj ga884d.obj ga892.obj ga892d.obj ga879.obj ga879d.obj ga872.obj ga872d.obj \
	ga871.obj ga871d.obj ga883.obj ga883d.obj ga868.obj ga868d.obj ga869.obj ga869d.obj \
	ga877.obj ga877d.obj ga870.obj ga870d.obj ga867.obj ga867d.obj ga866.obj ga866d.obj \
	ga875.obj ga875d.obj ga891.obj ga891d.obj ga865.obj ga865d.obj ga876.obj ga876d.obj 

all::  Cobj1.lib

Cobj1.lib: $(OBJECTS) Makefile
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

