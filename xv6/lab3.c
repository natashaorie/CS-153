#include "types.h"
#include "user.h"

int recursive(int i) {
	i++;
	recursive(i);
	return 0;
}

int main() {
	int i = 0;
	recursive(i);
	return 0;
}


	
