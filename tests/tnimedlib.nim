import nimedlib

proc main() =
    var
        str1: cstring = "The dog bit the wall"
        str2: cstring = "The cat bit the wall"

    var result = edlibAlign(str1, cint(str1.len), str2, cint(str2.len),
            edlibDefaultAlignConfig())
    echo result
    discard

when isMainModule:
    main()


