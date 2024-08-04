#include <iostream>
#include <cstdint>

using namespace std;

int main()
{
	static const char* flg_str = "flag.txt";
	static const size_t flg_sz = sizeof(flg_str)/sizeof(*flg_str);

	static const uint16_t i_sub = 0x3ef2;

	uint64_t flg_u64 = *reinterpret_cast<const uint64_t*>(flg_str);

	cout << hex << flg_u64 << endl;

	flg_u64 -= i_sub;

	cout << hex << flg_u64 << endl;
}
