class Examine < ActiveRecord::Base
  default_scope order(:scheduled_date)

  before_create :assign_ordinal

  has_and_belongs_to_many :blocks
  
  has_many :scripts, :dependent => :destroy
  accepts_nested_attributes_for :scripts, :reject_if => lambda { |a| a[:name].blank? }, :allow_destroy => true

  validates_presence_of :name, :num_try, :period #, :test_type
  validates :num_try, :numericality=>{:only_integer=>true},:allow_blank=>false
  validates :period, :numericality=>{:only_integer=>true},:allow_blank=>false
  
  EXAMINE_TYPES = ['для слушателей подготовительного факультета',
                   'для учащихся подшефных школ',
                   'для самостоятельного тестирования студентов',
                   'промежуточные тесты контроля знаний для студентов',
                   'экзаменационные тесты для студентов']
  
  private
  
  def assign_ordinal
    num = Examine.maximum('ordinal')
    if num.nil?
      self.ordinal = 1
    else
      self.ordinal = num + 1
    end
  end
end
