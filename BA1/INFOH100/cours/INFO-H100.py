"""
    Auteur: Lucas F Placentino
    ULB (EPB) 2019-2020
"""
def intersection(v, w): # UpyLaB 5.9
    res = []
    r = []
    for i in v:
        if i in w:
            for p in range(len(v)-v.index(i)-1):
                if v[v.index(i)+p] == w[w.index(i)+p]:
                    print(v[v.index(i)+p], w[w.index(i)+p])
                    r.append(v[v.index(i)+p])
                else:
                    break
            res.append(r)
            r = []
    print(res)
    if len(res[0])>len(res[2]):
        t = res[0]
    else:
        t = res[2]
    print(t)
    s = str(''.join(t))
    return s



a = input()
b = input()
print(intersection(a, b))
print(a)
print(b)
"""
def intersection(v, w):
    res = []
    r = []
    for i in v:
        if i in w:
            for p in range(len(v)-v.index(i)-1):
                if v[v.index(i)+p] == w[w.index(i)+p]:
                    r.append(v[v.index(i)+p])
                else:
                    break
            res.append(r)
        r=[]
    if len(res[0])>len(res[2]):
        t = res[0]
    else:
        t = res[2]
    s = str(''.join(t))
    return s
"""