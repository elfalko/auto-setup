#!/bin/bash

set -euxo pipefail

du -cha --max-depth=1 . | grep -E "M|G|T"
