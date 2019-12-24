

# Ruby é uma linguagem considerada puramente orientada a objetos
# Porque no Ruby tudo (classes, métodos, variáveis) é objeto


# Classe é uma forma de organizar ações e atributos para um determinado objeto da vida real
# Classe possui atributos (características) e métodos (ações)
# Por exemplo: Carro | Atributos: Nome, Marca, Modelo, Cor, etc) | Ações: Ligar, Buzinar, Parar, etc


class Carro
    attr_accessor :nome
    def Ligar
        puts 'O carro está pronto para iniciar o trajeto'
    end
end

hb20 = Carro.new
hb20.nome = 'HB20'

puts hb20.nome
hb20.Ligar