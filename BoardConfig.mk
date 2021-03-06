#
# This file is part of trust|me
# Copyright(c) 2013 - 2017 Fraunhofer AISEC
# Fraunhofer-Gesellschaft zur Förderung der angewandten Forschung e.V.
#
# This program is free software; you can redistribute it and/or modify it
# under the terms and conditions of the GNU General Public License,
# version 2 (GPL 2), as published by the Free Software Foundation.
#
# This program is distributed in the hope it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
# FITNESS FOR A PARTICULAR PURPOSE. See the GPL 2 license for more details.
#
# You should have received a copy of the GNU General Public License along with
# this program; if not, see <http://www.gnu.org/licenses/>
#
# The full GNU General Public License is included in this distribution in
# the file called "COPYING".
#
# Contact Information:
# Fraunhofer AISEC <trustme@aisec.fraunhofer.de>
#

# inherit trustme generic stuff, e.g., sepolicy
-include device/fraunhofer/trustme_generic/TrustmeBoardConfig.mk

# inherit from hammerhead 
-include device/lge/hammerhead/BoardConfig.mk

## set target device to hammerhead instead of trustme_hammerhead
## otherwise jf-common would not include necessary subdirs in its Android.mk 
TARGET_DEVICE := hammerhead
HAVE_SELINUX := false

# we build our kernel outside the tree
TARGET_NO_BOOTLOADER := true
TARGET_NO_KERNEL := true

TARGET_USES_LOGD := false

BOARD_SYSTEMIMAGE_PARTITION_SIZE :=  350000000
#BOARD_USERDATAIMAGE_PARTITION_SIZE := 2000
