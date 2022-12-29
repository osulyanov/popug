class User < ApplicationRecord
  enum role: [:admin, :manager, :employee], _prefix: true, _scopes: false
end
