class Wine < ActiveRecord::Base
    validates_presence_of :brand, :winery, :state, :county, :vintage, :price
end
