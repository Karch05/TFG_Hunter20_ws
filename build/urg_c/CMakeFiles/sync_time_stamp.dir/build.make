# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.22

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/karch/ws/TFG_Hunter20_ws/src/urg_c

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/karch/ws/TFG_Hunter20_ws/build/urg_c

# Include any dependencies generated for this target.
include CMakeFiles/sync_time_stamp.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/sync_time_stamp.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/sync_time_stamp.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/sync_time_stamp.dir/flags.make

CMakeFiles/sync_time_stamp.dir/current/samples/sync_time_stamp.c.o: CMakeFiles/sync_time_stamp.dir/flags.make
CMakeFiles/sync_time_stamp.dir/current/samples/sync_time_stamp.c.o: /home/karch/ws/TFG_Hunter20_ws/src/urg_c/current/samples/sync_time_stamp.c
CMakeFiles/sync_time_stamp.dir/current/samples/sync_time_stamp.c.o: CMakeFiles/sync_time_stamp.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/karch/ws/TFG_Hunter20_ws/build/urg_c/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/sync_time_stamp.dir/current/samples/sync_time_stamp.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/sync_time_stamp.dir/current/samples/sync_time_stamp.c.o -MF CMakeFiles/sync_time_stamp.dir/current/samples/sync_time_stamp.c.o.d -o CMakeFiles/sync_time_stamp.dir/current/samples/sync_time_stamp.c.o -c /home/karch/ws/TFG_Hunter20_ws/src/urg_c/current/samples/sync_time_stamp.c

CMakeFiles/sync_time_stamp.dir/current/samples/sync_time_stamp.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/sync_time_stamp.dir/current/samples/sync_time_stamp.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/karch/ws/TFG_Hunter20_ws/src/urg_c/current/samples/sync_time_stamp.c > CMakeFiles/sync_time_stamp.dir/current/samples/sync_time_stamp.c.i

CMakeFiles/sync_time_stamp.dir/current/samples/sync_time_stamp.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/sync_time_stamp.dir/current/samples/sync_time_stamp.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/karch/ws/TFG_Hunter20_ws/src/urg_c/current/samples/sync_time_stamp.c -o CMakeFiles/sync_time_stamp.dir/current/samples/sync_time_stamp.c.s

# Object files for target sync_time_stamp
sync_time_stamp_OBJECTS = \
"CMakeFiles/sync_time_stamp.dir/current/samples/sync_time_stamp.c.o"

# External object files for target sync_time_stamp
sync_time_stamp_EXTERNAL_OBJECTS =

sync_time_stamp: CMakeFiles/sync_time_stamp.dir/current/samples/sync_time_stamp.c.o
sync_time_stamp: CMakeFiles/sync_time_stamp.dir/build.make
sync_time_stamp: libopen_urg_sensor.a
sync_time_stamp: liburg_c.so
sync_time_stamp: CMakeFiles/sync_time_stamp.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/karch/ws/TFG_Hunter20_ws/build/urg_c/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable sync_time_stamp"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/sync_time_stamp.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/sync_time_stamp.dir/build: sync_time_stamp
.PHONY : CMakeFiles/sync_time_stamp.dir/build

CMakeFiles/sync_time_stamp.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/sync_time_stamp.dir/cmake_clean.cmake
.PHONY : CMakeFiles/sync_time_stamp.dir/clean

CMakeFiles/sync_time_stamp.dir/depend:
	cd /home/karch/ws/TFG_Hunter20_ws/build/urg_c && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/karch/ws/TFG_Hunter20_ws/src/urg_c /home/karch/ws/TFG_Hunter20_ws/src/urg_c /home/karch/ws/TFG_Hunter20_ws/build/urg_c /home/karch/ws/TFG_Hunter20_ws/build/urg_c /home/karch/ws/TFG_Hunter20_ws/build/urg_c/CMakeFiles/sync_time_stamp.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/sync_time_stamp.dir/depend
