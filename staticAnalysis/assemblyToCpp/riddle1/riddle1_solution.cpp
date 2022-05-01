#include <iostream>

void func(int user_input);

int main() {
	int user_input;
	scanf_s("%d", &user_input);
	func(user_input);
	return 0;
}

void func(int user_input) {
	for (int i = 1; i <= user_input; i++) {
		printf_s("%s", "*");
	}
	printf_s("%s", "\n");
}