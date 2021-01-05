class Wine < ActiveRecord::Base
    validates_presence_of :brand, :winery, :state, :county, :varietal, :vintage, :price
end
