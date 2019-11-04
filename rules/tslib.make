# -*-makefile-*-
#
# Copyright (C) 2005 by Sascha Hauer
#               2007-2008 by Marc Kleine-Budde <mkl@pengutronix.de>
#
# See CREDITS for details about who has contributed to this project.
#
# For further information about the PTXdist project and license conditions
# see the README file.
#

#
# We provide this package
#
PACKAGES-$(PTXCONF_TSLIB) += tslib

#
# Paths and names
#
TSLIB_VERSION	:= 1.16
TSLIB_MD5	:= 22adf05cb3f828889bbb329a505b3847
TSLIB		:= tslib-$(TSLIB_VERSION)
TSLIB_SUFFIX	:= tar.bz2
TSLIB_URL	:= http://www.pengutronix.de/software/ptxdist/temporary-src/$(TSLIB).$(TSLIB_SUFFIX)
TSLIB_SOURCE	:= $(SRCDIR)/$(TSLIB).$(TSLIB_SUFFIX)
TSLIB_DIR	:= $(BUILDDIR)/$(TSLIB)

# ----------------------------------------------------------------------------
# Get
# ----------------------------------------------------------------------------

$(TSLIB_SOURCE):
	@$(call targetinfo)
	@$(call get, TSLIB)

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

TSLIB_PATH	:= PATH=$(CROSS_PATH)
TSLIB_ENV 	:= $(CROSS_ENV)

#
# autoconf
#
TSLIB_AUTOCONF := $(CROSS_AUTOCONF_USR)

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/tslib.targetinstall:
	@$(call targetinfo)

	@$(call install_init, tslib)
	@$(call install_fixup, tslib,PRIORITY,optional)
	@$(call install_fixup, tslib,SECTION,base)
	@$(call install_fixup, tslib,AUTHOR,"Robert Schwebel <r.schwebel@pengutronix.de>")
	@$(call install_fixup, tslib,DESCRIPTION,missing)

	@$(call install_alternative, tslib, 0, 0, 0644, \
		/etc/ts.conf)

	@$(call install_copy, tslib, 0, 0, 0644, -, /usr/lib/libts.so.0.9.1)
	@$(call install_link, tslib, /usr/lib/libts.so.0.9.1, /usr/lib/libts-0.0.so.0)
	@$(call install_link, tslib, /usr/lib/libts.so.0.9.1, /usr/lib/libts.so)
	@$(call install_link, tslib, /usr/lib/libts.so.0.9.1, /usr/lib/libts.so.0)
	
ifdef PTXCONF_TSLIB_TS_CALIBRATE
	@$(call install_copy, tslib, 0, 0, 0755, -, /usr/bin/ts_calibrate)
endif
ifdef PTXCONF_TSLIB_TS_TEST
	@$(call install_copy, tslib, 0, 0, 0755, -, /usr/bin/ts_test)
	@$(call install_copy, tslib, 0, 0, 0755, -, /usr/bin/ts_test_mt)
	@$(call install_copy, tslib, 0, 0, 0755, -, /usr/bin/ts_print)
	@$(call install_copy, tslib, 0, 0, 0755, -, /usr/bin/ts_print_mt)
	@$(call install_copy, tslib, 0, 0, 0755, -, /usr/bin/ts_print_raw)
	@$(call install_copy, tslib, 0, 0, 0755, -, /usr/bin/ts_finddev)
	@$(call install_copy, tslib, 0, 0, 0755, -, /usr/bin/ts_harvest)
	@$(call install_copy, tslib, 0, 0, 0755, -, /usr/bin/ts_uinput)
	@$(call install_copy, tslib, 0, 0, 0755, -, /usr/bin/ts_verify)
endif

	@cd $(TSLIB_PKGDIR) && for plugin in `find usr/lib/ts -name "*.so"`; do \
		$(call install_copy, tslib, 0, 0, 0644, -, /$$plugin); \
	done

	@$(call install_finish, tslib)

	@$(call touch)

# vim: syntax=make