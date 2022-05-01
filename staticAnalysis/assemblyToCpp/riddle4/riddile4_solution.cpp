#include<iostream>

int func(int, int);

int main() {
	int input1, input2;
	scanf_s("%d", &input1);
	scanf_s("%d", &input2);
	int max = func(input1, input2);
	printf_s("%d", max);
	return (0);
}

int func(int input1, int input2) {
	if (input1 <= input2) {
		return input2;
	}
	else {
		return input1;
	}
}