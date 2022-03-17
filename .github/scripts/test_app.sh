#!/bin/bash

set -eo pipefail
            
xcodebuild -project Github.xcodeproj/ -scheme Github -derivedDataPath Build/ -enableCodeCoverage YES clean build test CODE_SIGN_IDENTITY="" CODE_SIGNING_REQUIRED=NO

clean test
