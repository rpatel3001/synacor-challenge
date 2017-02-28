#include <sys/stat.h>
#include <fstream>
#include <iostream>
#include <stack>

uint16_t prog[32768];

void execute() {
	uint16_t IP = 0;
	uint16_t REG[8] = {0, 0, 0, 0, 0, 0, 0, 0,};
	std::stack<uint16_t> STACK;

	while (1) {
		uint16_t op = prog[IP++];
		if (op == 0) {
			// halt
			break;
		} else if (op == 6) {
			// jmp
			uint16_t loc = prog[IP];
			if (loc > 32775) {
				std::cout << "Invalid memory address" << std::endl;
			} else if (loc > 32767) {
				IP = REG[loc - 32768];
			} else {
				IP = loc;
			}
		} else if (op == 19) {
			// print ascii char
			std::cout << (char)prog[IP++];
		} else if (op == 21) {
			// noop
			continue;
		} else if (op > 21) {
			std::cout << "Invalid opcode" << std::endl;
		} else {
			// not yet implemented
			std::cout << prog[IP-1] << " " << prog[IP] << " " << prog[IP+1] << " " << prog[IP+2] << std::endl;
		}
	}
	std::cout << "Program finished at instruction " << IP << std::endl;
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
