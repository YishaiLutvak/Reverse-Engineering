#include <stdio.h>

int main(int argc, char* argv[]) {
    int day;
    scanf_s("%x", &day);
    switch (day){
        case 1:
        case 2:
        case 3:
        case 4:
        case 5:
            printf("This is a weekday\n");
            break;
        case 6:
            printf("Friday\n");
            break;
        case 7:
            printf("Saturday\n");
            break;
        default:
            printf("Not a legal day\n");
            break;
    }
    return 0;
}