# List of projects (low level first)

#
#  Determine which packages are in this release
#
rprojects := $(wildcard *)

#
#  List external package base directories for convenience
#
ifneq ("$(wildcard /cds/group/pcds/package)","")
	pkg_ext_dir    := /cds/group/pcds/package/external
	pkg_mgr_dir    := /cds/group/pcds/pkg_mgr/release
	pkg_sw_dir     := /cds/sw/package
	pkg_int_dir    := /cds/sw/package
	pkg_slac_dir   := /cds/group/pcds/package/slaclab
	pkg_dist_dir   := /cds/group/pcds/dist/pds
else
	pkg_ext_dir    := /sdf/group/lcls/ds/daq/external
	pkg_mgr_dir    := /sdf/group/lcls/ds/daq/external
	pkg_sw_dir     := /sdf/group/lcls/ds/daq/external
	pkg_int_dir    := /sdf/group/lcls/ds/daq
	pkg_slac_dir   := /sdf/group/lcls/ds/daq/external
	pkg_dist_dir   := /sdf/group/lcls/ds/daq
endif
epics_use      := $(pkg_ext_dir)/epicsca-R3.14.12-0.4.0
evgr_use       := $(pkg_ext_dir)/evgr_V00-00-05
qt_use         := $(pkg_sw_dir)/qt/4.8.4
qwt_use        := $(pkg_ext_dir)/qwt-5.1.1-wfopt-logfix
python_use     := $(pkg_sw_dir)/python/2.7.16
python3_use    := $(pkg_sw_dir)/python/3.6.8
libraw1394_use := $(pkg_ext_dir)/libdc1394
libdc1394_use  := $(pkg_ext_dir)/libdc1394
mysql_use      := $(pkg_ext_dir)/mysql-5.5.62
edt_use        := $(pkg_ext_dir)/edt_R5.6.3.0
leutron_use    := $(pkg_ext_dir)/leutron_V00-00-00
fli_use        := $(pkg_ext_dir)/fli-dist-1.104
andor_use      := $(pkg_ext_dir)/andor-2.104.30088.0
andor3_use     := $(pkg_ext_dir)/andor-3.15.30126.0
libusb_use     := $(pkg_ext_dir)/libusb-1.0.21
usdusb4_use    := $(pkg_ext_dir)/usdusb4
acqiris_use    := $(pkg_ext_dir)/acqiris_3.3a
relaxd_use     := $(pkg_ext_dir)/relaxd-1.9.9
pvcam_use      := $(pkg_ext_dir)/pvcam2.7.1.7
picam_use      := $(pkg_ext_dir)/picam-5.15.11
gsl_use        := $(pkg_ext_dir)/gsl-2.7.1
slsdet_use     := $(pkg_ext_dir)/slsDetectorPackage-9.0.0
boost_use      := $(pkg_mgr_dir)/boost/1.63.0
ndarray_use    := $(pkg_int_dir)/ndarray/1.1.12
hdf5_use       := $(pkg_sw_dir)/hdf5/1.8.17
szip_use       := $(pkg_sw_dir)/szip/2.1
zeromq_use     := $(pkg_sw_dir)/zeromq/4.1.5
psalg_use      := $(pkg_int_dir)/psalg/1.0.12
pdsdata_use    := $(pkg_int_dir)/pdsdata/10.2.3
hsd_use        := $(pkg_ext_dir)/hsd/v2.0.0
gsc16ai_use    := $(pkg_ext_dir)/gsc16ai-2.8.111.50
aesdriver_use  := $(pkg_slac_dir)/aes-stream-drivers/v5.16.0
vimba_use      := $(pkg_ext_dir)/VimbaX_2026-1
zest_use       := $(pkg_ext_dir)/ZestETM1

#
#  *_use_include definitions will create a directory structure under build for
#    external packages which don't already have the needed structure.  The
#    *_use_lib_i386 will create the lib/ structure with soft-links to the
#    variable reference for i386-linux-*.  The *_use_lib_x86_64 will create the
#    analogous soft-links for x86_64-linux-* libraries.
#  Packages without a *_use_include definition will just have a soft-link under build.
#
boost_use_include    := $(boost_use)/linux-x86_64/include
boost_use_lib_x86_64 := $(boost_use)/linux-x86_64/lib
boost_use_lib_rhel6  := $(boost_use)/rhel6-x86_64/lib
boost_use_lib_rhel7  := $(boost_use)/rhel7-x86_64/lib
boost_use_lib_rhel8  := $(boost_use)/rhel8-x86_64/lib
boost_use_lib_rhel9  := $(boost_use)/rhel9-x86_64/lib

ndarray_use_include := $(ndarray_use)

slsdet_use_include    := $(slsdet_use)/include
slsdet_use_lib_x86_64 := $(slsdet_use)/bin
slsdet_use_lib_rhel6  := $(slsdet_use)/bin
slsdet_use_lib_rhel7  := $(slsdet_use)/rhel7-x86_64/bin
slsdet_use_lib_rhel8  := $(slsdet_use)/rhel8-x86_64/bin
slsdet_use_lib_rhel9  := $(slsdet_use)/rhel9-x86_64/bin

python_use_include    := $(python_use)/include
python_use_lib_x86_64 := $(python_use)/lib
python_use_lib_rhel6  := $(python_use)/lib
python_use_lib_rhel7  := $(python_use)/lib
python_use_lib_rhel8  := $(python_use)/lib
python_use_lib_rhel9  := $(python_use)/lib

python3_use_include    := $(python3_use)/include
python3_use_lib_x86_64 := $(python3_use)/lib
python3_use_lib_rhel6  := $(python3_use)/lib
python3_use_lib_rhel7  := $(python3_use)/lib
python3_use_lib_rhel8  := $(python3_use)/lib
python3_use_lib_rhel9  := $(python3_use)/lib

hdf5_use_include    := $(hdf5_use)/linux-x86_64/include
hdf5_use_lib_x86_64 := $(hdf5_use)/linux-x86_64/lib
hdf5_use_lib_rhel6  := $(hdf5_use)/rhel6-x86_64/lib
hdf5_use_lib_rhel7  := $(hdf5_use)/rhel7-x86_64/lib
hdf5_use_lib_rhel8  := $(hdf5_use)/rhel8-x86_64/lib
hdf5_use_lib_rhel9  := $(hdf5_use)/rhel9-x86_64/lib

szip_use_include    := $(szip_use)/linux-x86_64/include
szip_use_lib_x86_64 := $(szip_use)/linux-x86_64/lib
szip_use_lib_rhel6  := $(szip_use)/rhel6-x86_64/lib
szip_use_lib_rhel7  := $(szip_use)/rhel7-x86_64/lib
szip_use_lib_rhel8  := $(szip_use)/rhel8-x86_64/lib
szip_use_lib_rhel9  := $(szip_use)/rhel9-x86_64/lib

zeromq_use_include    := $(zeromq_use)/linux-x86_64/include
zeromq_use_lib_x86_64 := $(zeromq_use)/linux-x86_64/lib
zeromq_use_lib_rhel6  := $(zeromq_use)/rhel6-x86_64/lib
zeromq_use_lib_rhel7  := $(zeromq_use)/rhel7-x86_64/lib
zeromq_use_lib_rhel8  := $(zeromq_use)/rhel8-x86_64/lib
zeromq_use_lib_rhel9  := $(zeromq_use)/rhel9-x86_64/lib

psalg_use_include:= $(psalg_use)/x86_64-linux-opt
psalg_use_i386   := $(psalg_use)/i386-linux
psalg_use_x86_64 := $(psalg_use)/x86_64-linux
psalg_use_rhel6  := $(psalg_use)/x86_64-rhel6
psalg_use_rhel7  := $(psalg_use)/x86_64-rhel7
psalg_use_rhel8  := $(psalg_use)/x86_64-rhel8
psalg_use_rhel9  := $(psalg_use)/x86_64-rhel9

pdsdata_use_include:= $(pdsdata_use)/x86_64-rhel7-opt
pdsdata_use_i386   := $(pdsdata_use)/i386-linux
pdsdata_use_x86_64 := $(pdsdata_use)/x86_64-linux
pdsdata_use_rhel6  := $(pdsdata_use)/x86_64-rhel6
pdsdata_use_rhel7  := $(pdsdata_use)/x86_64-rhel7
pdsdata_use_rhel8  := $(pdsdata_use)/x86_64-rhel8
pdsdata_use_rhel9  := $(pdsdata_use)/x86_64-rhel9

gsc16ai_use_include := $(gsc16ai_use)/include

aesdriver_use_include := $(aesdriver_use)/include

projects :=

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
      qt

ifneq ($(filter pds, $(rprojects)),)
  projects += \
      acqiris \
      evgr \
      leutron \
      edt \
      epics \
      mysql \
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
      vimba \
      zest \
      gsl \
      pds \
      pdsapp

  pds_use        := release
  pdsapp_use     := release
  timetool_use   := release
else
  projects += \
      epics
  timetool_use   := $(pkg_dist_dir)/10.8.1-p10.1.0/build/timetool
  timetool_use_include    := $(timetool_use)/include
  timetool_use_lib_x86_64 := $(timetool_use)/lib/x86_64-linux-opt
endif

projects += timetool

ifneq ($(filter ami, $(rprojects)),)
  projects += gsl ami
  ami_use := release
endif


