# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

DESCRIPTION="CLI tool that pipes video streams from services like twitch.tv into a video player"
HOMEPAGE="https://github.com/chrippa/livestreamer"
SRC_URI="https://github.com/chrippa/livestreamer/archive/v${PV}.tar.gz -> ${P}.tar.gz"

PYTHON_COMPAT=( python{2_7,3_4} ) # singledispatch, which is not in portage, is required for python 3.3
inherit distutils-r1

KEYWORDS="~amd64 ~mips ~x86"
LICENSE="Apache-2.0 BSD-2 MIT-with-advertising"
SLOT="0"

RDEPEND="dev-python/pycrypto[${PYTHON_USEDEP}]
	>=dev-python/requests-1.0[${PYTHON_USEDEP}]
	>media-video/rtmpdump-2.4"
DEPEND="${RDEPEND}"
