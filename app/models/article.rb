class Article < ApplicationRecord
  belongs_to :autor
  has_many :comments, dependent: :destroy
  validates :title, presence: { :message => "no puede estar vacio"}
  validates :content, presence: { :message => "no puede estar vacio"}, length: {minimum: 50, :message => "es demasiado corto, mínimo 50 caracteres"}
end
