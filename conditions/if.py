a = int(input())
b = int(input())
if a > b:
    a ^= b
    b ^= a
    a ^= b
print(a)
print(b)


# call read_hex = input into eax
# call print_eax
