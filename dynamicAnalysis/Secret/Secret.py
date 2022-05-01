crypt_message = "S{{p4c{f.4m{a4ufq4sq``}zs4}`5"

user_input = input("Magic word:\n")
if len(user_input) > 3:
    sum_input = 0
    for ch in user_input[1:9]:
        sum_input += ord(ch)
    print("sum ascii of user_input[1:9] is:",sum_input)
    sum_input -= 0x34E
    if sum_input == 0x14:
        message = ''
        for ch in crypt_message:
            message += chr(ord(ch)^sum_input)
        print(message)