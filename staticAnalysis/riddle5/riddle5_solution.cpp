#include <iostream>

void func(int&, int&);

int main() {
	int input1, input2;
	scanf_s("%d", &input1);
	scanf_s("%d", &input2);
	printf_s("%d %d\n", input1, input2);
	func(input1, input2);
	printf_s("%d %d\n", input1, input2);
	return 0;
}

void func(int& input1, int& input2) {
	int local1 = input2;
	input2 = input1;
	input1 = local1;
}