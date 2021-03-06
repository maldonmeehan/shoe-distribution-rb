require('pry')

class Store < ActiveRecord::Base
  has_and_belongs_to_many(:brands)
  validates(:name, {:presence => true, :length => {:maximum => 50 }})
  before_save(:title_case_name)

  private

  define_method(:title_case_name) do
    self.name = name.downcase.titleize
  end
end
