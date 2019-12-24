
class AvengersHeadQuarter
    attr_accessor :list

    def initialize
        self.list = []

    end

    def put(avenger)
        puts self.list.class
        self.list.push(avenger) # está linha adiciona um vingador na lista criada acima
    end
end

# TDD
describe AvengersHeadQuarter do
    it 'deve adicionar um vingador' do
        hq = AvengersHeadQuarter.new

        hq.put('Spiderman')
        expect(hq.list).to eql ['Spiderman']
    end
end