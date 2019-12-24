
# Método simples
def diga_ola
    puts 'Olá'
end

diga_ola

# Método simples com valor concatenado
def diga_ola_carol(nome)
    puts 'Olá, ' + nome
end

diga_ola_carol('Carol! <3')

# Método simples, porém mostrando o resultado através de uma variável
def retorna_nome
    'Carol Caracol'
end

resultado_nome = retorna_nome
puts resultado_nome

# Método com argumentos
def soma(valor1, valor2)
    total = valor1 + valor2
    total
end

res = soma(12, 7)
puts res