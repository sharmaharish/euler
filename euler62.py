from utility import number_to_digits

n = 345
cubes = {}
while True:
    c = n ** 3
    d = tuple(sorted(number_to_digits(c)))
    cl = cubes[d] if d in cubes else []
    cl.append(c)
    cubes[d] = cl
    if len(cl) == 5:
        print min(cl)
        break
    n += 1
