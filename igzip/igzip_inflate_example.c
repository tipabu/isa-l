/**********************************************************************
  Copyright(c) 2025 Intel Corporation All rights reserved.

  Redistribution and use in source and binary forms, with or without
  modification, are permitted provided that the following conditions
  are met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in
      the documentation and/or other materials provided with the
      distribution.
    * Neither the name of Intel Corporation nor the names of its
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

#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include "igzip_lib.h"

#define BUF_SIZE 8192

struct inflate_state stream;

int
main(int argc, char *argv[])
{
        uint8_t inbuf[BUF_SIZE], outbuf[BUF_SIZE];
        FILE *in, *out;
        int ret;
        int eof;

        if (argc != 3) {
                fprintf(stderr, "Usage: igzip_inflate_example infile outfile\n");
                exit(0);
        }

        in = fopen(argv[1], "rb");
        if (!in) {
                fprintf(stderr, "Can't open %s for reading\n", argv[1]);
                exit(0);
        }

        out = fopen(argv[2], "wb");
        if (!out) {
                fprintf(stderr, "Can't open %s for writing\n", argv[2]);
                fclose(in);
                exit(0);
        }

        printf("igzip_inflate_example\n");
        fflush(0);

        isal_inflate_init(&stream);

        do {
                stream.avail_in = (uint32_t) fread(inbuf, 1, BUF_SIZE, in);
                eof = feof(in);
                stream.next_in = inbuf;

                do {
                        stream.avail_out = BUF_SIZE;
                        stream.next_out = outbuf;

                        ret = isal_inflate(&stream);

                        if (ret != ISAL_DECOMP_OK && ret != ISAL_END_INPUT) {
                                fprintf(stderr, "Decompression error: %d\n", ret);
                                fclose(out);
                                fclose(in);
                                return 1;
                        }

                        fwrite(outbuf, 1, BUF_SIZE - stream.avail_out, out);
                } while (stream.avail_out == 0);
        } while (eof == 0);

        fclose(out);
        fclose(in);

        printf("End of igzip_inflate_example\n\n");
        return 0;
}
