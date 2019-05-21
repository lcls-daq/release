# List of projects (low level first)

#
#  Determine which packages are in this release
#
rprojects := $(wildcard *)

#
#  List external package base directories for convenience
#
#epics_use      := /reg/common/package/epicsca/3.14.12
#epics_use       := /reg/g/pcds/package/external/epicsca-pcds-R1.0-r410
#  This one is compatible with our old compiler
epics_use      := /reg/g/pcds/package/external/epicsca-R3.14.12-0.4.0
evgr_use       := /reg/g/pcds/package/external/evgr_V00-00-05
qt_use         := /reg/common/package/qt/4.8.4
qwt_use        := /reg/g/pcds/package/external/qwt-5.1.1-wfopt-logfix
python_use     := /reg/common/package/python/2.5.5
python3_use    := /reg/common/package/python/3.6.8
libraw1394_use := /reg/g/pcds/package/external/libdc1394
libdc1394_use  := /reg/g/pcds/package/external/libdc1394
offlinedb_use  := /reg/g/pcds/package/external/offlinedb-1.5.2
edt_use        := /reg/g/pcds/package/external/edt_R5.5.5.4
leutron_use    := /reg/g/pcds/package/external/leutron_V00-00-00
fli_use        := /reg/g/pcds/package/external/fli-dist-1.104
andor_use      := /reg/g/pcds/package/external/andor-2.100.30026.0
andor3_use     := /reg/g/pcds/package/external/andor-3.13.30001.0
libusb_use     := /reg/g/pcds/package/external/libusb-1.0.21
usdusb4_use    := /reg/g/pcds/package/external/usdusb4
acqiris_use    := /reg/g/pcds/package/external/acqiris_3.3a
relaxd_use     := /reg/g/pcds/package/external/relaxd-1.9.9
pvcam_use      := /reg/g/pcds/package/external/pvcam2.7.1.7
picam_use      := /reg/g/pcds/package/external/picam-5.5.3
gsl_use        := /reg/g/pcds/package/external/gsl-1.13
slsdet_use     := /reg/g/pcds/package/external/slsDetectorsPackage-3.1.3
boost_use      := /reg/g/pcds/pkg_mgr/release/boost/1.63.0
ndarray_use    := /reg/common/package/ndarray/1.1.8
hdf5_use       := /reg/common/package/hdf5/1.8.17
szip_use       := /reg/common/package/szip/2.1
zeromq_use     := /reg/common/package/zeromq/4.1.5
psalg_use      := /reg/common/package/psalg/1.0.9
pdsdata_use    := /reg/common/package/pdsdata/8.9.11
hsd_use        := /reg/g/pcds/package/external/hsd/v0.0.2
gsc16ai_use    := /reg/g/pcds/package/external/gsc16ai-2.1.68
aesdriver_use  := /reg/g/pcds/package/aes-stream-drivers

#
#  *_use_include definitions will create a directory structure under build for
#    external packages which don't already have the needed structure.  The
#    *_use_lib_i386 will create the lib/ structure with soft-links to the
#    variable reference for i386-linux-*.  The *_use_lib_x86_64 will create the
#    analogous soft-links for x86_64-linux-* libraries.
#  Packages without a *_use_include definition will just have a soft-link under build.
#
boost_use_include    := $(boost_use)/linux-x86_64/include
boost_use_lib_x86_64 := $(boost_use)/linux-x86_64
boost_use_lib_rhel7  := $(boost_use)/rhel7-x86_64

ndarray_use_include := $(ndarray_use)

slsdet_use_include    := $(slsdet_use)/slsDetectorSoftware/include
slsdet_use_lib_x86_64 := $(slsdet_use)/bin
slsdet_use_lib_rhel7  := $(slsdet_use)/bin

python3_use_include    := $(python3_use)/include
python3_use_lib_x86_64 := $(python3_use)/lib
python3_use_lib_rhel7  := $(python3_use)/lib

hdf5_use_include    := $(hdf5_use)/linux-x86_64/include
hdf5_use_lib_x86_64 := $(hdf5_use)/linux-x86_64/lib
hdf5_use_lib_rhel7  := $(hdf5_use)/rhel7-x86_64/lib

szip_use_include    := $(szip_use)/x86_64-rhel5-gcc41-opt/include
szip_use_lib_x86_64 := $(szip_use)/x86_64-rhel5-gcc41-opt/lib
szip_use_lib_rhel7  := $(szip_use)/x86_64-rhel7-gcc48-opt/lib

zeromq_use_include    := $(zeromq_use)/x86_64-rhel5-gcc41-opt/include
zeromq_use_lib_x86_64 := $(zeromq_use)/x86_64-rhel5-gcc41-opt/lib
zeromq_use_lib_rhel7  := $(zeromq_use)/x86_64-rhel7-gcc48-opt/lib

psalg_use_include:= $(psalg_use)/x86_64-linux-opt
psalg_use_i386   := $(psalg_use)/i386-linux
psalg_use_x86_64 := $(psalg_use)/x86_64-linux
psalg_use_rhel7  := $(psalg_use)/x86_64-linux

pdsdata_use_include:= $(pdsdata_use)/x86_64-rhel7-dbg
pdsdata_use_i386   := $(pdsdata_use)/i386-linux
pdsdata_use_x86_64 := $(pdsdata_use)/x86_64-linux
pdsdata_use_rhel7  := $(pdsdata_use)/x86_64-rhel7

gsc16ai_use_include := $(gsc16ai_use)/driver

aesdriver_use_include := $(aesdriver_use)/include

projects :=

# RHEL6 has qt in its distribution
ifeq ($(findstring x86_64-rhel6,$(tgt_arch)),)
projects += qt
endif

projects += \
      pdsdata \
      boost \
      ndarray \
      hdf5 \
      szip \
      zeromq \
      qwt \
      psalg \
      python \
      python3 \

ifneq ($(filter pds, $(rprojects)),)
  projects += \
      acqiris \
      evgr \
      leutron \
      edt \
      epics \
      offlinedb \
      libdc1394 \
      pvcam \
      picam \
      relaxd \
      fli \
      andor \
      andor3 \
      libusb \
      usdusb4 \
      slsdet \
      hsd \
      gsc16ai \
      aesdriver \
      pds \
      pdsapp

  pds_use        := release
  pdsapp_use     := release
  timetool_use   := release
else
  projects += \
      epics
  timetool_use   := /reg/g/pcds/dist/pds/7.6.7-p8.0.10/build/timetool
  timetool_use_include    := $(timetool_use)/include
  timetool_use_lib_x86_64 := $(timetool_use)/lib/x86_64-linux-opt
endif

projects += timetool

ifneq ($(filter ami, $(rprojects)),)
  projects += gsl ami
  ami_use := release
endif


