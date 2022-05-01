#include<iostream>

void func(int, int);

int main() {
	int input_1;
	int input_2;
	scanf_s("%d", &input_1);
	scanf_s("%d", &input_2);
	func(input_1, input_2);
}

void func(int input_1, int input_2) {
	for (int counter_1 = 1; counter_1 <= input_1; counter_1++) {
		for (int counter_2 = 1; counter_2 <= input_2; counter_2++) {
			printf_s("%s", "*");
		}
		printf_s("%s", "\n");
	}
}