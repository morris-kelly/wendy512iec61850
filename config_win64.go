//go:build windows && amd64

package iec61850

// #cgo CFLAGS: -I./libiec61850/win64/include
// #cgo LDFLAGS: -static-libgcc -static-libstdc++ -L${SRCDIR}/libiec61850/win64/lib -liec61850 -lhal -lwpcap -lpacket -lws2_32 -liphlpapi
import "C"
