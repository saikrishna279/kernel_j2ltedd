/* linux/drivers/media/platform/exynos/jpeg4/jpeg_conf.h
 *
 * Copyright (c) 2013 Samsung Electronics Co., Ltd.
 * http://www.samsung.com/
 *
 * Definition Quantization Table for Jpeg encoder/docoder
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License version 2 as
 * published by the Free Software Foundation.
*/

#ifndef __JPEG_CONF_H__
#define __JPEG_CONF_H__

/* ITU Luminace Huffman Table */
static unsigned int ITU_H_tbl_len_DC_luminance[4] = {
	0x01050100, 0x01010101, 0x00000001, 0x00000000
};
static unsigned int ITU_H_tbl_val_DC_luminance[3] = {
	0x03020100, 0x07060504, 0x0b0a0908
};

/* ITU Chrominace Huffman Table */
static unsigned int ITU_H_tbl_len_DC_chrominance[4] = {
	0x01010300, 0x01010101, 0x00010101, 0x00000000
};
static unsigned int ITU_H_tbl_val_DC_chrominance[3] = {
	0x03020100, 0x07060504, 0x0b0a0908
};

/* ITU Luminace Huffman Table */
static unsigned int ITU_H_tbl_len_AC_luminance[4] = {
	0x03010200, 0x03040203, 0x04040505, 0x7d010000
};

static unsigned int ITU_H_tbl_val_AC_luminance[41] = {
	0x00030201, 0x12051104, 0x06413121, 0x07615113,
	0x32147122, 0x08a19181, 0xc1b14223, 0xf0d15215,
	0x72623324, 0x160a0982, 0x1a191817, 0x28272625,
	0x35342a29, 0x39383736, 0x4544433a, 0x49484746,
	0x5554534a, 0x59585756, 0x6564635a, 0x69686766,
	0x7574736a, 0x79787776, 0x8584837a, 0x89888786,
	0x9493928a, 0x98979695, 0xa3a29a99, 0xa7a6a5a4,
	0xb2aaa9a8, 0xb6b5b4b3, 0xbab9b8b7, 0xc5c4c3c2,
	0xc9c8c7c6, 0xd4d3d2ca, 0xd8d7d6d5, 0xe2e1dad9,
	0xe6e5e4e3, 0xeae9e8e7, 0xf4f3f2f1, 0xf8f7f6f5,
	0x0000faf9
};

/* ITU Chrominace Huffman Table */
static u32 ITU_H_tbl_len_AC_chrominance[4] = {
	0x02010200, 0x04030404, 0x04040507, 0x77020100
};
static u32 ITU_H_tbl_val_AC_chrominance[41] = {
	0x03020100, 0x21050411, 0x41120631, 0x71610751,
	0x81322213, 0x91421408, 0x09c1b1a1, 0xf0523323,
	0xd1726215, 0x3424160a, 0x17f125e1, 0x261a1918,
	0x2a292827, 0x38373635, 0x44433a39, 0x48474645,
	0x54534a49, 0x58575655, 0x64635a59, 0x68676665,
	0x74736a69, 0x78777675, 0x83827a79, 0x87868584,
	0x928a8988, 0x96959493, 0x9a999897, 0xa5a4a3a2,
	0xa9a8a7a6, 0xb4b3b2aa, 0xb8b7b6b5, 0xc3c2bab9,
	0xc7c6c5c4, 0xd2cac9c8, 0xd6d5d4d3, 0xdad9d8d7,
	0xe5e4e3e2, 0xe9e8e7e6, 0xf4f3f2ea, 0xf8f7f6f5,
	0x0000faf9
};

#endif /* __JPEG_CONF_H__ */
