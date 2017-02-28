"""This file generates test cases for UART."""

data = "0123456789"
output = ""
for d in data:
    output += "0\n"
    data = list('{0:08b}'.format(ord(d)))
    data.reverse()
    output += "\n".join(data) + "\n1\n"

with open("UART_Test.txt", 'w') as f:
    f.write(output)
