#!/bin/bash
# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License.

set -ex

platform=$(jetpack config platform_family)

case $platform in
    rhel)
        yum install -y java-1.8.0-openjdk
        ;;
    ubuntu)
        apt-get install -y openjdk-8-jre
        ;;
    *)
        echo "Unsupported platform."
        exit 1
esac

