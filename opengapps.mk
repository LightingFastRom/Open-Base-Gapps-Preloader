# Open Gapps PreLoaded Please Add To Each Device
ifeq ($(WITH_GAPPS), true)
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
	  GCS \
	  Phonesky \
	  PrebuiltGmsCore \
	  PrebuiltGmsCoreInstantApps \
	  GmsCoreSetupPrebuilt \
	  StorageManagerGoogle
	  
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
		CalendarGooglePrebuilt \
		PrebuiltDeskClockGoogle \
		PrebuiltExchange3Google \
		PrebuiltGmail
	  
	  GAPPS_PACKAGE_OVERRIDES := \
		FaceLock \
		libfilterpack_facedetect \
		GoogleCalendarSyncAdapter \
		GoogleContactsSyncAdapter \
		GoogleContacts \
		CalculatorGoogle \
		CalendarGooglePrebuilt \
		PrebuiltDeskClockGoogle \
		PrebuiltExchange3Google \
		PrebuiltGmail
	endif
	  
	#Add TagGoogle & Wallet If BOARD_HAVE_NFC :=true & DEVICE_SUPPORT_NFC :=true
	ifeq ($(BOARD_HAVE_NFC), true)
	  #Add Google NFC
	  GAPPS_PRODUCT_PACKAGES += \
		TagGoogle
	  
	  GAPPS_PACKAGE_OVERRIDES := \
		TagGoogle
	endif
	  
	#Add GoogleDialer CarrierServices & PrebuiltBugle If BOARD_PROVIDES_LIBRIL :=true
	ifeq ($(BOARD_PROVIDES_LIBRIL), true)
	  #Extra Apps I Really Want In My Custom Rom For Devices With Datalines
	  GAPPS_PRODUCT_PACKAGES += \
		CarrierServices \
		Maps
	  
	  GAPPS_PACKAGE_OVERRIDES := \
		CarrierServices \
		Maps
	endif
	  
	#Add PrebuiltBugle & GoogleDialer If PRODUCT_CHARACTERISTICS :=phone
	ifeq ($(PRODUCT_CHARACTERISTICS), phone)
	  #Extra Apps I Really Want In My Custom Rom For Phone
	  GAPPS_PRODUCT_PACKAGES += \
		PrebuiltBugle \
		GoogleDialer
		
	  GAPPS_PACKAGE_OVERRIDES := \
		PrebuiltBugle \
		GoogleDialer
	  
	  #Add FitnessPrebuilt & Wallet If DEVICE_IS_FOR_GIM :=true
	  ifeq ($(DEVICE_IS_FOR_GIM), true)
		GAPPS_PRODUCT_PACKAGES += \
		  FitnessPrebuilt \
		  Wallet
		
		GAPPS_PACKAGE_OVERRIDES := \
		  FitnessPrebuilt \
		  Wallet
	  endif
	endif
	  
	#Add Drive, Maps & Anyother cool app If DEVICE_SUPPORT_DJ :=true
	ifeq ($(DEVICE_SUPPORT_DJ), true)
	  #Open Gapps PreLoaded Please Add To Each Device
	  GAPPS_VARIANT := nano
	  #Apps I Really Want In My Custom Rom
	  GAPPS_PRODUCT_PACKAGES +=\
		Drive \
		Maps
	  
	  # Setting
	  GAPPS_PACKAGE_OVERRIDES := \
		Drive \
		Maps
		
	  ifeq ($(PRODUCT_CHARACTERISTICS), phone)
		GAPPS_EXCLUDED_PACKAGES := \
		  Maps
	  endif
	else
	  #Open Gapps PreLoaded Please Add To Each Device
	  GAPPS_VARIANT := nano
	  #Apps I Really Want In My Custom Rom
	  GAPPS_PRODUCT_PACKAGES +=\
		LatinImeGoogle \
		GoogleCamera
	  
	  # Setting
	  GAPPS_PACKAGE_OVERRIDES := \
		LatinImeGoogle \
		GoogleCamera
	endif
  endif
  
  $(call inherit-product, vendor/opengapps/build/opengapps-packages.mk)
  
  GAPPS_FORCE_MATCHING_DPI := true
endif