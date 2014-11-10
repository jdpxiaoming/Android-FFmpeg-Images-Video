LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)
LOCAL_MODULE =myffmpeg
LOCAL_SRC_FILES :=libffmpeg.so
include $(PREBUILT_SHARED_LIBRARY)
include $(CLEAR_VARS)
PATH_TO_FFMPEG_SOURCE:=$(LOCAL_PATH)/ffmpeg
LOCAL_C_INCLUDES += $(PATH_TO_FFMPEG_SOURCE)
LOCAL_MODULE=ffmpeg-jni
LOCAL_LDLIBS := -llog -ljnigraphics -lz -ldl -lgcc -lm
LOCAL_SRC_FILES := ffmpeg-jni.c ffmpeg/cmdutils.h ffmpeg/cmdutils.c ffmpeg/ffmpeg.h ffmpeg/ffmpeg_opt.c ffmpeg/ffmpeg_filter.c
LOCAL_SHARED_LIBRARIES:=myffmpeg
include $(BUILD_SHARED_LIBRARY) 
