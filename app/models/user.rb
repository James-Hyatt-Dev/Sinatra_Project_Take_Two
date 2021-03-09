class User < ActiveRecord::Base
    has_many  :projects
  
  
    has_secure_password

    validates :name, presence: true
    validates :username, presence: true, uniqueness: true
    validates :username, format: { without: /\s/ }
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true
  
  
    def slug
      username.downcase.gsub(" ","-")
    end
  
    def self.find_by_slug(slug)
      User.all.find{|user| user.slug == slug}
    end
  
  end