if (NOT DEBUG)
  string(APPEND CFLAGS " -O2")
endif()
if (NOT DEBUG)
  string(APPEND FFLAGS " -O2")
endif()
if (NOT MPILIB STREQUAL mpi-serial)
  string(APPEND SLIBS " -L$ENV{ADIOS2_DIR}/lib64 -ladios2_c_mpi -ladios2_c -ladios2_core_mpi -ladios2_core")
endif()
string(APPEND CXX_LIBS " -lstdc++")
