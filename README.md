Open Base Gapps Pre Loader
-----------------------------------
Allow you to replace all stock system in any custom rom with there google counterpart when building a custom rom it a sort of a 1 to 1 for most apps

# How to add it to your build
Creat new file called **OpenGapps.xml** & add the code below
######
    <?xmlversion="1.0"encoding="UTF-8"?>
    <manifest>
    <remote name="opengapps"
    	   fetch="https://github.com/opengapps/"
    	   sync-c="true"
    	   sync-j="4"
    />
    <remote name="nezor"
    	   fetch="https://gitlab.nezorfla.me/opengapps/"
    	   sync-c="true"
    	   sync-j="4"
    />
    
    <project path="vendor/opengapps/build" name="aosp_build" revision="master" remote="opengapps" />
    
    <project path="vendor/opengapps/sources/all" name="all" clone-depth="1" revision="master" remote="nezor" />
    
    <!--arm64dependsonarm-->
    <project path="vendor/opengapps/sources/arm" name="arm" clone-depth="1" revision="master" remote="nezor" />
    <project path="vendor/opengapps/sources/arm64" name="arm64" clone-depth="1" revision="master" remote="nezor" />
    
    <project path="vendor/opengapps/sources/x86" name="x86" clone-depth="1" revision="master" remote="nezor" />
    <project path="vendor/opengapps/sources/x86_64" name="x86_64" clone-depth="1" revision="master" remote="nezor" />
    
    </manifest>
######
Add the code below at the end of your device's **device.mk** file
######
    
    # DJABHipHop Builds(Personal Build)
    DEVICE_SUPPORT_DJ :=true
    
    # TODO: opengapps
    $(call inherit-product, vendor/opengapps.mk)

| Options| What They Do |
|--|--|
| SLIM_THIS_DEVICE :=true | When SLIM_THIS_DEVICE is used Open Gapps mini variant will be used |
| PRODUCT_CHARACTERISTICS :=phone or tablet| When PRODUCT_CHARACTERISTICS is ether phone or tablet none android tv apps will be added to your device |
| BOARD_HAVE_NFC :=true | When BOARD_HAVE_NFC is used TagGoogle be added to your device |
| DEVICE_HAS_DATALINE :=true | When DEVICE_HAS_DATALINE is used GoogleDialer CarrierServices PrebuiltBugle, Google Maps will be added Add to your device |
| PRODUCT_CHARACTERISTICS :=phone | When PRODUCT_CHARACTERISTICS if phone is used Add FitnessPrebuilt & Wallet |
| DEVICE_SUPPORT_DJ :=true | When DEVICE_SUPPORT_DJ is used cool apps that LightingFastRom developer like to use will be added to your device |
