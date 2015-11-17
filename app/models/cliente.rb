class Cliente < ActiveRecord::Base
   validates_presence_of :nome, message: " - Deve ser preenchido"
   validates_uniqueness_of :nome, message: " - Nome já cadastrado"
   validates_numericality_of :idade, greater_than: 0, less_than: 100, message: " - deve ser um numero entre 0 e 100"
   
    has_many :qualificacoes

end
