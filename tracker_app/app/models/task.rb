class Task < ApplicationRecord
  enum status: [:todo, :done], _prefix: true, _scopes: false

  validates :title, presence: true

  belongs_to :assignee, class_name: 'User', optional: true
  belongs_to :creator, class_name: 'User', optional: true
end
