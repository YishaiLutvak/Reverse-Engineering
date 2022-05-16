unknown_str = "6789:;<=>?@ABCD"
cryptYishaiLutvak = 0x8f, 0x8e, 0x8e, 0x87,\
        0x8f, 0x8c, 0x8a, 0x8f,\
        0x87, 0x8b, 0x93, 0xf2,\
        0xfb, 0xfb, 0xea,

password = ''
for ch in cryptYishaiLutvak:
     password += (chr(int(ch) ^ 0xBE))
print(password)
#1009124195-LEET

#--------------------------------------------------------------

#user_name = input("name:\n")
#user_password = input("password:\n")

# counter = 1
# my_sum = 0
# for ch in user_name:
#     my_sum += counter * ord(ch)
#     print(hex(my_sum))
#     my_sum += counter
#     print(hex(my_sum))
#     my_sum << (0xDE%0x20)
#     print(hex(my_sum))
#     my_sum >> (0xAD%0x20)
#     print(hex(my_sum))
#     my_sum ^= counter
#
#     counter += 1
#     #m1+=(chr(ord(ch)^0xBE))
# print(my_sum)
# print(hex(my_sum))
