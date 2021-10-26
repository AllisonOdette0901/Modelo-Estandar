

# FUNCION PARA PASAR A FORMATO ESTANDAR UN PROBLEMA DE PL

function forma_estandar(A,b)
    m,n = size(A) #m =renglones, n=columnas

    # definición de matriz A de dim mx(n+m)
    Aux = zeros(m, n+m)

    #Las primeras n columnas son las de A
    for j in 1:n
        Aux[:,j] = A[:,j]
    end

    # las columnas desdes n+i tienen un 1 en la fila i <= bi
    for i in 1:m
        Aux[i,n+i] = 1
        #si b[i] es negativo, entonces
        if b[i] < 0
        # multiplicar por -1 las filas de Aux
        Aux[i,:] = -1.0*Aux[i,:]
        # multiplicar por -1 las filas de b
        b[i] = -b[i]
        end
    end

    # se retorna Aux y b ambos modificados
  return Aux, b
end


# ejemplo de ricitos

# matriz asociada:
A = [-2 -1; -2 -3]

# vector de lado derecho
b = [-12 -18]

A_est,b_est = forma_estandar(A, b)
A_est
