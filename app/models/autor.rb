class Autor < ApplicationRecord
  has_many :articles
  # Include default devise modules. Others available are:

  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  #:ConfirmarElEmail, :bloquearDespuesDeIntentos, :CerrarSesionDespuesDeTiempo, :guardarIp,
  
devise :database_authenticatable, :registerable,
       #:compararContraseñaEnbase de datos, :creaTodoElSign_up
       :recoverable, :rememberable, :validatable
       #:RecuperarContraseña, :checkRecuerdame, :validacionesPorEjemploDeFormato
end
