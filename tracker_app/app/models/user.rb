class User < ApplicationRecord
  enum role: [:employee, :manager, :admin], _prefix: true, _scopes: false
end
