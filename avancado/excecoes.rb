# begin e rescue é o mesmo que o famoso try catch
begin
    # Tentar alguma coisa
    file = File.open('./ola.txt') # o ./ é pra pegar o arquivo txt na raiz desse mesmo arquivo de exceções
    if file
        puts file.read
    end
    
rescue Exception => e #o e é um argumento para pegar o resgate
    #Obter um possível erro
    puts e.message # pra mostrar o erro caso não encontre o arquivo
    puts e.backtrace # pra mostrar o erro caso não encontre o arquivo
end

# Método com tratamento de exceção
def soma(numero1, numero2) 
    numero1 + numero2
rescue Exception => e
    #puts e.message # ou a linha de baixo
    puts 'Não foi possível executar a soma'
end

soma('12', 7)