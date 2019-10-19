#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <stdint.h>

#include <mach-o/loader.h>

// Yes, this is a knockoff of Marzipanify because NIH.

static void mod_header(struct mach_header_64* mh) {
	struct load_command* cmd = (struct load_command*)((uint8_t*)mh + sizeof(struct mach_header_64));
	for (unsigned int index = 0; index < mh->ncmds; index++) {
		switch (cmd->cmd) {
			case LC_BUILD_VERSION: {
				struct build_version_command* bv = (struct build_version_command*)cmd;
				bv->platform = 6; // PLATFORM_UIKITFORMAC
				return;
			}
		}
		cmd = (struct load_command*)((char*)cmd + cmd->cmdsize);
	}
	abort();
}

int main(int argc, char** argv) {
	if (argc != 3) {
		fprintf(stderr, "Usage: rewrite_lc_build <input> <output>\n");
		return 1;
	}
	FILE* infile = fopen(argv[1], "r");
	fseek(infile, 0, SEEK_END);
	size_t length = ftell(infile);
	rewind(infile);
	void* buf = malloc(length);
	fread(buf, 1, length, infile);
	fclose(infile);
	mod_header(buf);
	FILE* outfile = fopen(argv[2], "w");
	fwrite(buf, 1, length, outfile);
	fclose(outfile);
	return 0;
}
