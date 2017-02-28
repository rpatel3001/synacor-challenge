#include <sys/stat.h>
#include <fstream>
#include <iostream>
#include <stack>

uint16_t prog[32768];
uint16_t IP;
uint16_t REG[8];
std::stack<uint16_t> STACK;

uint16_t to_val(uint16_t num) {
	if (num > 32775) {
		std::cout << "Invalid memory location" << std::endl;
		return 0xFFFF;
	} else if (num > 32767) {
		return REG[num - 32768];
	} else {
		return num;
	}
}

void execute() {
	while (1) {
		uint16_t op = prog[IP++];
		if (op == 0) {
			// halt
			std::cout << "halt at " << (IP-1) << std::endl;
			break;
		} else if (op == 1) {
			uint16_t reg = prog[IP++] - 32768;
			REG[reg] = prog[IP++];
			std::cout << "load " << REG[reg] << " into reg " << reg << std::endl;
		} else if (op == 6) {
			// jmp
			std::cout << "jmp at " << (IP-1) << " to " << to_val(prog[IP]) << std::endl;
			IP = to_val(prog[IP]);
		} else if (op == 7) {
			// jnz
			uint16_t val = to_val(prog[IP++]);
			uint16_t loc = to_val(prog[IP++]);
			std::cout << "jnz " << val << " at " << (IP-1) << " to " << loc << std::endl;
			if (val != 0) {
				IP = loc;
			}
		} else if (op == 8) {
			// jz
			uint16_t val = to_val(prog[IP++]);
			uint16_t loc = to_val(prog[IP++]);
			std::cout << "jz  " << val << " at " << (IP-1) << " to " << loc << std::endl;
			if (val == 0) {
				IP = loc;
			}
		} else if (op == 19) {
			// print ascii char
			std::cout << (char)prog[IP++];
		} else if (op == 21) {
			// noop
			std::cout << "noop at " << (IP-1) << std::endl;
			continue;
		} else if (op > 21) {
			std::cout << "Invalid opcode" << std::endl;
		} else {
			// not yet implemented
			--IP;
			for (size_t i = 0; i < 10; ++i) {
				std::cout << (IP+i) << " " << prog[IP+i] << std::endl;
			}
			break;
		}
	}
	std::cout << "Program finished at instruction " << (IP-1) << std::endl;
}

int main(int argc, char** argv) {
	struct stat prog_stat;
	std::ifstream prog_file;

	if (argc != 2) {
		std::cout << "Usage: ./vm binary_file" << std::endl;
		return -1;
	}
	if (stat(argv[1], &prog_stat)) {
		std::cout << "Error stat-ing file" << std::endl;
		return -1;
	}
	if (prog_stat.st_size > 65536) {
		std::cout << "Program size too big" << std::endl;
		return -1;
	}
	prog_file.open(argv[1], std::ios::in | std::ios::binary);
	// take advantage of x86 being little endian and read raw bytes into an array of uint16_t
	prog_file.read((char*)prog, prog_stat.st_size);

	execute();
}
