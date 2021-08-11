class Travel < ApplicationRecord
    validates :title, :content, presence:true
    validates :title, uniqueness:true, length: {minimum:10}   
end
