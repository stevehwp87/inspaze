class Contact < ActiveRecord::Base

	validates :email, format: { with: /\A[^@]+@[^@]+\z/,
    message: "Please enter valid email address" }, presence: { message: "Hi, what is your email?" }
    validates :name, presence: { message: "Hi, what is your name?" }
    validates :subject, presence: { message: "Please enter the subject" }
    validates :message, presence: { message: "Please let us know your message" }
end
