
class Veiculo
    attr_accessor :nome, :marca, :modelo
    
    def initialize(nome, marca, modelo)
        self.nome = nome
        self.marca = marca
        self.modelo = modelo
    end

    def ligar
        puts "O veículo #{nome} está pronto para iniciar o trajeto"
    end

    def buzinar
        puts 'Beep! Beep!'
    end
end

class Carro < Veiculo # Classe Carro está herdando tudo da classe pai Veiculo
    def dirigir
        puts "O carro #{nome} está iniciando o trajeto"
    end
end

class Moto < Veiculo # Classe Moto está herdando tudo da classe pai Veiculo
    def pilotar
        puts "A moto #{nome} está iniciando o trajeto"
    end
end

hb20 = Carro.new('HB20', 'Hyundai', 'Hatch')
hb20.ligar
hb20.buzinar
hb20.dirigir

santafe = Carro.new('Santa Fe', 'Hyundai', 'SUV')
santafe.ligar
santafe.buzinar
santafe.dirigir

fazer = Moto.new('Fazer', 'Yamaha', '250x')
fazer.ligar
fazer.buzinar
fazer.pilotar