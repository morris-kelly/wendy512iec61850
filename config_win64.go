//go:build windows && amd64

package iec61850

// #cgo CFLAGS: -I./libiec61850/include
// #cgo LDFLAGS: -static-libgcc -static-libstdc++ -L./libiec61850/lib/win64 -liec61850 -lws2_32
import "C"
