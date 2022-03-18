# while True
num = int(input())
fib1 = 0
print(fib1)
fib2 = 1
print(fib2)
while True:
    tmp = fib1 + fib2
    fib1 = fib2
    fib2 = tmp
    if fib2 > num:
        break
    print(fib2)
