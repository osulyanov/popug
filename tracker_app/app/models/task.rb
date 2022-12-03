class Task < ApplicationRecord
  enum status: [:todo, :done], _prefix: true, _scopes: false
end
