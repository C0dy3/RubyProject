class Chef < ApplicationRecord
  before_save :normalize_chef_name
  after_create :log_chef_created

  validates :name, presence: true, uniqueness: { case_sensitive: false }

  def normalize_chef_name
    self.name = name.titleize
  end

  def log_chef_created
    Rails.logger.info "Chef created"
  end
end
