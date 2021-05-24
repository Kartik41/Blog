class Friend < ApplicationRecord
   # mount_uploaders :images, ImageUploader
   # has_many :friends_attachments
     #accepts_nested_attributes_for :friends_attachments
     validates :first_name, :last_name, :age, presence: true
     validates :email, format: { with: /\A[^@\s]+@([^@.\s]+\.)*[^@.\s]+\z/ }
     validates :phone, length: { in: 10..12}
     #validates :first_name, :uniqueness => {:message => "already taken"}
     


end
