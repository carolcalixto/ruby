

class Conta
    attr_accessor :saldo

        def deposita(valor)
            self.saldo += valor #com o self consigo invocar o atributo saldo dentro da minha própria classe
            #puts 'Depositando a quantia de ' + valor.to_s + ' reais'
            puts "Depositando a quantia de #{valor} reais" #isso chama interpolação (faz a conversão para string automaticamente) de strings, melhor trabalhar com esta forma
        end
end

c = Conta.new

c.saldo = 0.0
c.deposita(100.00)
puts c.saldo