class Section < ApplicationRecord

  #associations
  belongs_to :department
  has_many :students, dependent: :destroy

  #validations
  validates :name, presence: true, uniqueness: true
  validates :department_id, presence: true

  #callbacks
  before_save :convert_name_to_caps

  private

  def convert_name_to_caps
    name.upcase!
  end
end
