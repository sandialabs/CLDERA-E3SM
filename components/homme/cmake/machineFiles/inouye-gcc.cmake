
#SET (WITH_PNETCDF FALSE CACHE FILEPATH "")

#SET (USE_MPIEXEC "srun" CACHE STRING "")
SET (USE_QUEUING FALSE CACHE BOOL "")
SET(BUILD_HOMME_WITHOUT_PIOLIBRARY TRUE CACHE BOOL "")
# for standalone HOMME builds:
#SET (CPRNC_DIR /lcrc/group/acme/tools/cprnc CACHE FILEPATH "")

#does not work, include is not seen
#SET (E3SM_KOKKOS_PATH /ascldap/users/onguba/kokkos/build-omp CACHE FILEPATH "")

#set (extra_flags "-mtune=thunderx2t99 -mcpu=thunderx2t99")
#set (extra_flags "-msve-vector-bits=512 -ffp-contract=fast -march=armv8.2-a+sve")
set (ADD_Fortran_FLAGS "-g ${extra_flags}" CACHE STRING "")
set (ADD_C_FLAGS "-g ${extra_flags}" CACHE STRING "")
set (ADD_CXX_FLAGS "-g ${extra_flags}" CACHE STRING "")
set (CMAKE_EXE_LINKER_FLAGS "-ldl" CACHE STRING "")

set (ENABLE_HORIZ_OPENMP FALSE CACHE BOOL "")
SET (HOMME_FIND_BLASLAPACK TRUE CACHE BOOL "")

SET(CMAKE_C_COMPILER "mpicc" CACHE STRING "")
SET(CMAKE_CXX_COMPILER "mpicxx" CACHE STRING "")
SET(CMAKE_Fortran_COMPILER "mpifort" CACHE STRING "")

SET(BUILD_HOMME_PREQX_KOKKOS TRUE CACHE BOOL "")
SET(BUILD_HOMME_THETA_KOKKOS TRUE CACHE BOOL "")
SET(BUILD_HOMME_SWEQX FALSE CACHE BOOL "")
SET(BUILD_HOMME_PREQX_ACC FALSE CACHE BOOL "")


