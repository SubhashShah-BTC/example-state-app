# Admin user
admin = User.find_or_initialize_by(email: "admin@realstate.com")
admin.name = "Admin"
admin.password = "password123"
admin.password_confirmation = "password123"
admin.role = "admin"
admin.mobile_number = "1234567890"
admin.save!
p "Admin created with #{admin.email}"

# Agent
agent = User.find_or_initialize_by(email: "agent@realstate.com")
agent.name = "Agent"
agent.password = "password123"
agent.password_confirmation = "password123"
agent.role = "agent"
agent.mobile_number = "23232323"
agent.save!
p "Agent created with #{agent.email}"

# Customer
customer = User.find_or_initialize_by(email: "customer@realstate.com")
customer.name = "Customer"
customer.password = "password123"
customer.password_confirmation = "password123"
customer.role = "customer"
customer.mobile_number = "33333333"
customer.save!
p "Customer created with #{customer.email}"