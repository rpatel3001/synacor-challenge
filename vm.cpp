#include <sys/stat.h>
#include <fstream>
#include <iostream>
#include <stack>
#include <string>

uint16_t prog[32768];
uint16_t IP;
uint16_t REG[8];
std::stack<uint16_t> STACK;
bool DEBUG;

uint16_t read_val(uint16_t num) {
	if (num > 32775) {
		std::cout << "Invalid memory location" << std::endl;
		return 0xFFFF;
	} else if (num > 32767) {
		return REG[num - 32768];
	} else {
		return num;
	}
}

void write_val(uint16_t loc, uint16_t val) {
	if (loc > 32775) {
		std::cout << "Invalid memory location" << std::endl;
	} else if (loc > 32767) {
		REG[loc - 32768] = val;
	} else {
		prog[loc] = val;
	}
}

int params[] = {0, 2, 1, 1, 3, 3, 1, 2, 2, 3, 3, 3, 3, 3, 2, 2, 2, 1, 0, 1, 1, 0};
std::string ops[] = {"halt", "set ", "push", "pop ", "eq  ", "gt  ", "jmp ", "jt  ", "jf  ", "add ", "mult", "mod ", "and ", "or  ", "not ", "rmem", "wmem", "call", "ret ", "out ", "in  ", "noop"};
void print_context(uint16_t mem) {
	std::cout << mem << "\t" << ops[prog[mem]] << "\t";
	for (size_t i = 1; i <= params[prog[mem]]; ++i) {
		uint16_t val = prog[mem+i];
		if (val < 32768) {
			std::cout << val << "\t";
		} else {
			std::cout << "reg " << (val-32768) << "\t";
		}
	}
	std::cout << std::endl;
}

void execute(size_t beg, size_t end) {
	IP=beg;
	while (1) {
		if(IP == end) {
			return;
		}
		uint16_t op = prog[IP++];
		if (1) {
			if (DEBUG) {
				if (0 == 0) {
					for (size_t i = 0; i < 8; ++i) {
						std::cout << "reg " << i << "\t" << REG[i] << std::endl;
					}
					std::cout << std::endl;
				}
				print_context(IP-1);
			}
		}

		if (op == 0) {
			// halt
			std::cout << 0 << std::endl;
			break;
		} else if (op == 1) {
			// set
			uint16_t reg = prog[IP++] - 32768;
			REG[reg] = read_val(prog[IP++]);
		} else if (op == 2) {
			// push
			STACK.push(read_val(prog[IP++]));
		} else if (op == 3) {
			// pop
			if (STACK.size() == 0) {
				std::cout << "Popped an empty stack" << std::endl;
				break;
			}
			write_val(prog[IP++], STACK.top());
			STACK.pop();
		} else if (op == 4) {
			// eq
			uint16_t dest = prog[IP++];
			uint16_t val1 = read_val(prog[IP++]);
			uint16_t val2 = read_val(prog[IP++]);
			if (val1 == val2) {
				write_val(dest, 1);
			} else {
				write_val(dest, 0);
			}
		} else if (op == 5) {
			// greater than
			uint16_t dest = prog[IP++];
			uint16_t val1 = read_val(prog[IP++]);
			uint16_t val2 = read_val(prog[IP++]);
			if (val1 > val2) {
				write_val(dest, 1);
			} else {
				write_val(dest, 0);
			}
		} else if (op == 6) {
			// jmp
			IP = read_val(prog[IP]);
		} else if (op == 7) {
			// jnz
			uint16_t val = read_val(prog[IP++]);
			uint16_t loc = read_val(prog[IP++]);
			if (val != 0) {
				IP = loc;
			}
		} else if (op == 8) {
			// jz
			uint16_t val = read_val(prog[IP++]);
			uint16_t loc = read_val(prog[IP++]);
			if (val == 0) {
				IP = loc;
			}
		} else if (op == 9) {
			// add
			uint16_t dest = prog[IP++];
			uint16_t val1 = read_val(prog[IP++]);
			uint16_t val2 = read_val(prog[IP++]);
			write_val(dest, (val1 + val2) % 32768);
		} else if (op == 10) {
			// mult
			uint16_t dest = prog[IP++];
			uint16_t val1 = read_val(prog[IP++]);
			uint16_t val2 = read_val(prog[IP++]);
			write_val(dest, (val1 * val2) % 32768);
		} else if (op == 11) {
			// mod
			uint16_t dest = prog[IP++];
			uint16_t val1 = read_val(prog[IP++]);
			uint16_t val2 = read_val(prog[IP++]);
			write_val(dest, val1%val2);
		} else if (op == 12) {
			// and
			uint16_t dest = prog[IP++];
			uint16_t val1 = read_val(prog[IP++]);
			uint16_t val2 = read_val(prog[IP++]);
			write_val(dest, val1 & val2);
		}  else if (op == 13) {
			// or
			uint16_t dest = prog[IP++];
			uint16_t val1 = read_val(prog[IP++]);
			uint16_t val2 = read_val(prog[IP++]);
			write_val(dest, val1 | val2);
		}  else if (op == 14) {
			// not
			uint16_t dest = prog[IP++];
			uint16_t val = read_val(prog[IP++]);
			write_val(dest, val ^ 0x7FFF);
		} else if (op == 15) {
			// rmem
			uint16_t dest = prog[IP++];
			uint16_t val = read_val(prog[IP++]);
			write_val(dest, prog[val]);
		}  else if (op == 16) {
			// wmem
			uint16_t dest = read_val(prog[IP++]);
			uint16_t val = read_val(prog[IP++]);
			prog[dest] = val;
		} else if (op == 17) {
			// call
			STACK.push(IP+1);
			IP = read_val(prog[IP]);
		} else if (op == 18) {
			// ret
			uint16_t addr = STACK.top();
			STACK.pop();
			IP = addr;
		} else if (op == 19) {
			// print ascii char
			std::cout << (char)read_val(prog[IP++]);
		} else if (op == 20) {
			// read ascii char
			uint16_t dest = prog[IP++];
			char x;
			std::cin.get(x);
			write_val(dest, x);
		} else if (op == 21) {
			// noop
		} else {
			// invalid
			std::cout << "Invalid opcode " << op << std::endl;
		}
	}
	std::cout << "Program finished at instruction " << (IP-1) << std::endl;
}

int main(int argc, char** argv) {
	struct stat prog_stat;
	std::ifstream prog_file;

	if (argc < 2) {
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

	DEBUG = false;

	prog_file.open(argv[1], std::ios::in | std::ios::binary);
	// take advantage of x86 being little endian and read raw bytes into an array of uint16_t
	prog_file.read((char*)prog, prog_stat.st_size);
	prog_file.close();

	//std::cout << prog[940] << std::endl;
	execute(885, 887);
	execute(978, 30050);
}
