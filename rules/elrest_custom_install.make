# -*-makefile-*-
#
# Copyright by
#
# See CREDITS for details about who has contributed to this project.
#
# For further information about the PTXdist project and license conditions
# see the README file.
#

#
# We provide this package
#
PACKAGES-$(PTXCONF_ELREST_CUSTOM_INSTALL) += elrest-custom-install
 
# dummy to make ipkg happy
ELREST_CUSTOM_INSTALL_VERSION	:= 1.0.2

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/elrest-custom-install.targetinstall:
	@$(call targetinfo)
	@$(call install_init,  elrest-custom-install)
	@$(call install_fixup, elrest-custom-install,PRIORITY,optional)
	@$(call install_fixup, elrest-custom-install,SECTION,base)
	@$(call install_fixup, elrest-custom-install,AUTHOR,"Ralf Gliese <gliese@elrest.de>")
	@$(call install_fixup, elrest-custom-install,DESCRIPTION,missing)

ifdef PTXCONF_ELREST_CUSTOM_INIT_FILES_INSTALL
	@$(call install_alternative, elrest-custom-install, 0, 0, 0755, /etc/init.d/touchcal)
	@$(call install_alternative, elrest-custom-install, 0, 0, 0755, /etc/init.d/basyskom)
	@$(call install_link, elrest-custom-install, ../init.d/touchcal, /etc/rc.d/S88touchcal)
	@$(call install_alternative, elrest-custom-install, 0, 0, 0755, /etc/init.d/start_panel)
	@$(call install_link, elrest-custom-install, ../init.d/start_panel, /etc/rc.d/S91start_panel)
	@$(call install_alternative, elrest-custom-install, 0, 0, 0755, /etc/init.d/can-networking)
	@$(call install_link, elrest-custom-install, ../init.d/can-networking, /etc/rc.d/S60can-networking)
endif

ifdef PTXCONF_ELREST_CUSTOM_PROFILE_FILES_INSTALL
###	@$(call install_alternative, elrest-custom-install, 0, 0, 0644, /etc/profile)
	@$(call install_alternative, elrest-custom-install, 0, 0, 0644, /etc/profile_res_0)
	@$(call install_alternative, elrest-custom-install, 0, 0, 0644, /etc/profile_res_cw)
	@$(call install_alternative, elrest-custom-install, 0, 0, 0644, /etc/profile_res_ud)
	@$(call install_alternative, elrest-custom-install, 0, 0, 0644, /etc/profile_res_ccw)
	@$(call install_alternative, elrest-custom-install, 0, 0, 0644, /etc/profile_cap_0)
	@$(call install_alternative, elrest-custom-install, 0, 0, 0644, /etc/profile_cap_cw)
	@$(call install_alternative, elrest-custom-install, 0, 0, 0644, /etc/profile_cap_ud)
	@$(call install_alternative, elrest-custom-install, 0, 0, 0644, /etc/profile_cap_ccw)
###	@$(call install_alternative, elrest-custom-install, 0, 0, 0644, /etc/profile.environment)
endif

ifdef PTXCONF_ELREST_CUSTOM_TS_CONF_FILES_INSTALL
	@$(call install_alternative, elrest-custom-install, 0, 0, 0644, /etc/ts.conf)
endif
  
ifdef PTXCONF_ELREST_CUSTOM_UDEV_RULES_INSTALL
	@$(call install_alternative, elrest-custom-install, 0, 0, 0644, /etc/udev/udev.conf)
	@$(call install_alternative, elrest-custom-install, 0, 0, 0644, /lib/udev/rules.d/60-touchscreen.rules)
	@$(call install_alternative, elrest-custom-install, 0, 0, 0644, /lib/udev/rules.d/61-qt1070.rules)
	@$(call install_alternative, elrest-custom-install, 0, 0, 0644, /lib/udev/rules.d/62-si1142.rules)
	@$(call install_alternative, elrest-custom-install, 0, 0, 0644, /lib/udev/rules.d/63-gpio-keys.rules)
	@$(call install_alternative, elrest-custom-install, 0, 0, 0644, /lib/udev/rules.d/63-gpio-keys-polled.rules)
	@$(call install_alternative, elrest-custom-install, 0, 0, 0644, /lib/udev/rules.d/64-captouch.rules)
	@$(call install_alternative, elrest-custom-install, 0, 0, 0644, /lib/udev/rules.d/96-change-ttymxc-permissions.rules)
endif

ifdef PTXCONF_ELREST_CUSTOM_XORG_CONFIG_INSTALL
	@$(call install_alternative, elrest-custom-install, 0, 0, 0755, /etc/X11/xorg_480_272.conf)
	@$(call install_alternative, elrest-custom-install, 0, 0, 0755, /etc/X11/xorg_480_272_CW.conf)
	@$(call install_alternative, elrest-custom-install, 0, 0, 0755, /etc/X11/xorg_480_272_CCW.conf)
	@$(call install_alternative, elrest-custom-install, 0, 0, 0755, /etc/X11/xorg_480_272_UD.conf)
	@$(call install_alternative, elrest-custom-install, 0, 0, 0755, /etc/X11/xorg_640_480.conf)
	@$(call install_alternative, elrest-custom-install, 0, 0, 0755, /etc/X11/xorg_640_480_CW.conf)
	@$(call install_alternative, elrest-custom-install, 0, 0, 0755, /etc/X11/xorg_640_480_CCW.conf)
	@$(call install_alternative, elrest-custom-install, 0, 0, 0755, /etc/X11/xorg_640_480_UD.conf)
	@$(call install_alternative, elrest-custom-install, 0, 0, 0755, /etc/X11/xorg_800_480.conf)
	@$(call install_alternative, elrest-custom-install, 0, 0, 0755, /etc/X11/xorg_800_480_CW.conf)
	@$(call install_alternative, elrest-custom-install, 0, 0, 0755, /etc/X11/xorg_800_480_CCW.conf)
	@$(call install_alternative, elrest-custom-install, 0, 0, 0755, /etc/X11/xorg_800_480_UD.conf)
	@$(call install_alternative, elrest-custom-install, 0, 0, 0755, /etc/X11/xorg_1280_800.conf)
	@$(call install_alternative, elrest-custom-install, 0, 0, 0755, /etc/X11/xorg_1280_800_CW.conf)
	@$(call install_alternative, elrest-custom-install, 0, 0, 0755, /etc/X11/xorg_1280_800_CCW.conf)
	@$(call install_alternative, elrest-custom-install, 0, 0, 0755, /etc/X11/xorg_1280_800_UD.conf)
	@$(call install_alternative, elrest-custom-install, 0, 0, 0755, /etc/X11/xorg_cap_800_480.conf)
	@$(call install_alternative, elrest-custom-install, 0, 0, 0755, /etc/X11/xorg_cap_800_480_CW.conf)
	@$(call install_alternative, elrest-custom-install, 0, 0, 0755, /etc/X11/xorg_cap_800_480_CCW.conf)
	@$(call install_alternative, elrest-custom-install, 0, 0, 0755, /etc/X11/xorg_cap_800_480_UD.conf)
	@$(call install_alternative, elrest-custom-install, 0, 0, 0755, /etc/X11/xorg_cap_1280_800.conf)
	@$(call install_alternative, elrest-custom-install, 0, 0, 0755, /etc/X11/xorg_cap_1280_800_CW.conf)
	@$(call install_alternative, elrest-custom-install, 0, 0, 0755, /etc/X11/xorg_cap_1280_800_CCW.conf)
	@$(call install_alternative, elrest-custom-install, 0, 0, 0755, /etc/X11/xorg_cap_1280_800_UD.conf)
	@$(call install_link, elrest-custom-install, /etc/X11/xorg_800_480.conf, /etc/X11/xorg.conf)
	@$(call install_alternative, elrest-custom-install, 0, 0, 0755, /usr/bin/startx)
endif

ifdef PTXCONF_ELREST_CUSTOM_PEKWM_CONFIG_INSTALL
	@$(call install_alternative, elrest-custom-install, 0, 0, 0644, /home/.pekwm/autoproperties)
	@$(call install_alternative, elrest-custom-install, 0, 0, 0644, /home/.pekwm/config)
	@$(call install_alternative, elrest-custom-install, 0, 0, 0644, /home/.pekwm/desktop)
	@$(call install_alternative, elrest-custom-install, 0, 0, 0644, /home/.pekwm/history)
	@$(call install_alternative, elrest-custom-install, 0, 0, 0644, /home/.pekwm/keys)
	@$(call install_alternative, elrest-custom-install, 0, 0, 0644, /home/.pekwm/menu)
	@$(call install_alternative, elrest-custom-install, 0, 0, 0644, /home/.pekwm/mouse)
	@$(call install_alternative, elrest-custom-install, 0, 0, 0755, /home/.pekwm/start)
	@$(call install_alternative, elrest-custom-install, 0, 0, 0644, /home/.pekwm/vars)
	@$(call install_alternative, elrest-custom-install, 0, 0, 0755, /home/.xinitrc)
	@$(call install_link, elrest-custom-install, /home/.xinitrc, /root/.xinitrc)
	rm -Rf $(BUILDDIR)/../root-debug/etc/pekwm && rm -Rf $(BUILDDIR)/../root-debug/.pekwm && rm -Rf $(BUILDDIR)/../root-debug/root/.pekwm && \
	rm -Rf $(ROOTDIR)/etc/pekwm && rm -Rf $(ROOTDIR)/.pekwm && rm -Rf $(ROOTDIR)/root/.pekwm
	@$(call install_link, elrest-custom-install, /home/.pekwm, /.pekwm)
	@$(call install_link, elrest-custom-install, /home/.pekwm, /etc/pekwm)
	@$(call install_link, elrest-custom-install, /home/.pekwm, /root/.pekwm) 
endif

ifdef PTXCONF_ELREST_CUSTOM_FLUXBOX_CONFIG_INSTALL
	@$(call install_alternative, elrest-custom-install, 0, 0, 0755, /root/.xinitrc)
	@$(call install_alternative_tree, elrest-custom-install, 0, 0,  /root/.fluxbox)
endif

ifdef PTXCONF_ELREST_CUSTOM_WEBKIT_CONFIG_INSTALL
	@$(call install_alternative, elrest-custom-install, 0, 0, 0644, /home/webview_style.css)
	@$(call install_link, elrest-custom-install, /home/webview_style.css, /root/webview_style.css)
	@$(call install_copy, elrest-custom-install, 0, 0, 0755, /usr/lib/browser/plugins)
	@$(call install_link, elrest-custom-install, /usr/lib/jvm/ejre1.7.0_10/lib/arm/libnpjp2.so, /usr/lib/browser/plugins/libnpjp2.so)   
	@$(call install_alternative, elrest-custom-install, 0, 0, 0755, /home/webview_style.css)
	@$(call install_link, elrest-custom-install, /home/webview_style.css,/root/webview_style.css)
endif

ifdef PTXCONF_CDS3_RTS_FEATURE_TARGETVISU
	@$(call install_alternative, elrest-custom-install, 0, 0, 0644, /etc/codesys3.d/CmpTargetvisu.cfg)
endif

ifdef PTXCONF_ELREST_CUSTOM_USER_FILES_INSTALL
	@$(call install_alternative, elrest-custom-install, 0, 0, 0666, /home/user/logo.png)
endif

ifdef PTXCONF_ELREST_CUSTOM_CONFIG_FILES_INSTALL
	@$(call install_copy, elrest-custom-install, 0, 0, 0755, /etc/config-tools);

	@$(call install_alternative, elrest-custom-install, 0, 0, 0754, /etc/script/start_application.sh)
	@$(call install_alternative, elrest-custom-install, 0, 0, 0755, /etc/config-tools/brightnesscontrol)
	@$(call install_alternative, elrest-custom-install, 0, 0, 0755, /etc/config-tools/start_displaycleaning)
	@$(call install_alternative, elrest-custom-install, 0, 0, 0755, /etc/config-tools/start_touchcalib)
	@$(call install_alternative, elrest-custom-install, 0, 0, 0755, /etc/config-tools/start_screensaver)
	@$(call install_alternative, elrest-custom-install, 0, 0, 0755, /etc/config-tools/get_pointercal)
	@$(call install_alternative, elrest-custom-install, 0, 0, 0755, /etc/config-tools/config_pointercal)
	@$(call install_alternative, elrest-custom-install, 0, 0, 0755, /etc/config-tools/testbacklight)
	@$(call install_alternative, elrest-custom-install, 0, 0, 0755, /etc/script/wndactivate.sh)
	@$(call install_alternative, elrest-custom-install, 0, 0, 0754, /etc/script/start_calibration.sh)
	@$(call install_alternative, elrest-custom-install, 0, 0, 0754, /etc/script/start_panel.sh)
	@$(call install_alternative, elrest-custom-install, 0, 0, 0754, /etc/script/start_wbm.sh)
	@$(call install_alternative, elrest-custom-install, 0, 0, 0754, /etc/script/start_webbrowser.sh)
	@$(call install_alternative, elrest-custom-install, 0, 0, 0754, /etc/script/start_plclist.sh)
	@$(call install_alternative, elrest-custom-install, 0, 0, 0754, /etc/script/start_codesys3.sh)
	@$(call install_alternative, elrest-custom-install, 0, 0, 0754, /etc/script/start_targetvisu.sh)
	@$(call install_alternative, elrest-custom-install, 0, 0, 0666, /etc/specific/audio.conf)
	@$(call install_alternative, elrest-custom-install, 0, 0, 0666, /etc/specific/autostart.conf)
	@$(call install_alternative, elrest-custom-install, 0, 0, 0666, /etc/specific/backlight.conf)
	@$(call install_alternative, elrest-custom-install, 0, 0, 0666, /etc/specific/bootsettings.conf)
	@$(call install_alternative, elrest-custom-install, 0, 0, 0666, /etc/specific/display.conf)
	@$(call install_alternative, elrest-custom-install, 0, 0, 0666, /etc/specific/motionsensor.conf)
	@$(call install_alternative, elrest-custom-install, 0, 0, 0666, /etc/specific/plcselect.conf)
	@$(call install_alternative, elrest-custom-install, 0, 0, 0666, /etc/specific/screen.conf)
	@$(call install_alternative, elrest-custom-install, 0, 0, 0666, /etc/specific/touchbeeper.conf)
	@$(call install_alternative, elrest-custom-install, 0, 0, 0666, /etc/specific/gesture.conf)
	@$(call install_alternative, elrest-custom-install, 0, 0, 0666, /etc/specific/qtstyle.conf)
	@$(call install_alternative, elrest-custom-install, 0, 0, 0666, /etc/specific/menuqt.xml)
	@$(call install_alternative, elrest-custom-install, 0, 0, 0666, /etc/specific/fonts.conf)
	@$(call install_alternative, elrest-custom-install, 0, 0, 0666, /etc/specific/isconfigured.conf)
	@$(call install_alternative, elrest-custom-install, 0, 0, 0666, /etc/specific/eruntime.conf)
#	@$(call install_alternative, elrest-custom-install, 0, 0, 0666, /etc/specific/rtsversion)
	@$(call install_alternative, elrest-custom-install, 0, 0, 0666, /etc/specific/testability.conf)
	@$(call install_alternative, elrest-custom-install, 0, 0, 0666, /etc/specific/virtualkeyboard.conf)
	@$(call install_alternative, elrest-custom-install, 0, 0, 0644, /etc/specific/virtualkeyboard.xml)
	@$(call install_alternative, elrest-custom-install, 0, 0, 0644, /etc/specific/virtualkeyboard_272x480.xml)
	@$(call install_alternative, elrest-custom-install, 0, 0, 0666, /etc/specific/browsersecurity.conf)
	@$(call install_alternative, elrest-custom-install, 0, 0, 0644, /etc/specific/enter.png)
	@$(call install_alternative, elrest-custom-install, 0, 0, 0644, /etc/specific/bksp.png)
	@$(call install_alternative, elrest-custom-install, 0, 0, 0644, /etc/specific/ico-up.png)
	@$(call install_alternative, elrest-custom-install, 0, 0, 0644, /etc/specific/ico-down.png)
	@$(call install_alternative, elrest-custom-install, 0, 0, 0644, /etc/specific/ico-right.png)
	@$(call install_alternative, elrest-custom-install, 0, 0, 0644, /etc/specific/ico-left.png)
	@$(call install_alternative, elrest-custom-install, 0, 0, 0666, /etc/specific/dipvalue-on-reset)
	@$(call install_alternative_tree, elrest-custom-install, 0, 0,  /etc/specific/webengine)
	@$(call install_alternative_tree, elrest-custom-install, 0, 0,  /root/.config)
  
# only temporarily   TODO remove later
	@$(call install_alternative, elrest-custom-install, 0, 0, 0666, /etc/specific/network-interfaces-with-modem.xml)
	@$(call install_alternative, elrest-custom-install, 0, 0, 0666, /etc/specific/network-interfaces-default.xml)

	@$(call install_alternative, elrest-custom-install, 0, 0, 0644, /etc/directfbrc)
	@$(call install_alternative, elrest-custom-install, 0, 0, 0777, /etc/config-tools/brightnesscontrol)
	@$(call install_alternative, elrest-custom-install, 0, 0, 0777, /etc/config-tools/start_displaycleaning)
	@$(call install_alternative, elrest-custom-install, 0, 0, 0777, /etc/config-tools/start_touchcalib)

	@$(call install_alternative, elrest-custom-install, 0, 0, 0644, /etc/bootscreen/bootscreen_0_480.png)
	@$(call install_alternative, elrest-custom-install, 0, 0, 0644, /etc/bootscreen/bootscreen_0_640.png)
	@$(call install_alternative, elrest-custom-install, 0, 0, 0644, /etc/bootscreen/bootscreen_0_800.png)
	@$(call install_alternative, elrest-custom-install, 0, 0, 0644, /etc/bootscreen/bootscreen_0_1280.png)
	@$(call install_alternative, elrest-custom-install, 0, 0, 0644, /etc/bootscreen/bootscreen_cw_480.png)
	@$(call install_alternative, elrest-custom-install, 0, 0, 0644, /etc/bootscreen/bootscreen_cw_640.png)
	@$(call install_alternative, elrest-custom-install, 0, 0, 0644, /etc/bootscreen/bootscreen_cw_800.png)
	@$(call install_alternative, elrest-custom-install, 0, 0, 0644, /etc/bootscreen/bootscreen_cw_1280.png)
	@$(call install_alternative, elrest-custom-install, 0, 0, 0644, /etc/bootscreen/bootscreen_ud_480.png)
	@$(call install_alternative, elrest-custom-install, 0, 0, 0644, /etc/bootscreen/bootscreen_ud_640.png)
	@$(call install_alternative, elrest-custom-install, 0, 0, 0644, /etc/bootscreen/bootscreen_ud_800.png)
	@$(call install_alternative, elrest-custom-install, 0, 0, 0644, /etc/bootscreen/bootscreen_ud_1280.png)
	@$(call install_alternative, elrest-custom-install, 0, 0, 0644, /etc/bootscreen/bootscreen_ccw_480.png)
	@$(call install_alternative, elrest-custom-install, 0, 0, 0644, /etc/bootscreen/bootscreen_ccw_640.png)
	@$(call install_alternative, elrest-custom-install, 0, 0, 0644, /etc/bootscreen/bootscreen_ccw_800.png)
	@$(call install_alternative, elrest-custom-install, 0, 0, 0644, /etc/bootscreen/bootscreen_ccw_1280.png)
endif

ifdef PTXCONF_ELREST_CUSTOM_PLCLIST
	@$(call install_alternative_tree, elrest-custom-install, 0, 0,  /var/www/plclist)
	@$(call install_alternative, elrest-custom-install, 0, 0, 0755, /etc/init.d/filewatcher)
	@$(call install_alternative, elrest-custom-install, 0, 0, 0755, /etc/script/init_filewatch.sh)
	@$(call install_alternative, elrest-custom-install, 0, 0, 0755, /etc/script/generate_plclist.php)
	@$(call install_alternative, elrest-custom-install, 0, 0, 0755, /etc/rc.once.d/initial_plclist_generation)
	@$(call install_link, elrest-custom-install, ../init.d/filewatcher, /etc/rc.d/S71_filewatcher)
endif

ifdef PTXCONF_ELREST_CUSTOM_WBM
	@$(call install_alternative_tree, elrest-custom-install, 0, 0,  /var/www/wbm)
endif

ifdef PTXCONF_ELREST_CUSTOM_TTF_INSTALL
	@$(call install_alternative_tree, elrest-custom-install, 0, 0,  /usr/share/fonts/X11/truetype/liberation)
	@$(call install_alternative_tree, elrest-custom-install, 0, 0,  /usr/share/fonts/X11/truetype/freefont)
	@$(call install_alternative_tree, elrest-custom-install, 0, 0,  /usr/share/fonts/X11/truetype/other)
endif

ifdef PTXCONF_ELREST_CUSTOM_PTE_INSTALL

	@$(call install_alternative, elrest-custom-install, 0, 0, 0666, /etc/specific/typelabel)

endif

ifdef PTXCONF_ELREST_CUSTOM_HEADER_FILES_INSTALL
	@install -D -m644 $(BUILDDIR)/../../projectroot.vtp-ctp/usr/include/pfc-startup.h $(PTXCONF_SYSROOT_TARGET)/usr/include
	@install -D -m644 $(BUILDDIR)/../../projectroot.vtp-ctp/usr/include/pfc_boot_table.h $(PTXCONF_SYSROOT_TARGET)/usr/include
endif

ifdef PTXCONF_ELREST_CUSTOM_ROOT_DIRECTORIES_INSTALL
	@$(call install_copy, elrest-custom-install, 0, 0, 0755, /log)
	@$(call install_copy, elrest-custom-install, 0, 0, 0755, /settings)
endif

# not clear if this feature is finally needed
#	@$(call install_alternative, elrest-custom-install, 0, 0, 0755, /etc/init.d/flush_eth0)
#	@$(call install_link, elrest-custom-install, ../init.d/flush_eth0, /etc/rc.d/S70_flush_eth0)

	@$(call install_finish, elrest-custom-install)
	@$(call touch)

# vim: syntax=make
