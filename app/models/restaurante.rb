class Restaurante < ActiveRecord::Base
    validates_presence_of :nome, message: "deve ser preenchido"
    validates_presence_of :endereco, message: "deve ser preenchido"
    validates_presence_of :especialidade, message: "deve ser preenchido"

    validates_uniqueness_of :nome, message: "nome já cadastrado"
    validates_uniqueness_of :endereco, message: "endereço já cadastrado"    

    validate :primeira_letra_maiuscula
    
    has_many :qualificacoes
    has_and_belongs_to_many :pratos    
    
    has_many :comentarios, as: :comentavel
    scope :massas, -> {where(especialidade: 'massas')}
    scope :recentes, -> {where(["created_at > ?",3.months.ago])}

    private
    def primeira_letra_maiuscula
        errors.add(:nome, "a letra deve iniciar com maiuscula") unless nome =~/[A-Z].*/   
    end
    
    has_attached_file :foto, styles:
        { medium: "300x300>", thumb: "100x100>" }
    validates_attachment_content_type :foto, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end
