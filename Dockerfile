# Copyright (c) Bosch Software Innovations GmbH 2016.
# Part of the SW360 Portal Project.
#
# SPDX-License-Identifier: EPL-1.0
#
# All rights reserved. This program and the accompanying materials
# are made available under the terms of the Eclipse Public License v1.0
# which accompanies this distribution, and is available at
# http://www.eclipse.org/legal/epl-v10.html

# This can be used to compile SW360 via:
# $ docker build -f sw360dev.Dockerfile -t sw360/sw360dev --rm=true --force-rm=true .
# $ docker run -i -v $(pwd):/sw360portal -w /sw360portal --net=host sw360/sw360dev su-exec $(id -u):$(id -g) mvn package -DskipTests

FROM maven:3.5.0-jdk-8
MAINTAINER Andreas Greimel <andreas.greimel@tngtech.com>

ADD install-thrift.sh /install-thrift.sh
RUN set -x \
 && apt-get update \
 && apt-get install -y git \
 && chmod +x /install-thrift.sh \
 && /install-thrift.sh \
 && rm -rf /var/lib/apt/lists/*

CMD /bin/bash