
# Imprimir no console todos os dados do Hash
carro = Hash[nome: 'Hb20', marca: 'Hyundai', cor: 'Cinza Titanium']
puts carro

# Imprimir no console apenas o nome
carro = Hash[nome: 'Hb20', marca: 'Hyundai', cor: 'Cinza Titanium']
puts carro[:nome]

# Acrescenta o modelo no final do Hash
carro = Hash[nome: 'Hb20', marca: 'Hyundai', cor: 'Cinza Titanium']
puts carro[:nome]

carro[:modelo] = 'Hatch'
puts carro