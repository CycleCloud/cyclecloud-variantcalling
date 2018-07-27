#!/bin/bash
# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License.

set -ex

INSTALL_DIR=/apps

mkdir -p $INSTALL_DIR

GATK4_VERSION=$(jetpack config gatk4.version)

cd $INSTALL_DIR
jetpack download "gatk-$GATK4_VERSION.zip"
unzip -d $INSTALL_DIR gatk-$GATK4_VERSION.zip

cat > /etc/profile.d/gatk4.sh << FILE
#! /bin/sh
export PATH="$INSTALL_DIR/gatk-$GATK4_VERSION:\$PATH"
FILE

cat > /etc/profile.d/gatk4.csh << FILE
#! /bin/csh
setenv PATH "$INSTALL_DIR/gatk-$GATK4_VERSION:\$PATH"
FILE

# install picard as well, since it's really useful for most workflows
mkdir -p $INSTALL_DIR/picard/
cd $INSTALL_DIR/picard/
jetpack download "picard.jar"
