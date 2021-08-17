"""
Cours INFO-H100
ULB 2019-2020
Lucas Placentino
07/11/2019
"""

'''
set:
    s={'1','2','3'}

    & | - ^ < <= > >= len(s) in not in

s= set("pommeee")
t= set("banane")
>>>s & t
{'e'}

>>>list(set("pomme") & set("banane"))
? #TODO

s |= t : update s, adding element from t
s &= t : update s, keeping only elements found in it and t
s -= t update s, removing elements found in t
s ^= t update s, keeping only elements found in either in set, but not in both
s.copy() : return a new set with a shallow copy of s
s.add
s.remove
s.discard
s.
...

ensemble: s = set( )
dictionnaire: d = {}

ex : r = {'d':{'e':'POP'},'e':{'t':'HG'}}
ici, 'd' est une clef

d.sort ne marche pas sur un dictionnaire
alors >>>ma_liste = list(d.items)
    [('007':{...,'nom':'James'}),('666':{...,'nom':'Devil'})]

>>>ma_liste.sort(key= lambda elem: elem[1]['nom']) #trie par 'nom'
[('666':{}),('007':{})]

Types de clefs:

dictionnaire est un table, avec une clef et une valeur

hashable (et donc immuable)
d={}
d['Th']=1515                 size 6
hash('Th') % size -> 3
d['Isa']=007
hash('Isa') % size -> 1
en 1seul essai!

attention collisions
 d['Jo']='stephen'
 hash('Jo') % size -> 3
    2 essais

for:
    d = {'one':'un','deux':'two'}
    for elem in d:
        print(elem)

    ??

attention:
    d.setdefault(k [, v]) : d[k] si elle existe sinon v et rajoute d[k]=v

Recherche et tris:

min(s)

i in s

s.sort

Recherche dichotomique à l'exam'
    photo
Tri par séléection à l'exam'
    photo
    


'''
