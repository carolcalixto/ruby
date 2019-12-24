

valor1 = 0
valor2 = 0
resultado = 0
operacao = ''

puts 'Digite o primeiro número: '
valor1 = gets.chomp.to_i

puts 'Digite o segundo número'
valor2 = gets.chomp.to_i

puts 'Escolha a operação (+, -, *, /): '
operacao = gets.chomp

if operacao == '+'
    resultado = valor1 + valor2
elsif operacao == '-'
    resultado = valor1 - valor2
elsif operacao == '*'
    resultado = valor1 * valor2
elsif operacao == '/'
    resultado = valor1 / valor2
else
    puts 'Operação não permitida!'
end

puts 'O resultado é: '
puts resultado