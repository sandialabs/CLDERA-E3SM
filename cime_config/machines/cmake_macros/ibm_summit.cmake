string(APPEND CPPDEFS " -DLINUX")
if (COMP_NAME STREQUAL gptl)
  string(APPEND CPPDEFS " -DHAVE_SLASHPROC")
endif()
string(APPEND FFLAGS " -qzerosize -qfree=f90 -qxlf2003=polymorphic")
string(APPEND FFLAGS " -qspillsize=2500 -qextname=flush")
if (COMP_NAME STREQUAL cice AND compile_threaded)
  string(APPEND FFLAGS " -qsmp=omp:noopt")
endif()
string(APPEND LDFLAGS " -Wl,--relax -Wl,--allow-multiple-definition")
if (MPILIB STREQUAL mpi-serial)
  string(APPEND SLIBS " -lxlopt -lxl -lxlsmp -L$ENV{NETCDF_C_PATH}/lib -lnetcdf -L$ENV{NETCDF_FORTRAN_PATH}/lib -lnetcdff -L$ENV{ESSL_PATH}/lib64 -lessl -L$ENV{OLCF_NETLIB_LAPACK_ROOT}/lib -llapack")
endif()
if (NOT MPILIB STREQUAL mpi-serial)
  string(APPEND SLIBS " -L$ENV{PNETCDF_PATH}/lib -lpnetcdf -L$ENV{HDF5_PATH}/lib -lhdf5_hl -lhdf5 -lxlopt -lxl -lxlsmp -L$ENV{NETCDF_C_PATH}/lib -lnetcdf -L$ENV{NETCDF_FORTRAN_PATH}/lib -lnetcdff -L$ENV{ESSL_PATH}/lib64 -lessl -L$ENV{OLCF_NETLIB_LAPACK_ROOT}/lib -llapack")
endif()
if (NOT MPILIB STREQUAL mpi-serial)
  string(APPEND SLIBS " -L$ENV{ADIOS2_DIR}/lib64 -ladios2_c_mpi -ladios2_c -ladios2_core_mpi -ladios2_core")
endif()
string(APPEND CXX_LIBS " -L/sw/summit/gcc/8.1.1/lib64 -lstdc++ -L$ENV{OLCF_XLC_ROOT}/lib -libmc++")
set(MPICC "mpicc")
set(MPICXX "mpiCC")
set(MPIFC "mpif90")
set(PIO_FILESYSTEM_HINTS "gpfs")
set(SCC "xlc_r")
set(SFC "xlf90_r")
set(SCXX "xlc++_r")
set(NETCDF_C_PATH "$ENV{NETCDF_C_PATH}")
set(NETCDF_FORTRAN_PATH "$ENV{NETCDF_FORTRAN_PATH}")
set(PNETCDF_PATH "$ENV{PNETCDF_PATH}")
set(SUPPORTS_CXX "TRUE")
set(KOKKOS_OPTIONS "--arch=Power9 --with-serial")
