# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
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
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/fife/argos3/robotics-club

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/fife/argos3/robotics-club/build

# Include any dependencies generated for this target.
include controllers/custom_footbot/CMakeFiles/custom_footbot.dir/depend.make

# Include the progress variables for this target.
include controllers/custom_footbot/CMakeFiles/custom_footbot.dir/progress.make

# Include the compile flags for this target's objects.
include controllers/custom_footbot/CMakeFiles/custom_footbot.dir/flags.make

controllers/custom_footbot/CMakeFiles/custom_footbot.dir/custom_footbot_autogen/mocs_compilation.cpp.o: controllers/custom_footbot/CMakeFiles/custom_footbot.dir/flags.make
controllers/custom_footbot/CMakeFiles/custom_footbot.dir/custom_footbot_autogen/mocs_compilation.cpp.o: controllers/custom_footbot/custom_footbot_autogen/mocs_compilation.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/fife/argos3/robotics-club/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object controllers/custom_footbot/CMakeFiles/custom_footbot.dir/custom_footbot_autogen/mocs_compilation.cpp.o"
	cd /home/fife/argos3/robotics-club/build/controllers/custom_footbot && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/custom_footbot.dir/custom_footbot_autogen/mocs_compilation.cpp.o -c /home/fife/argos3/robotics-club/build/controllers/custom_footbot/custom_footbot_autogen/mocs_compilation.cpp

controllers/custom_footbot/CMakeFiles/custom_footbot.dir/custom_footbot_autogen/mocs_compilation.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/custom_footbot.dir/custom_footbot_autogen/mocs_compilation.cpp.i"
	cd /home/fife/argos3/robotics-club/build/controllers/custom_footbot && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/fife/argos3/robotics-club/build/controllers/custom_footbot/custom_footbot_autogen/mocs_compilation.cpp > CMakeFiles/custom_footbot.dir/custom_footbot_autogen/mocs_compilation.cpp.i

controllers/custom_footbot/CMakeFiles/custom_footbot.dir/custom_footbot_autogen/mocs_compilation.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/custom_footbot.dir/custom_footbot_autogen/mocs_compilation.cpp.s"
	cd /home/fife/argos3/robotics-club/build/controllers/custom_footbot && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/fife/argos3/robotics-club/build/controllers/custom_footbot/custom_footbot_autogen/mocs_compilation.cpp -o CMakeFiles/custom_footbot.dir/custom_footbot_autogen/mocs_compilation.cpp.s

controllers/custom_footbot/CMakeFiles/custom_footbot.dir/custom_footbot.cpp.o: controllers/custom_footbot/CMakeFiles/custom_footbot.dir/flags.make
controllers/custom_footbot/CMakeFiles/custom_footbot.dir/custom_footbot.cpp.o: ../controllers/custom_footbot/custom_footbot.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/fife/argos3/robotics-club/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object controllers/custom_footbot/CMakeFiles/custom_footbot.dir/custom_footbot.cpp.o"
	cd /home/fife/argos3/robotics-club/build/controllers/custom_footbot && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/custom_footbot.dir/custom_footbot.cpp.o -c /home/fife/argos3/robotics-club/controllers/custom_footbot/custom_footbot.cpp

controllers/custom_footbot/CMakeFiles/custom_footbot.dir/custom_footbot.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/custom_footbot.dir/custom_footbot.cpp.i"
	cd /home/fife/argos3/robotics-club/build/controllers/custom_footbot && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/fife/argos3/robotics-club/controllers/custom_footbot/custom_footbot.cpp > CMakeFiles/custom_footbot.dir/custom_footbot.cpp.i

controllers/custom_footbot/CMakeFiles/custom_footbot.dir/custom_footbot.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/custom_footbot.dir/custom_footbot.cpp.s"
	cd /home/fife/argos3/robotics-club/build/controllers/custom_footbot && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/fife/argos3/robotics-club/controllers/custom_footbot/custom_footbot.cpp -o CMakeFiles/custom_footbot.dir/custom_footbot.cpp.s

# Object files for target custom_footbot
custom_footbot_OBJECTS = \
"CMakeFiles/custom_footbot.dir/custom_footbot_autogen/mocs_compilation.cpp.o" \
"CMakeFiles/custom_footbot.dir/custom_footbot.cpp.o"

# External object files for target custom_footbot
custom_footbot_EXTERNAL_OBJECTS =

controllers/custom_footbot/libcustom_footbot.so: controllers/custom_footbot/CMakeFiles/custom_footbot.dir/custom_footbot_autogen/mocs_compilation.cpp.o
controllers/custom_footbot/libcustom_footbot.so: controllers/custom_footbot/CMakeFiles/custom_footbot.dir/custom_footbot.cpp.o
controllers/custom_footbot/libcustom_footbot.so: controllers/custom_footbot/CMakeFiles/custom_footbot.dir/build.make
controllers/custom_footbot/libcustom_footbot.so: /usr/lib/x86_64-linux-gnu/libdl.so
controllers/custom_footbot/libcustom_footbot.so: /usr/lib/x86_64-linux-gnu/libpthread.so
controllers/custom_footbot/libcustom_footbot.so: /usr/lib/x86_64-linux-gnu/libfreeimage.so
controllers/custom_footbot/libcustom_footbot.so: /usr/lib/x86_64-linux-gnu/libfreeimageplus.so
controllers/custom_footbot/libcustom_footbot.so: /usr/lib/x86_64-linux-gnu/libGL.so
controllers/custom_footbot/libcustom_footbot.so: /usr/lib/x86_64-linux-gnu/libGLU.so
controllers/custom_footbot/libcustom_footbot.so: /usr/lib/x86_64-linux-gnu/libglut.so
controllers/custom_footbot/libcustom_footbot.so: /usr/lib/x86_64-linux-gnu/libXmu.so
controllers/custom_footbot/libcustom_footbot.so: /usr/lib/x86_64-linux-gnu/libXi.so
controllers/custom_footbot/libcustom_footbot.so: /usr/lib/x86_64-linux-gnu/liblua5.3.so
controllers/custom_footbot/libcustom_footbot.so: /usr/lib/x86_64-linux-gnu/libm.so
controllers/custom_footbot/libcustom_footbot.so: /usr/lib/x86_64-linux-gnu/libdl.so
controllers/custom_footbot/libcustom_footbot.so: /usr/lib/x86_64-linux-gnu/libpthread.so
controllers/custom_footbot/libcustom_footbot.so: /usr/lib/x86_64-linux-gnu/libfreeimage.so
controllers/custom_footbot/libcustom_footbot.so: /usr/lib/x86_64-linux-gnu/libfreeimageplus.so
controllers/custom_footbot/libcustom_footbot.so: /usr/lib/x86_64-linux-gnu/libGL.so
controllers/custom_footbot/libcustom_footbot.so: /usr/lib/x86_64-linux-gnu/libGLU.so
controllers/custom_footbot/libcustom_footbot.so: /usr/lib/x86_64-linux-gnu/libglut.so
controllers/custom_footbot/libcustom_footbot.so: /usr/lib/x86_64-linux-gnu/libXmu.so
controllers/custom_footbot/libcustom_footbot.so: /usr/lib/x86_64-linux-gnu/libXi.so
controllers/custom_footbot/libcustom_footbot.so: /usr/lib/x86_64-linux-gnu/liblua5.3.so
controllers/custom_footbot/libcustom_footbot.so: /usr/lib/x86_64-linux-gnu/libm.so
controllers/custom_footbot/libcustom_footbot.so: /usr/lib/x86_64-linux-gnu/libdl.so
controllers/custom_footbot/libcustom_footbot.so: /usr/lib/x86_64-linux-gnu/libpthread.so
controllers/custom_footbot/libcustom_footbot.so: /usr/lib/x86_64-linux-gnu/libfreeimage.so
controllers/custom_footbot/libcustom_footbot.so: /usr/lib/x86_64-linux-gnu/libfreeimageplus.so
controllers/custom_footbot/libcustom_footbot.so: /usr/lib/x86_64-linux-gnu/libGL.so
controllers/custom_footbot/libcustom_footbot.so: /usr/lib/x86_64-linux-gnu/libGLU.so
controllers/custom_footbot/libcustom_footbot.so: /usr/lib/x86_64-linux-gnu/libglut.so
controllers/custom_footbot/libcustom_footbot.so: /usr/lib/x86_64-linux-gnu/libXmu.so
controllers/custom_footbot/libcustom_footbot.so: /usr/lib/x86_64-linux-gnu/libXi.so
controllers/custom_footbot/libcustom_footbot.so: /usr/lib/x86_64-linux-gnu/libQt5Widgets.so.5.12.8
controllers/custom_footbot/libcustom_footbot.so: /usr/lib/x86_64-linux-gnu/libQt5Gui.so.5.12.8
controllers/custom_footbot/libcustom_footbot.so: /usr/lib/x86_64-linux-gnu/liblua5.3.so
controllers/custom_footbot/libcustom_footbot.so: /usr/lib/x86_64-linux-gnu/libm.so
controllers/custom_footbot/libcustom_footbot.so: /usr/lib/x86_64-linux-gnu/libdl.so
controllers/custom_footbot/libcustom_footbot.so: /usr/lib/x86_64-linux-gnu/libpthread.so
controllers/custom_footbot/libcustom_footbot.so: /usr/lib/x86_64-linux-gnu/libfreeimage.so
controllers/custom_footbot/libcustom_footbot.so: /usr/lib/x86_64-linux-gnu/libfreeimageplus.so
controllers/custom_footbot/libcustom_footbot.so: /usr/lib/x86_64-linux-gnu/libGL.so
controllers/custom_footbot/libcustom_footbot.so: /usr/lib/x86_64-linux-gnu/libGLU.so
controllers/custom_footbot/libcustom_footbot.so: /usr/lib/x86_64-linux-gnu/libglut.so
controllers/custom_footbot/libcustom_footbot.so: /usr/lib/x86_64-linux-gnu/libXmu.so
controllers/custom_footbot/libcustom_footbot.so: /usr/lib/x86_64-linux-gnu/libXi.so
controllers/custom_footbot/libcustom_footbot.so: /usr/lib/x86_64-linux-gnu/liblua5.3.so
controllers/custom_footbot/libcustom_footbot.so: /usr/lib/x86_64-linux-gnu/libm.so
controllers/custom_footbot/libcustom_footbot.so: /usr/lib/x86_64-linux-gnu/libQt5Core.so.5.12.8
controllers/custom_footbot/libcustom_footbot.so: controllers/custom_footbot/CMakeFiles/custom_footbot.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/fife/argos3/robotics-club/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX shared module libcustom_footbot.so"
	cd /home/fife/argos3/robotics-club/build/controllers/custom_footbot && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/custom_footbot.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
controllers/custom_footbot/CMakeFiles/custom_footbot.dir/build: controllers/custom_footbot/libcustom_footbot.so

.PHONY : controllers/custom_footbot/CMakeFiles/custom_footbot.dir/build

controllers/custom_footbot/CMakeFiles/custom_footbot.dir/clean:
	cd /home/fife/argos3/robotics-club/build/controllers/custom_footbot && $(CMAKE_COMMAND) -P CMakeFiles/custom_footbot.dir/cmake_clean.cmake
.PHONY : controllers/custom_footbot/CMakeFiles/custom_footbot.dir/clean

controllers/custom_footbot/CMakeFiles/custom_footbot.dir/depend:
	cd /home/fife/argos3/robotics-club/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/fife/argos3/robotics-club /home/fife/argos3/robotics-club/controllers/custom_footbot /home/fife/argos3/robotics-club/build /home/fife/argos3/robotics-club/build/controllers/custom_footbot /home/fife/argos3/robotics-club/build/controllers/custom_footbot/CMakeFiles/custom_footbot.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : controllers/custom_footbot/CMakeFiles/custom_footbot.dir/depend

