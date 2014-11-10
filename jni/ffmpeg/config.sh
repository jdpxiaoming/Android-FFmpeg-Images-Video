#!/bin/bash  
  
PREBUILT=/usr/android/android-ndk-r8e/toolchains/arm-linux-androideabi-4.4.3/prebuilt/linux-x86_64
PLATFORM=/usr/android/android-ndk-r8e/platforms/android-14/arch-arm
  
./configure --target-os=linux \
--arch=arm \
--enable-version3 \
--enable-gpl \
--enable-nonfree \
--enable-shared \
--enable-stripping \
--enable-ffmpeg \
--disable-ffplay \
--disable-ffserver \
--disable-ffprobe \
--enable-decoders \
--disable-symver \
--enable-encoders \
--enable-muxers \
--disable-devices \
--enable-protocols \
--enable-protocol=file \
--enable-avfilter \
--enable-network \
--disable-avdevice \
--disable-asm \
--enable-cross-compile \
--cc=$PREBUILT/bin/arm-linux-androideabi-gcc \
--cross-prefix=$PREBUILT/bin/arm-linux-androideabi- \
--strip=$PREBUILT/bin/arm-linux-androideabi-strip \
--extra-cflags="-fPIC -DANDROID" \
--extra-ldflags="-Wl,-T,$PREBUILT/arm-linux-androideabi/lib/ldscripts/armelf_linux_eabi.x -Wl,-rpath-link=$PLATFORM/usr/lib -L$PLATFORM/usr/lib -nostdlib $PREBUILT/lib/gcc/arm-linux-androideabi/4.4.3/crtbegin.o $PREBUILT/lib/gcc/arm-linux-androideabi/4.4.3/crtend.o -lc -lm -ldl" \
--extra-libs=-lgcc \
  
#sed -i 's/HAVE_LRINT 0/HAVE_LRINT 1/g' config.h  
#sed -i 's/HAVE_LRINTF 0/HAVE_LRINTF 1/g' config.h  
#sed -i 's/HAVE_ROUND 0/HAVE_ROUND 1/g' config.h  
#sed -i 's/HAVE_ROUNDF 0/HAVE_ROUNDF 1/g' config.h  
#sed -i 's/HAVE_TRUNC 0/HAVE_TRUNC 1/g' config.h  
#sed -i 's/HAVE_TRUNCF 0/HAVE_TRUNCF 1/g' config.h  
#sed -i 's/HAVE_CBRT 0/HAVE_CBRT 1/g' config.h  
#sed -i 's/HAVE_CBRTF 0/HAVE_CBRTF 1/g' config.h  
#sed -i 's/HAVE_ISINF 0/HAVE_ISINF 1/g' config.h  
#sed -i 's/HAVE_ISNAN 0/HAVE_ISNAN 1/g' config.h  
#sed -i 's/HAVE_SINF 0/HAVE_SINF 1/g' config.h  
#sed -i 's/HAVE_RINT 0/HAVE_RINT 1/g' config.h  
  
# collect objects OBJS-$(HAVE_MMX) += $(MMX-OBJS-yes) OBJS += $(OBJS-yes) FFNAME := lib$(NAME) FFLIBS := $(foreach,NAME,$(FFLIBS),lib$(NAME)) FFCFLAGS = -DHAVE_AV_CONFIG_H -Wno-sign-compare -Wno-switch -Wno-pointer-sign FFCFLAGS += -DTARGET_CONFIG=\"config-$(TARGET_ARCH).h\" ALL_S_FILES := $(wildcard $(LOCAL_PATH)/$(TARGET_ARCH)/*.S) ALL_S_FILES := $(addprefix $(TARGET_ARCH)/, $(notdir $(ALL_S_FILES)))ifneq ($(ALL_S_FILES),) ALL_S_OBJS := $(patsubst %.S,%.o,$(ALL_S_FILES)) C_OBJS := $(filter-out $(ALL_S_OBJS),$(OBJS)) S_OBJS := $(filter $(ALL_S_OBJS),$(OBJS)) else C_OBJS := $(OBJS) S_OBJS := endif C_FILES := $(patsubst %.o,%.c,$(C_OBJS)) S_FILES := $(patsubst %.o,%.S,$(S_OBJS)) FFFILES := $(sort $(S_FILES)) $(sort $(C_FILES)) 
