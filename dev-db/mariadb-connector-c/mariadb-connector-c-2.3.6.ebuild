# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=6

inherit cmake-utils

DESCRIPTION="The MariaDB Native Client library (C driver)"
HOMEPAGE="https://downloads.mariadb.org/client-native/"
SRC_URI="https://downloads.mariadb.org/f/connector-c-${PV}/${P}-src.tar.gz"

LICENSE="GPL-2+"
SLOT="2"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-libs/openssl:0"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${P}-src"

src_configure() {
    local mycmakeargs=(
       -DINCLUDE_INSTALL_DIR="include/mariadb2"
    )
	cmake-utils_src_configure
}

src_install() {
	cmake-utils_src_install

	insinto /etc/ld.so.conf.d
	doins "${FILESDIR}/mariadb_client2.conf"

	mv "${ED}/usr/bin/"mariadb{,_client}_config
}
