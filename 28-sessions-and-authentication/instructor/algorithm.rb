class User
  def authenticate(password)
    stored_salt            = password_digest(0..3)
    hashed_salted_password = password_digest(4..*)

    hash(password, stored_salt) == hashed_salted_password
  end
end

submitted_email    = params[:email]
submitted_password = params[:password]

u = User.find_by(email: submitted_email)

if u.authenticate(submitted_password)
  # Access Granted!
  # redirect to dashboard
else
  # Access Denied!
  # re-render form with error message
end
