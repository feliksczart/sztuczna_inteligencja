def load(fileName):
    f = open(fileName, 'r')

    for line in f:
        o = '' 
        start = False
        for i in line:
            if start:
                o+=i
            if not start and i == '(':
                o += i
                start = True
        print(o,end='')

x = str(input('Podaj nazwe pliku: '))
load(x)