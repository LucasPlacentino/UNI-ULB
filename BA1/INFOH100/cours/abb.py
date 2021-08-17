
def histoire(d,p):
    p = str(p)
    with open(p, encoding='utf-8') as texte:
        for r in texte:
            hist = texte.readline()
            hist = hist.strip()
            print(hist)
            for i in range(len(d)):
                l = str(d[i])
                e = ["{"+(str(i))+"}"]
                e = "".join(e)
                r = hist.replace(e, l)
            res = r
            print(res)

donnees=[]
path = str(input())
x=''
while x != "FINI":
    x=input()
    donnees.append(x)
histoire(donnees,path)