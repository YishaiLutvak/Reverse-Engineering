# Secret
def secret():
    crypt_message = "S{{p4c{f.4m{a4ufq4sq``}zs4}`5"

    user_input = input("Magic word:\n")
    if len(user_input) > 3:
        sum_input = 0
        for ch in user_input[1:9]:
            sum_input += ord(ch)
        print("sum ascii of user_input[1:9] is:", sum_input)
        sum_input -= 0x34E
        if sum_input == 0x14:
            message = ''
            for ch in crypt_message:
                message += chr(ord(ch) ^ sum_input)
            print(message)


########################################################################################################################

# BispooKeygen2
def bispoo_keygen_2():
    cryptYishaiLutvak = 0x8f, 0x8e, 0x8e, 0x87, \
                        0x8f, 0x8c, 0x8a, 0x8f, \
                        0x87, 0x8b, 0x93, 0xf2, \
                        0xfb, 0xfb, 0xea,

    password = ''
    for ch in cryptYishaiLutvak:
        password += (chr(int(ch) ^ 0xBE))
    print(password)


########################################################################################################################

# MoedA2021

# correct password:
# 50 55 49 56 50 56
# 2   7   1   8   2   8
# 271828
fixed_string = "839282"


def check_chars(user_input):
    if len(user_input) != len(fixed_string):
        return False
    for ch1,ch2 in zip(user_input,fixed_string):
        user_ascii = ord(ch1)
        x = 0x3A - user_ascii
        fixed_ascii = ord(ch2)
        y = fixed_ascii - 0x30
        if x != y:
            return False
    return True


def is_success(user_input):
    if check_chars(user_input):
        print("Success")
    else:
        print("Failure")


def moed_a_2021():
    user_input = input()
    is_success(user_input)


########################################################################################################################

# MoedB2021
def moed_b_2021():
    user_input = input("Enter password:\n")
    my_sum = 0
    if len(user_input) > 3:
        for ch in user_input:
            ascii_value = ord(ch)
            ascii_value &= 0xF
            # print(bin(ascii_value))
            for i in range(4):
                my_sum += ascii_value & 1
                # print(ascii_value & 1)
                ascii_value >>= 1
                # print(bin(ascii_value))
        if my_sum == 0xF:
            print('Great!')
            return
    print()

########################################################################################################################

if __name__ == "__main__":
    moed_b_2021()
    # moed_a_2021()
    # bispoo_keygen_2()
    # secret()
