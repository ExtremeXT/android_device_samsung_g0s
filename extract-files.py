#!/usr/bin/env -S PYTHONPATH=../../../tools/extract-utils python3
#
# Copyright (C) 2025 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

from extract_utils.fixups_blob import (
    blob_fixup,
    blob_fixups_user_type,
)

from extract_utils.main import (
    ExtractUtils,
    ExtractUtilsModule,
)

namespace_imports = [
    'device/samsung/s5e9925-common',
    'hardware/samsung',
    'hardware/samsung_slsi-linaro/codec2',
    'hardware/samsung_slsi-linaro/exynos',
    'hardware/samsung_slsi-linaro/interfaces',
    'hardware/samsung_slsi-linaro/sgpu',
    'vendor/samsung/s5e9925-common',
]

blob_fixups: blob_fixups_user_type = {
    'vendor/lib64/hw/camera.s5e9925.so': blob_fixup()
        .add_needed('libui_shim.so'),
    'vendor/lib64/libexynoscamera3.so': blob_fixup()
        .add_needed('libui_shim.so'),
}  # fmt: skip

module = ExtractUtilsModule(
    'r0s',
    'samsung',
    namespace_imports=namespace_imports,
    blob_fixups=blob_fixups,
)

if __name__ == '__main__':
    utils = ExtractUtils.device_with_common(
        module, 's5e9925-common', module.vendor
    )
    utils.run()
