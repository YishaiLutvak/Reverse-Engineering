
def secret(my_str):
    NUM_SECRET = 866
    my_crypto = "S{{p4c{f4m{a4ufq4sq``}zs4}`5"
    my_message = ""
    if(len(my_str)) > 3:
        sum = 0
        for ch in my_str[1:]:
            sum += ord(ch)
        if sum == NUM_SECRET:
            for i,ch in enumerate(my_crypto):
                my_message += chr(ord(ch) ^ 20)
            print(my_message)


secret("ilmnopqrY")