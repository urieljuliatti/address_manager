module CleanPhone
  def phone_number_parser(phone)
    phone_number = phone.delete('(').delete(')').delete('.').delete(' ').delete('-')
    if phone_number.length < 10
      phone_number = 'Invalid number'
    elsif phone_number.length == 11 && phone_number[0].to_i != 1
      phone_number = phone_number[1..10]
    end
    phone_number
  end
end
