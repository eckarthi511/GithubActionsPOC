#!/bin/bash

set -eo pipefail

xcodebuild -project Github.xcodeproj \
            -scheme Github \
            -destination platform=iOS\ Simulator,OS=15.0,name=iPhone\ 13 \
            clean test
