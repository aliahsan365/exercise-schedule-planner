from random import randrange

nDias = 15 #numero de dias
nCont = 6  #numero de ejercicios por dia
nNivs = 10 #numero de niveles
nEjrs = randrange(5,15,1)  #numero de ejercicios
niveles = []
preparadores = {}
precursores = []

# Devuelve un numero pseudoaleatorio con altas probabilidades de ser el
# valor inicial o un valor cercano (probabilidad marcada por z sobre 10)
def custom_rand(x, y, z=None):
	if x==y:
		return y
	if z is None:
		z=5
	if x>y:
		return custom_rand_rev(y,x,z)
	a=randrange(0,9,1)
	if z is None:
		z=5
	if a<z:
		return x
	return custom_rand(x+1,y,z)

# Auxiliar de custom_rand para cuando el rango es de un numero mayor a un
# numero menor. Asumo que ya he dado la vuelta a los extremos y que x<y
def custom_rand_rev(x, y, z):
	if x==y:
		return y
	a=randrange(0,9,1)
	if a<z:
		return y
	return custom_rand_rev(x,y-1,z)

# Imprime la secuenca de dias, el siguiente de dia1 es dia2, etc
def print_secuencia_dias(z):
	for i in range(1,z):
		print("(dia_siguiente dia" + str(i) +" dia" + str(i+1) + ")")

# Imprime la secuenca de niveles, el siguiente de nivel0 es nivel1, etc
def print_secuencia_niveles(z):
	for i in range(0,z):
		print("(nivel_siguiente nivel" + str(i) +" nivel" + str(i+1) + ")")

# Imprime los niveles que el usuario tiene en cada ejercicio al iniciar el
# programa
def print_niveles_ej_iniciales(z):
	for i in range(1,z+1):
		niveles.append(custom_rand(0,nNivs))
		preparadores.setdefault("ejercicio"+str(i),set())
		precursores.append(0)
		print("(ejercicio_nivel ejercicio"+str(i) +" nivel"+str(niveles[i-1])+")")

# Imprime la secuenca de contadores, el siguiente de cont0 es cont1, etc
def print_secuencia_contadores(z):
	for i in range(0,z): print("(contador_siguiente cont"+str(i)+" cont"+str(i+1)+")")

# Imprime los contadores iniciales para cada dia (cont0)
def print_contadores_iniciales(z):
	for i in range(1,z+1): print("(contador_dia dia"+str(i)+" cont0)")

# Imprime la cabecera del juego de pruebas, con la definicion, el dominio y los
# objetos que pertenecen a este dominio
def print_header(x, y, z, w):
	print("(define (problem problema1)\n(:domain planificador_ejercicios)\n(:objects")
	for i in range(1, x+1): print("ejercicio"+str(i)+" - ejercicio")
	for i in range(1, y+1): print("dia"+str(i)+" - dia")
	for i in range(0, z+1): print("nivel"+str(i)+" - nivel")
	for i in range(0, w+1): print("cont"+str(i)+" - contador")
	print(")\n")

# Imprime un objetivo
def print_single_goal(x,z):
	a=randrange(1,x)
	nivel_obj=custom_rand(z,niveles[a])
	print("(ejercicio_nivel ejercicio"+str(a)+" nivel"+str(nivel_obj)+")")

# Imprime todos los objetivos
def print_goals(x,z,w):
	if w==1:
		print("(:goal")
		print_single_goal(x,z)
	else:
		print("(:goal (and")
		for i in range(1,w+1):
			print_single_goal(x,z)
		print(")")
	print(")")

# Imprime los ejercicios preparadores de aquellos ejercicios que tienen preparacion
def print_preparadores(x):
	global preparadores
	nPrep=randrange(0,x,1)
	for i in range(1,nPrep+1):
		preparado=randrange(1,x,1)
		preparador=randrange(1,x,1)
		while preparado==preparador:
			preparador=randrange(1,x,1)
		if not preparado in preparadores["ejercicio"+str(preparador)]:
			if len(preparadores["ejercicio"+str(preparado)])<=0:
				print("(ejercicio_preparable ejercicio"+str(preparado)+")")
				preparadores["ejercicio"+str(preparado)].add(preparador)
				print("(ejercicio_preparador ejercicio"+str(preparado)+" ejercicio"+str(preparador)+")")
			elif check_no_preparacion_bucle(preparado,preparador):
				print("(ejercicio_preparador ejercicio"+str(preparado)+" ejercicio"+str(preparador)+")")

# Asegura que no haya bucles de preparacion entre ej y ej_prep, es decir, que
# ni ej_prep, ni sus preparadores, ni los preparadores de estos, etc,
# no se tengan que preparar con ej
def check_no_preparacion_bucle(ej,ej_prep):
	global preparadores
	if len(preparadores["ejercicio"+str(ej_prep)])<=0:
		return True
	check=True
	for preparador in preparadores["ejercicio"+str(ej_prep)]:
		check=check and preparador != ej and check_no_preparacion_bucle(ej,preparador)
	return check

# Imprime el precursor de aquellos ejercicios que tengan precursor
def print_precursores(x):
	global precursores
	nPrec=randrange(0,x,1)
	for i in range(1,nPrec+1):
		precedido=randrange(1,x,1)
		if precursores[precedido]!=0:
			return
		precursor=randrange(1,x,1)
		while precedido==precursor or precursores[precursor]==precedido:
			precursor=randrange(1,x,1)
		if check_no_preparacion_bucle(precedido,precursor):
			print("(ejercicio_precedible ejercicio"+str(precedido)+")")
			print("(ejercicio_precursor ejercicio"+str(precedido)+" ejercicio"+str(precursor)+")")


####### IMPRESION DEL JUEGO DE PRUEBAS ########
print_header(nEjrs, nDias, nNivs, nCont)
print("(:init")
print("(estamos_dia dia1)")
print("(contador_max cont"+str(nCont)+")")
print_secuencia_contadores(nCont)
print_contadores_iniciales(nDias)
print_secuencia_dias(nDias)
print_secuencia_niveles(nNivs)
print_niveles_ej_iniciales(nEjrs)
print_preparadores(nEjrs)
print_precursores(nEjrs)
print(")\n")
print_goals(nEjrs,nNivs,custom_rand(1,nEjrs))
print(")\n")
