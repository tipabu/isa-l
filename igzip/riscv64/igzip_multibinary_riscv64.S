/**********************************************************************
  Copyright (c) 2025 Institute of Software Chinese Academy of Sciences (ISCAS).

  Redistribution and use in source and binary forms, with or without
  modification, are permitted provided that the following conditions
  are met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in
      the documentation and/or other materials provided with the
      distribution.
    * Neither the name of ISCAS Corporation nor the names of its
      contributors may be used to endorse or promote products derived
      from this software without specific prior written permission.

  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
  "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
  A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
  OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
  SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
  LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
  DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
  THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
  OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
**********************************************************************/

#include "riscv64_multibinary.h"

#if HAVE_RVV
    mbin_interface		isal_adler32
#else
    mbin_interface_base		isal_adler32, adler32_base
#endif

mbin_interface_base gen_icf_map_lh1, gen_icf_map_h1_base
mbin_interface_base decode_huffman_code_block_stateless, decode_huffman_code_block_stateless_base
mbin_interface_base isal_deflate_icf_finish_lvl3, isal_deflate_icf_finish_hash_map_base
mbin_interface_base isal_deflate_hash_lvl3, isal_deflate_hash_base
mbin_interface_base isal_deflate_hash_lvl1, isal_deflate_hash_base
mbin_interface_base isal_deflate_icf_body_lvl2, isal_deflate_icf_body_hash_hist_base
mbin_interface_base isal_deflate_icf_finish_lvl1, isal_deflate_icf_finish_hash_hist_base
mbin_interface_base isal_deflate_finish, isal_deflate_finish_base
mbin_interface_base isal_deflate_body, isal_deflate_body_base
mbin_interface_base isal_deflate_hash_lvl2, isal_deflate_hash_base
mbin_interface_base encode_deflate_icf, encode_deflate_icf_base
mbin_interface_base set_long_icf_fg, set_long_icf_fg_base
mbin_interface_base isal_deflate_icf_body_lvl3, icf_body_hash1_fillgreedy_lazy
mbin_interface_base isal_deflate_icf_body_lvl1, isal_deflate_icf_body_hash_hist_base
mbin_interface_base isal_deflate_hash_lvl0, isal_deflate_hash_base
mbin_interface_base isal_deflate_icf_finish_lvl2, isal_deflate_icf_finish_hash_hist_base
mbin_interface_base isal_update_histogram, isal_update_histogram_base
