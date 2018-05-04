class Blog < ActiveRecord::Base
  belongs_to :user
  has_many :comments

  acts_as_taggable

  def convert_create
    self.created_at.in_time_zone('Eastern Time (US & Canada)').strftime('%-m/%-d/%y %-l:%M%P')
  end

  def convert_updated
    self.updated_at.in_time_zone('Eastern Time (US & Canada)').strftime('%-m/%-d/%y %-l:%M%P')
  end

end
