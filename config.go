package iec61850

// this file is used to import all the packages that are needed include cgo files
// if you want to use the cgo files, you should import this file

import (
	_ "github.com/wendy512/iec61850/libiec61850/include"

	_ "github.com/wendy512/iec61850/libiec61850/lib/linux64"
	_ "github.com/wendy512/iec61850/libiec61850/lib/linux_armv7l"
	_ "github.com/wendy512/iec61850/libiec61850/lib/linux_armv8"
	_ "github.com/wendy512/iec61850/libiec61850/lib/win64"
)
