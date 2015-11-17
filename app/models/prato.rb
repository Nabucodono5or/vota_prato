class Prato < ActiveRecord::Base
    validates_presence_of :nome, message: " - Deve ser preenchido"
    validates_uniqueness_of :nome, message: " - nome já cadastrado"
    
    has_and_belongs_to_many :restaurantes
    has_one :receita    
    
    validate :presence_presence_of_more_than_one_resaturante

    private
    def presence_presence_of_more_than_one_resaturante
        errors.add("restaurantes","Deve haver ao menos um restaurante") if  restaurantes.empty?   
    end

end
