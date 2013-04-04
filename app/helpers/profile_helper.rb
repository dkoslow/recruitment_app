module ProfileHelper

private

  def build_associated_user
    User.new_user = build_user(email: email, company: company, current_location:current_location,
                 first_name: first_name, last_name: last_name,
                 phone_number: phone_number, school: school)
  end

  def save_associated_user
    User.new_user.save!
  end
end