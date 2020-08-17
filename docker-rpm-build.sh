#!/bin/bash
# Copyright 2015-2016 jitakirin
#
# This file is part of docker-rpmbuild.
#
# docker-rpmbuild is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# docker-rpmbuild is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with docker-rpmbuild.  If not, see <http://www.gnu.org/licenses/>.

SPEC="${1:?}"
TOPDIR="${HOME}/rpmbuild"

# copy sources and spec into rpmbuild's work dir
cp -a --reflink=auto * "${TOPDIR}/SOURCES/"
cp -a --reflink=auto "${SPEC}" "${TOPDIR}/SPECS/"
SPEC="${TOPDIR}/SPECS/${SPEC##*/}"

# build the RPMs
spectool --get-files --directory="${TOPDIR}/SOURCES/" "${SPEC}"
rpmbuild -ba "${SPEC}"
