import requests as G
from os.path import exists as H,join
from os import mkdir
def A(epreuve):
	B=epreuve;D=f"http://www.bacweb.tn/bac/%s/principale/informatique/{B}.pdf";E=D.split('/')
	for I in range(13):
		A=2008+I;print(f"[+] Downloading {B} - {A}.pdf");C=E[-2] + '_Corrigé';J=E[-1].split('.')[0]+'-'+str(A)+'.pdf';F=G.get(D%A)
		if F.status_code==200:
			if H(C)==False:mkdir(C)
			with open(join(C,J),'wb')as K:K.write(F.content)
		else:print(f"[!] Error Downloading {B} - {A}.pdf !!!")
B=['math_c','physique_c','anglais_c','arabe_c','francais_c','philo_c','allemand_c','algorithme_c','bd_c']
for C in B:A(C)
