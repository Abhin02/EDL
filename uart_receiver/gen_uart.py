"""This file generates test cases for UART."""

data = ""
for i in range(0, 5):
    data += chr(i)

output = ""
for d in data:
    output += "0\n"
    data = list('{0:08b}'.format(ord(d)))
    data.reverse()
    output += "\n".join(data) + "\n1\n"

with open("UART_Test.txt", 'w') as f:
    f.write(output)
