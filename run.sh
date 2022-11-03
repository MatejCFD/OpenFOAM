#!/bin/bash

foamListTimes -rm
blockMesh | tee log.blockMesh
checkMesh | tee log.checkMesh
renumberMesh -overwrite -noFunctionObjects | tee log.renumbermesh
pyFoamPlotRunner.py pimpleFoam
pimpleFoam -postProcess -func yPlus -latestTime -noFunctionObjects | tee log.yPlus
foamToVTK
