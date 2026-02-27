//go:build linux && amd64 && musl

package iec61850

// #cgo CFLAGS: -I./libiec61850/linux_alpine64/include
// #cgo LDFLAGS: -static-libgcc -static-libstdc++ -L./libiec61850/linux_alpine64/lib -liec61850 -lpthread
import "C"
