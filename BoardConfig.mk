DEVICE_PATH := device/huawei/dura

# For building with minimal manifest
ALLOW_MISSING_DEPENDENCIES := true

# Architecture
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := cortex-a53 # This may change if you are using a weird toolchain (Probably not but just a advice) 

TARGET_NO_BOOTLOADER := true

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(DEVICE_PATH)/bluetooth

# Kernel
BOARD_KERNEL_CMDLINE := bootopt=64S3,32S1,32S1 product.type=normal androidboot.selinux=permisive 
# Twrp and aosp should use the same cmdline but im not sure so it may change in future

TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/zImage-dtb
BOARD_KERNEL_BASE := 0x40000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_RAMDISK_OFFSET := 0x05000000
BOARD_KERNEL_TAGS_OFFSET := 0x04000000
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)
# BOARD_MKBOOTIMG_ARGS += 
BOARD_KERNEL_IMAGE_NAME := zImage-dtb
TARGET_KERNEL_ARCH := arm
TARGET_KERNEL_HEADER_ARCH := arm
TARGET_KERNEL_SOURCE := kernel/huawei/dura
TARGET_KERNEL_CONFIG := dura_defconfig
BOARD_MTKBOOTIMG_ARGS := --pagesize $(BOARD_KERNEL_PAGESIZE) --base $(BOARD_KERNEL_BASE) --kernel_offset 0x00008000 --ramdisk_offset $(BOARD_RAMDISK_OFFSET) --second_offset 0x00f00000 --tags_offset $(BOARD_KERNEL_TAGS_OFFSET) --cmdline $(BOARD_KERNEL_CMDLINE)
# For mediatek image headers
BOARD_CUSTOM_BOOTIMG_MK := $(DEVICE_PATH)/mkbootimg.mk
