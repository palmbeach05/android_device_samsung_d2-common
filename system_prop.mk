# system.prop for d2-common
#

# Audio
PRODUCT_PROPERTY_OVERRIDES += \
    audio.offload.disable=1 \
    ro.qc.sdk.audio.fluencetype=fluence \
    persist.audio.fluence.voicecall=true \
    persist.audio.fluence.voicerec=false \
    persist.audio.fluence.speaker=true \
    use.dedicated.device.for.voip=true \
    use.voice.path.for.pcm.voip=true

# Camera
PRODUCT_PROPERTY_OVERRIDES += \
    persist.camera.zsl.prop.enable=0

# GPS
PRODUCT_PROPERTY_OVERRIDES += \
    ro.qc.sdk.izat.premium_enabled=0 \
    ro.qc.sdk.izat.service_mask=0x0 \
    persist.gps.qc_nlp_in_use=0 \
    ro.gps.agps_provider=1
            
# Radio
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
	rild.libpath=/system/lib/libsec-ril.so \
	persist.radio.apm_sim_not_pwdn=1 \
	persist.radio.add_power_save=1 \
	ro.telephony.ril_class=d2lteRIL

# Volume
PRODUCT_PROPERTY_OVERRIDES += \
	ro.config.vc_call_vol_steps=15 \
	ro.config.media_vol_steps=30
