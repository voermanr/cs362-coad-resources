#ApplicationRecord inherits the methods and information from ActiveRecord class in Base
#Represents the Record of the Application and sets the abstract_class variable to true
class ApplicationRecord < ActiveRecord::Base
    self.abstract_class = true
end
