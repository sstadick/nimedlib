import os

import nimterop/[cimport, git, paths]

const
  baseDir = nimteropBuildDir()/"edlib"
  incl = baseDir/"edlib/include"
  src = baseDir/"edlib/src"

static:
  gitPull("https://github.com/Martinsos/edlib", baseDir, "edlib/include*\nedlib/src/*\n")
  cDebug()
  cDisableCaching()
  cAddStdDir("cpp")
  cAddSearchDir(baseDir)

cIncludeDir(incl)
cCompile(src/"edlib.cpp", "cpp")
cImport incl/"edlib.h" 
