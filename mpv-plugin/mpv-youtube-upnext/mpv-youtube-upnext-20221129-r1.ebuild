# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
MPV_REQ_USE="lua"
USE_MPV="rdepend"
inherit mpv-plugin

DESCRIPTION="Play upcoming videos from YouTube."
HOMEPAGE="https://github.com/cvzi/mpv-youtube-upnext"
SHA="cfc0f79e2e5e423d2899b997c9ac0785e175038b"
SRC_URI="https://github.com/cvzi/${PN}/archive/${SHA}.tar.gz -> ${P}.tar.gz"

LICENSE="ISC"
SLOT="0"
KEYWORDS="~amd64 ~ppc64"

MPV_PLUGIN_FILES=(
	${PN:4}.lua
)

S="${WORKDIR}/${PN}-${SHA}"

src_install() {
	mpv-plugin_src_install
	insinto /usr/$(get_libdir)/mpv
	doins ${PN:4}.conf
	if use autoload; then
		keepdir /etc/mpv/script-opts
		dosym ../../../usr/$(get_libdir)/mpv/${PN:4}.conf /etc/mpv/script-opts/${PN:4}.conf
	fi
}