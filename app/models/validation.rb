class Validation < ActionMailer::Base
  def test
    recipients 'ferparra83@gmail.com'
    subject 'prueba'
  end

end
