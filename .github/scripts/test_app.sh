#!/bin/bash

set -eo pipefail

            
xcodebuild -project Github.xcodeproj \
            -scheme Github \
            -destination platform=iOS\ Simulator,OS=15.2,name=iPhone\ 13 \
            -derivedDataPath Build \
             -enableCodeCoverage YES clean build test CODE_SIGN_IDENTITY="" CODE_SIGNING_REQUIRED=NO

clean test
