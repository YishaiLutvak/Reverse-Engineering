num = int(input())
total = 0
for i in range(num+1):
    total += i
    print(f'i={i}')
    print(f'total={total}')
    print()
print(total)