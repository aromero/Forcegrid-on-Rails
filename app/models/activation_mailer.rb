class ActivationMailer < ActionMailer::Base
  

  def activation_instructions(user)
    subject    'Activation Instructions'
    recipients  user.email
    from      'ITParc Notifier <accountvalidation@itparc.com>'
    sent_on    Time.now
    
    body       :account_validation_url => register_url(user.perishable_token)
  end

  def activation_confirmation(user)
    subject    'Activation Complete'
    recipients  user.email
    from       'ITParc Notifier <accountvalidation@itparc.com>'
    sent_on    Time.now
    
    body       :root_url => root_url
  end

end
