# Package

version       = "0.1.0"
author        = "Seth Stadick"
description   = "Nim wrapper for Edlib"
license       = "MIT"

skipDirs = @["tests"]


# Dependencies

requires "nim >= 0.19.4"
requires "nimgen >= 0.5.0"

var
  name = "nimedlib"
  cmd = when defined(Windows): "cmd /c " else: ""

mkDir(name)

task setup, "Checkout and generate":
  if gorgeEx(cmd & "nimgen").exitCode != 0:
    withDir(".."):
      exec "nimble install nimgen -y"
  exec cmd & "nimgen " & name & ".cfg"

before install:
  setupTask()

task test, "Run tests":
  exec "nim cpp -r tests/t" & name & ".nim"