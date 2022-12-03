User.find_or_create_by(name: "Kesha", role: :admin)
User.find_or_create_by(name: "Flint", role: :manager)
%w[Lago Blu Zazu Paulie Tom Macaw].each do |name|
  User.find_or_create_by(name: name, role: :employee)
end
