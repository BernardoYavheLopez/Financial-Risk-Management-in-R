#### Ejemplode la LGN ####

# 1. Lanzamos una moneda : L = numero obtenido

L = sample (c(1,2,3,4,5,6),1)
# 1.1. La funcion sample genera un numero aleatorio entre (1,2,3,4,5,6)
# 1.2. 'L= esto es para guardar el resultado en L
# c representaa un vector de numeros 


# 1.3 La funcion sample tambien se puede usar de la siguiente manera
sample(c(1,2,3,4,5,6)) # 1.4. Nos da cuatro numero seleccionados al azar del vector (1,2,3,4,5,6)
                      #E 1.5. Esto lo hace sin remplazo
sample(c(1,2,3,4,5,6),5,replace=TRUE) # 1.6 Nos da 5 numeros aleatorios con reemplazo NOTA el valor fuera de los parentecis de 5 corresponde al numero de repeticiones no podemos poner un numero superior de los numero dentro del vector

#Estas dos funciones no guardan los datos

# 2. Para generar muchos casos vamos hacer :
#N = es el numero de lanzamientos que vamos hacer
n = 1000 
L = sample(1:6,n,replace = T)
#ahora en vez de pner un vector ponemos : que se ignifica que se tomara un rango de numeros consecutivos desde el 1 al 6
# Le pasamos el numero de veces que sera de lanzamientos que es N ojo con el punto 1.5 

?sample # Nos da informacion de esta funcion 

L # Esto nos da los resultados de la simulacion 
mean(L) # ESto calcula el promedio de L 
#vamos a sacar los promedios parciales
cumsum(L) # esto nos da la sumasparciales de L
1:1000
cumsum(L)/(1:n) # esto divide entrada por entrada

E = cumsum(L)/(1:n) # esto guarda el vector de promedios parciales 

plot(E) # Esto grfica el promedio parcial de los vectores 
plot(E,type = "l", col = "red", lwd = 2 )
abline(h=3.5,col="blue")

#Para borrar todo lo que tenemos en R se puede de 2 formas con el icono de escoba y otra con una funcion 
# la funcion rm y si quieres que borre todo le pones list = para listas list = ls() y el ls borra el historial de todo lo realizado quedaria asi 
#rm(list = ls())

#vamos a cargar del dado 

vec_probas = c(0.5,0.25,0.1,0.05,0.05,0.05) # vector con probabilidades para cada cara
sum(vec_probas)

n= 1000 #n es el numero de lanzamientos 
L = sample(1:6,n,replace = T, prob = vec_probas) #Genera n lanzamientos cargados
L

#vamos a pedir la media terica

sum((1:6)*vec_probas)

E = cumsum(L)/(1/n) # esto guarda el vec de promedios parciales
plot(E,type = "l", col = "red", lwd = 2 )
abline(h= 2.05,col="blue")

#### JUego de la apuesta con el dado ####
#Lanzamos el dado 
#Perdida = 100 - c si sale el 6
c = 0 
n = 1000 # esto es el numero de apuestas a jugar
L  =  sample(c(100-c,-c),
             n,replace = T, 
             prob = c(1/6,5/6)) # se pueden utilizar los saltos de linea si tenemos funciones muy grandes
plot(cumsum(L)/(1:n),type="l", lwd = 2)
abline(h = 100 / 6, col = "blue")

#Grafica de perdida acomulada 
plot(cumsum(L), type = "l", lwd = 2)
lines((1:n)*100/6, col = "green" , lwd = 2)

E = mean(L)
E
E*n # Esto es la perdida total 

# vamos anadir el cobro 
n = 100000
c = 100/6 
L  =  sample(c(100-c,-c),
             n,replace = T, 
             prob = c(1/6,5/6)) # se pueden utilizar los saltos de linea si tenemos funciones muy grandes
plot(cumsum(L)/(1:n),type="l", lwd = 2)
abline(h=0, col= "red")

E = mean(L)
E

#Cambiamos el cobro

c = (100/6) + 0.5 
L  =  sample(c(100-c,-c),
             n,replace = T, 
             prob = c(1/6,5/6)) # se pueden utilizar los saltos de linea si tenemos funciones muy grandes
plot(cumsum(L)/(1:n),type="l", lwd = 2)
abline(h=0, col= "red")

mean(L)*n


