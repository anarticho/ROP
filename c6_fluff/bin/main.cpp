#include <iostream>
#include <cstdint>
#include <string>
#include <queue>

using namespace std;

int main()
{
	// total number of characters to load on memory
	static const size_t flg_sz = 8U;
	
	// flag.txt string
	string flag("flag.txt");

	// addresses within memory for 'flag.txt' characters 
	queue<uint64_t> flg_mem;
	flg_mem.push(0x004003f4); 
	flg_mem.push(0x00400405); 
	flg_mem.push(0x00400424); 
	flg_mem.push(0x004007a0); 
	flg_mem.push(0x00400439); 
	flg_mem.push(0x004003d5); 
	flg_mem.push(0x004007bc); 
	flg_mem.push(0x004003d5);

	// value to substract to rcx value (for flag.txt memory values)
	const uint16_t ext_sub = 0x3ef2;

	// having %al (%rax's LSB), with initial value at 0xb
	uint8_t al_val = 0xB;

	// for each memory location for flag.txt character
	for(size_t i=0; i<flg_sz; i++)
	{
		const uint64_t cur_val = flg_mem.front();
		const uint64_t mem_val = cur_val - al_val - ext_sub;
		al_val = flag.at(i);
		cout << hex << mem_val << endl;
		flg_mem.pop();
	}
}
