def test_password(password):
    if len(password) <= 3:
        return False
    bin_sum = 0
    for char in password:
        bin_char = 0X0F & ord(char)
        for j in range(4):
            bin_sum += 1 & bin_char
            bin_char >>= 1
    if sum == 0xF:
        return True
    return False


def main():
    if test_password(input("Enter Password\n")):
        print("Great!")
        

if __name__ == "__main__":
    main()
