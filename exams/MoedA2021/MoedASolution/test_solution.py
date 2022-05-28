"""2021 MOED A
By Orin Naaman"""

fixed_string = "839282"


def check_chars(user_input):
    if len(user_input) != len(fixed_string):
        return False
    for i in range(6):
        user_ascii = ord(user_input[i])
        x = 0x3A
        x = x - user_ascii

        fixed_ascii = ord(fixed_string[i])
        y = 0x30
        y = fixed_ascii - y
        if x != y:
            return False

    return True


def is_success(user_input):
    if check_chars(user_input):
        print("Success")
    else:
        print("Failure")


def main():
    user_input = input()
    is_success(user_input)


if __name__ == "__main__":
    main()