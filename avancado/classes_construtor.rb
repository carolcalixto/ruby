

class Conta
    attr_accessor :saldo, :nome

        def initialize(nome) #construtor - esse método é executado, automaticamente, toda vez que o new é feito
            self.saldo = 0.0
            self.nome = nome
        end
        
        def deposita(valor)
            self.saldo += valor #com o self consigo invocar o atributo saldo dentro da minha própria classe
            #puts 'Depositando a quantia de ' + valor.to_s + ' reais'
            puts "Depositando a quantia de #{valor} reais na conta de #{self.nome}" #isso chama interpolação (faz a conversão para string automaticamente) de strings, melhor trabalhar com esta forma
        end
end

c = Conta.new('Carol')#tem que passar o argumento do construtor quando ta instanciando a classe(new)

c.deposita(100.00)
puts c.saldo

c.deposita(10.00)
puts c.saldo