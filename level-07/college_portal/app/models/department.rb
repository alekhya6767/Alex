class Department < ApplicationRecord

  #associations
  has_many :sections, dependent: :destroy
  has_many :students, :through => :sections, dependent: :destroy

  # validations
  validates :name, presence: true, uniqueness: true

  #callbacks
  before_save :convert_name_to_caps

  private

  def convert_name_to_caps
    name.upcase!
  end
end
