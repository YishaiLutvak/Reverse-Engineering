#include <iostream>

long long sum(long long a, long long b, long long c, long long d);

int main() {
	long long result = sum(1, 2, 3, 4);
	printf("%lld", result);
	return 0;
}

long long sum(long long a, long long b, long long c, long long d) {
	return a + b + c + d;
}
