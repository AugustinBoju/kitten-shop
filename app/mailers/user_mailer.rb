class UserMailer < ApplicationMailer
  default from: 'no-reply@kitten-shop-thp.herokuapp.com'


  def order_email(order)
    #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
    @order = order

    #on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url  = 'http://monsite.fr/login'

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: order.user.email, subject: "Kitty Kat cmd N°#{@order.id}")
  end

  def admin_email(order)
    #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
    @order = order

    #on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url  = 'http://monsite.fr/login'
    @admin = User.find_by(is_admin: true)
    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @admin.email, subject: "New Order N°#{@order.id}")
  end

  def welcome_email(user)
    #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
    @user = user

    #on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url  = 'http://monsite.fr/login'

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @user.email, subject: 'Bienvenue chez nous !')
  end
end
