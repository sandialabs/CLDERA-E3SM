set(ALBANY_PATH "/global/homes/m/mperego/e3sm-software/albany-trilinos/albany-install-2021-10-01")
string(APPEND CONFIG_ARGS " --host=cray")
if (MPILIB STREQUAL impi)
  string(APPEND CFLAGS " -axMIC-AVX512 -xCORE-AVX2")
endif()
string(APPEND CPPDEFS " -DARCH_MIC_KNL")
string(APPEND FFLAGS " -convert big_endian -assume byterecl -ftz -traceback -assume realloc_lhs -fp-model consistent -fimf-use-svml")
if (NOT DEBUG)
  string(APPEND FFLAGS " -O2 -debug minimal -qno-opt-dynamic-align")
endif()
if (MPILIB STREQUAL impi)
  string(APPEND FFLAGS " -xMIC-AVX512")
endif()
string(APPEND FFLAGS " -DHAVE_ERF_INTRINSICS")
string(APPEND CXXFLAGS " -std=c++14 -fp-model consistent")
if (compile_threaded)
  string(APPEND CXXFLAGS " -qopenmp")
endif()
if (DEBUG)
  string(APPEND CXXFLAGS " -O0 -g")
endif()
if (NOT DEBUG)
  string(APPEND CXXFLAGS " -O2")
endif()
if (MPILIB STREQUAL impi)
  set(MPICC "mpiicc")
endif()
if (MPILIB STREQUAL impi)
  set(MPICXX "mpiicpc")
endif()
if (MPILIB STREQUAL impi)
  set(MPIFC "mpiifort")
endif()
if (MPILIB STREQUAL impi)
  set(MPI_LIB_NAME "impi")
endif()
set(PETSC_PATH "$ENV{PETSC_DIR}")
set(SCC "icc")
set(SCXX "icpc")
set(SFC "ifort")
string(APPEND SLIBS " -L$ENV{NETCDF_DIR} -lnetcdff -Wl,--as-needed,-L$ENV{NETCDF_DIR}/lib -lnetcdff -lnetcdf")
string(APPEND SLIBS " -mkl -lpthread")
