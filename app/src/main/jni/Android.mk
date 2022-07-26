LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := libdobby
LOCAL_SRC_FILES := libraries/armeabi-v7a/libdobby.a
#for aide users do this LOCAL_SRC_FILES := libraries/$(TARGET_ARCH_ABI)/libdobby.a
include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAR_VARS)

# Here is the name of your lib.
# When you change the lib name, change also on System.loadLibrary("") under OnCreate method on StaticActivity.java
# Both must have same name
LOCAL_MODULE    := MyLibName

# -std=c++17 is required to support AIDE app with NDK
LOCAL_CFLAGS := -w -s -Wno-error=format-security -fvisibility=hidden -fpermissive -fexceptions
LOCAL_CPPFLAGS := -w -s -Wno-error=format-security -fvisibility=hidden -Werror -std=c++17
LOCAL_CPPFLAGS += -Wno-error=c++11-narrowing -fpermissive -Wall -fexceptions
LOCAL_LDFLAGS += -Wl,--gc-sections,--strip-all,-llog
LOCAL_LDLIBS := -llog -landroid -lEGL -lGLESv2
LOCAL_ARM_MODE := arm

LOCAL_STATIC_LIBRARIES := libdobby

LOCAL_SRC_FILES := native-lib.cpp \
      ImGui/imgui.cpp \
      ImGui/imgui_impl_android.cpp \
      ImGui/imgui_impl_opengl3.cpp \
      ImGui/imgui_tables.cpp \
      ImGui/imgui_widgets.cpp \
      ImGui/imgui_demo.cpp \
      ImGui/imgui_draw.cpp \
      ByNameModding/bnm.cpp \
      Obfuscation/instr.cpp \
      Memory/KittyArm64.cpp \
      Memory/KittyMemory.cpp \
      Memory/KittyScanner.cpp \
      Memory/KittyUtils.cpp \
      Memory/MemoryBackup.cpp \
      Memory/MemoryPatch.cpp \
      

include $(BUILD_SHARED_LIBRARY)
