def recensement(name_in, name_out):
    #d={}
    d1={}
    d2={}
    with open(name_in) as fichier:
        '''
        filles, garcons = 0, 0
        for t in fichier:
            a = t.strip().split()
            if a[2] == 'F':
                filles+=1
            elif a[2] == 'M':
                garcons+=1
            if a[1] in d:
                d[a[1]]=1
            else:
                d[a[1]]+=1
        '''
        for t in fichier:
            classe, nom, genre = t.strip().split()
            d1[nom]=d1.get(nom, 0)+1
            d2[genre]=d2.get(genre, 0)+1
        l=sorted(list(d1.keys()))
    with open(name_out, 'w') as fichier:
        '''
        b=d.keys()
        c=[]
        for i in b:
            c.append(i.join(' ').join(d[i]))
        fichier.write('F', filles) #manque tab \t
        fichier.write('M', garcons) #manque tab \t
        for r in c:
            fichier.write(r)
        '''
        fichier.write("F\t{}\nM\t{}".format(d2.get('F',0),d2.get('M',0)))
        for r in l:            # ? correct ?
            fichier.write(r)   # ? correct ?


def sort_words(data=['JEAN','JOHN','ZARGRDZ','BARBARA','LEA','JEAN-PHILIPPE']):
    ls=[]
    m=len(data)
    longueurs=[]
    for i in range(m):
        print(i)
        longueurs.append(len(data[i]))
        print(longueurs[i])
    a=len(longueurs)
    print(a)
    for t in range(len(data)):
        print(t)
        b=min(longueurs[:a-t])
        i = longueurs.index(b)
        print(i)
        ls.append(data[i])
        print(ls[t])
        print(ls)
        del data[data.index(ls[t])]
        del longueurs[longueurs.index(len(ls[t]))]
        if b == len(ls[t-1]):
            if ls[t][0]<ls[t-1][0]:
                ls[t], ls[t-1] = ls[t-1], ls[t]
    return ls
sort_words()



dr = {'d':'DDD'}
text_in = list(open("le-petit-prince.txt").read())
text_out = []
print(text_in)
#for c in text_in:
    #print(c)
    #text_out.append(dr.get(c, c))
    #print(text_out)
print(text_out)