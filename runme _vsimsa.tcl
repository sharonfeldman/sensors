# (c) Aldec, Inc.
# All rights reserved.
#
# Last modified: $Date: 2013-09-17 15:37:59 +0200 (Tue, 17 Sep 2013) $
# $Revision: 289208 $
set sscripter tcl
# set project working directory
#cd C:/Aldec/Riviera-PRO-2017.10-x64/examples/vhdl/osvvm/sensors
# load procedures and variables
source C:/Aldec/Riviera-PRO-2017.10-x64/examples/commonscripts/procedures.do
source src/variables.do

# create project library and clear its contents
createWorklib sensors

# compile project's source files
acom -dbg src/sensors.vhd  

# initialize simulation
# Intelligent: set to true/false to enable/disable intelligent coverage
# DataSDinc: sensor data standard deviation increment
asim -GIntelligent=true -GDataSDinc=3.0 $topLevel
#asim -GIntelligent=False -GDataSDinc=0.0 $topLevel
#asim -GIntelligent=True -GDataSDinc=5.0 $topLevel

# log or add signals to Waveform Viewer
logOrWave $signalList

# advance simulation
run $runTime

# uncomment following line to terminate simulation automatically from script
#endsim
