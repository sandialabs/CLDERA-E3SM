string(APPEND CFLAGS " -g -qfullpath -qmaxmem=-1 -qphsinfo")
if (NOT DEBUG)
  string(APPEND CFLAGS " -O3")
endif()
if (NOT DEBUG AND compile_threaded)
  string(APPEND CFLAGS " -qsmp=omp")
endif()
if (DEBUG AND compile_threaded)
  string(APPEND CFLAGS " -qsmp=omp:noopt")
endif()
string(APPEND CXXFLAGS " -g -qfullpath -qmaxmem=-1 -qphsinfo")
if (NOT DEBUG)
  string(APPEND CXXFLAGS " -O2")
endif()
if (NOT DEBUG AND compile_threaded)
  string(APPEND CXXFLAGS " -qsmp=omp")
endif()
if (DEBUG AND compile_threaded)
  string(APPEND CXXFLAGS " -qsmp=omp:noopt")
endif()
string(APPEND CPPDEFS " -DFORTRAN_SAME -DCPRIBM")
if (COMP_NAME STREQUAL eam)
  string(APPEND CPPDEFS " -DUSE_CBOOL")
endif()
string(APPEND CPPDEFS " -DLINUX")
if (COMP_NAME STREQUAL gptl)
  string(APPEND CPPDEFS " -DHAVE_SLASHPROC")
endif()
set(CPRE "-WF,-D")
string(APPEND FC_AUTO_R8 " -qrealsize=8")
string(APPEND FFLAGS " -g -qfullpath -qmaxmem=-1 -qphsinfo")
if (NOT DEBUG)
  string(APPEND FFLAGS " -O2 -qstrict -Q")
endif()
if (NOT DEBUG AND compile_threaded)
  string(APPEND FFLAGS " -qsmp=omp")
endif()
if (DEBUG AND compile_threaded)
  string(APPEND FFLAGS " -qsmp=omp:noopt")
endif()
string(APPEND FFLAGS " -qzerosize -qfree=f90 -qxlf2003=polymorphic")
string(APPEND FFLAGS " -qspillsize=2500 -qextname=flush")
if (COMP_NAME STREQUAL cice AND compile_threaded)
  string(APPEND FFLAGS " -qsmp=omp:noopt")
endif()
string(APPEND FFLAGS_NOOPT " -O0")
string(APPEND FIXEDFLAGS " -qsuffix=f=f -qfixed=132")
string(APPEND FREEFLAGS " -qsuffix=f=f90:cpp=F90")
set(HAS_F2008_CONTIGUOUS "TRUE")
string(APPEND LDFLAGS " -Wl,--relax -Wl,--allow-multiple-definition")
string(APPEND LDFLAGS " -qsmp -qoffload -lcudart -L$ENV{CUDA_DIR}/lib64")
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
