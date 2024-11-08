//go:build darwin && arm64

package iec61850

// #cgo CFLAGS: -I./libiec61850/include
// #cgo LDFLAGS: -static-libstdc++ -L./libiec61850/lib/darwin_armv8 -liec61850 -lpthread
import "C"
