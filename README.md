# nimedlib

A Nim wrapper for the [Edlib](https://github.com/Martinsos/edlib) library.

## Synopsis

Edlib is an awesome library for doing non-affine-gap alignments. The venerable lh3 calls it [very fast](https://github.com/lh3/ksw2#alternative-libraries). I'm sure there is some smoothing to be done to make this more ergonimic (sic).

## Install

This will be pushed to nimble once I've bombproofed it a bit.

```bash
git clone <this dir>
cd nimedlib
nimble install
```

## Usage

```nim
import nimedlib

proc main() =
    var
        str1: cstring = "The dog bit the wall"
        str2: cstring = "The cat bit the wall"

    var result = edlibAlign(str1, cint(str1.len), str2, cint(str2.len),
            edlibDefaultAlignConfig())
    # May need to call edlibFreeAlignResult()
    echo result

when isMainModule:
    main()
```

Run with

```bash
nim cpp -r align_test.nim
```
## Notes to future self

This was built with nimterop. It was very slick once I realized i needed to compile the nim programs that use the library with cpp. I initially started with a versino using nimgen, which can be found in the inital commit, and works if you run with cpp. 10/10, nim binding to C is a pleasure.
