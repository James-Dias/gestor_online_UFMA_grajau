class UserDecorator < Draper::Decorator
  delegate_all
  def cpf
    CPF.new(object.cpf).formatted
  end
end
