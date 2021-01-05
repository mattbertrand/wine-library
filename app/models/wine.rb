class Wine < ActiveRecord::Base
    belongs_to :user
    
    validates_presence_of :brand, :winery, :state, :county, :varietal, :vintage, :price
end
