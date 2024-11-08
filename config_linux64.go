//go:build linux && amd64

package iec61850

// #cgo CFLAGS: -I./libiec61850/include
// #cgo LDFLAGS: -static-libgcc -static-libstdc++ -L./libiec61850/lib/linux64 -liec61850 -lpthread
import "C"
