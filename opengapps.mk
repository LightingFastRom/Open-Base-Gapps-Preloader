# Open Gapps PreLoaded Please Add To Each Device

#Use mini VARIANT If SLIM_THIS_DEVICE :=true
ifeq ($(SLIM_THIS_DEVICE), true)
	GAPPS_VARIANT := mini
else
	GAPPS_VARIANT := nano
	#Common Apps I Really Want In My Custom Rom
	GAPPS_PRODUCT_PACKAGES +=\
			YouTube \
			talkback \
			GoogleBackupTransport \
			GoogleLoginService \
			GooglePartnerSetup \
			GooglePrintRecommendationService \
			GoogleServicesFramework \
			GoogleTTS \
			LatinImeGoogle \
			WebViewGoogle \
			Turbo \
			AndroidPlatformServices \
			Chrome \
			GoogleExtServices \
			GoogleExtShared \
			GoogleFeedback \
			GoogleOneTimeInitializer \
			GooglePackageInstaller \
			Photos \
			SetupWizard \
			GCS \
			Phonesky \
			PrebuiltGmsCore \
			PrebuiltGmsCoreInstantApps \
			GmsCoreSetupPrebuilt \
			StorageManagerGoogle
	
	# Setting
	GAPPS_PACKAGE_OVERRIDES := \
			YouTube \
			talkback \
			GoogleBackupTransport \
			GoogleLoginService \
			GooglePartnerSetup \
			GooglePrintRecommendationService \
			GoogleServicesFramework \
			GoogleTTS \
			LatinImeGoogle \
			WebViewGoogle \
			Turbo \
			AndroidPlatformServices \
			Chrome \
			GoogleExtServices \
			GoogleExtShared \
			GoogleFeedback \
			GoogleOneTimeInitializer \
			GooglePackageInstaller \
			Photos \
			SetupWizard \
			GCS \
			Phonesky \
			PrebuiltGmsCore \
			PrebuiltGmsCoreInstantApps \
			GmsCoreSetupPrebuilt \
			StorageManagerGoogle \
			GooglePrintRecommendationService

	#Add none android tv apps if PRODUCT_CHARACTERISTICS :=phone or PRODUCT_CHARACTERISTICS :=tablet
	ifeq ($(filter phone tablet,$(PRODUCT_CHARACTERISTICS)),)
		#Extra Apps I Really Want In My Custom Rom For Phone
		GAPPS_PRODUCT_PACKAGES += \
				FaceLock \
				libfilterpack_facedetect \
				GoogleCalendarSyncAdapter \
				GoogleContactsSyncAdapter \
				GoogleContacts \
				CalculatorGoogle \
				PixelLauncherIcons \
				CalendarGooglePrebuilt \
				PrebuiltDeskClockGoogle \
				PrebuiltExchange3Google \
				PrebuiltGmail \
				GoogleCamera
				
		GAPPS_PACKAGE_OVERRIDES := \
				FaceLock \
				libfilterpack_facedetect \
				GoogleCalendarSyncAdapter \
				GoogleContactsSyncAdapter \
				GoogleContacts \
				CalculatorGoogle \
				PixelLauncherIcons \
				CalendarGooglePrebuilt \
				PrebuiltDeskClockGoogle \
				PrebuiltExchange3Google \
				PrebuiltGmail \
				GoogleCamera
				
	endif
	
	#Add TagGoogle & Wallet If BOARD_HAVE_NFC :=true & DEVICE_SUPPORT_NFC :=true
	ifeq ($(BOARD_HAVE_NFC), true)
		#Add Google NFC
		GAPPS_PRODUCT_PACKAGES += \
				TagGoogle
	
		GAPPS_PACKAGE_OVERRIDES := \
				TagGoogle
	endif
	
	#Add GoogleDialer CarrierServices & PrebuiltBugle If DEVICE_HAS_DATALINE :=true
	ifeq ($(DEVICE_HAS_DATALINE), true)
		#Extra Apps I Really Want In My Custom Rom For Phone
		GAPPS_PRODUCT_PACKAGES += \
				GoogleDialer \
				CarrierServices \
				PrebuiltBugle \
				Maps
	
		GAPPS_PACKAGE_OVERRIDES := \
				GoogleDialer \
				CarrierServices \
				PrebuiltBugle \
				Maps
	endif
	
	#Add FitnessPrebuilt & Wallet If PRODUCT_CHARACTERISTICS :=phone
	ifeq ($(PRODUCT_CHARACTERISTICS), phone)
		#Extra Apps I Really Want In My Custom Rom For Phone
		GAPPS_PRODUCT_PACKAGES += \
				FitnessPrebuilt \
				Wallet
				
		GAPPS_PACKAGE_OVERRIDES := \
				FitnessPrebuilt \
				Wallet
	endif
	
	#Add Drive, Maps & Anyother cool app If DEVICE_SUPPORT_DJ :=true
	ifeq ($(DEVICE_SUPPORT_DJ), true)
		#Open Gapps PreLoaded Please Add To Each Device
		GAPPS_VARIANT := nano
		#Apps I Really Want In My Custom Rom
		GAPPS_PRODUCT_PACKAGES +=\
				Drive \
				Maps \
				PixelLauncherIcons
	
		# Setting
		GAPPS_PACKAGE_OVERRIDES := \
				Drive \
				Maps \
				PixelLauncherIcons
	endif
endif

$(call inherit-product, vendor/opengapps/build/opengapps-packages.mk)

GAPPS_FORCE_MATCHING_DPI := true
