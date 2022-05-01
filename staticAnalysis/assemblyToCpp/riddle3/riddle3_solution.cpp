#include <iostream>

void func(int, int);

int main() {
	int input1;
	int input2;
	scanf_s("%d", &input1);
	scanf_s("%d", &input2);
	func(input1, input2);
}

void func(int input1,int input2){
	for (int counter1 = input1; counter1 > 0; counter1--) {
		for (int counter2 = 1; counter2 <= counter1; counter2++) {
			printf_s("%s", "*");
		}
		printf_s("%s", "\n");
	}
}