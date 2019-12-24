
# TIMES Vai executar a instrução 5 vezes, neste caso vai mostrar a string 5 vezes no console
5.times do 
    puts 'Carolllll'
end

# TIMES - Vai executar a instrução 6 vezes, neste caso vai mostrar a string 5 vezes no console com os dados concatenados
6.times do |i|
    puts 'Instrução apresentada: ' + i.to_s + ' vez(es)'
end

# WHILE - enquanto a condição é verdadeira o while será executado
init = 0
while init <= 10 do
    puts 'Repetindo a mensagem com WHILE ' + init.to_s + ' vez(es)'
    init +=1 # incrementa até ser menor ou igual a 10 para não virar loop infinito (precisa usar essa variável)
end

# FOR - declara a variável dentro da estrutura do for
for ite in (1..5) # quando usamos (..) estamos dizendo ao Ruby que inclua o número mais alto do intervalo definido. Se usarmos (...) ignoramos isto.
    puts 'Repetindo a mensagem com FOR ' + ite.to_s  + ' vez(es)'
end

# For each com Array
vingadores = ['Huck', 'Spider Man', 'Capitão América']
vingadores.each do |v|
    puts v
end
