module CleanZipcode
  def clean(zipcode)
    zipcode.to_s.rjust(5, '0')[0..4]
  end
end
