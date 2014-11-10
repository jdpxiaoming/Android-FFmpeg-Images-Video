LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)
 PATH_TO_FFMPEG_SOURCE:=$(LOCAL_PATH)/ffmpeg
LOCAL_C_INCLUDES += $(PATH_TO_FFMPEG_SOURCE)
 LOCAL_WHOLE_STATIC_LIBRARIES := libavformat libavcodec libavfilter libavutil libpostproc libswscale libswresample
 LOCAL_MODULE := ffmpeg
LOCAL_LDLIBS := \
    -llog \
    -lgcc \
    -lz
include $(BUILD_SHARED_LIBRARY)
include $(call all-makefiles-under,$(LOCAL_PATH))
