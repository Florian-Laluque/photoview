--- vendor/github.com/Kagami/go-face/face.go.orig	2023-03-29 23:49:55 UTC
+++ vendor/github.com/Kagami/go-face/face.go
@@ -1,6 +1,6 @@
 package face
 
-// #cgo CXXFLAGS: -std=c++1z -Wall -O3 -DNDEBUG -march=native
+// #cgo CXXFLAGS: -std=c++1z -Wall -O3 -DNDEBUG
 // #cgo LDFLAGS: -ldlib -lblas -lcblas -llapack -ljpeg
 // #include <stdlib.h>
 // #include <stdint.h>
