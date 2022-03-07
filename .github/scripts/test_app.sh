#!/bin/bash

set -eo pipefail

xcodebuild -workspace Github.xcodeproj \
            -scheme Github\ iOS \
            -destination platform=iOS\ Simulator,OS=15.0,name=iPhone\ 13 \
            clean test | xcpretty
