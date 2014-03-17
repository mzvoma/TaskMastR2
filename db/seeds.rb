User.destroy_all
user_group = [ { :first_name => "Muchadei",
                  :last_name => "Zvoma",
                  :password => "rugby",
                  :email => "mz@fakemail.com",
                },
                { :first_name => "Jeff",
                  :last_name => "Cohen",
                  :password => "hockey",
                  :email => "jeff.co@fakemail.com",
                },
                { :first_name => "Brian",
                  :last_name => "Eng",
                  :password => "hockey",
                  :email => "brian.eng@fakemail.com",
                },
                { :first_name => "Jolene",
                  :last_name => "Harry",
                  :password => "rugby",
                  :email => "mkenah@fakemail.com",
                }
              ]

user_group.each do |user_info|
  u = User.new
  u.first_name = user_info[:first_name]
  u.last_name = user_info[:last_name]
  u.password = user_info[:password]
  u.email = user_info[:email]
  u.save
end

puts "There are now #{User.count} users in the user_group"


Project.destroy_all
["KIEI925", "Groceries", "Job Search", "High Tech Conference"].each do |project_name|
  p = Project.new
  p.name = project_name
  p.save
end

puts "There are now #{Project.count} projects in the project list"


Task.destroy_all
task_catalog = [ { :name => "Buy Milk",
                      :project_name => 'Groceries',
                      :due => "2014-03-02",
                      :completed => false
                    },
                    { :name => "Get quarters from JewelOsco",
                      :project_name => 'Groceries',
                      :due => "2014-03-02",
                      :completed => true
                    },
                    { :name => "Buy Cereal",
                      :project_name => 'Groceries',
                      :due => "2014-03-02",
                      :completed => false
                    },
                    { :name => "CRUD for Users",
                      :project_name => 'KIEI925',
                      :due => "2014-04-09",
                      :completed => true
                    },
                    { :name => "Add taskmaster columns to Task model",
                      :project_name => 'KIEI925',
                      :due => "2014-04-09",
                      :completed => false
                    },
                    { :name => "Dream Job Discussion",
                      :project_name => 'Job Search',
                      :due => "2014-04-24",
                      :completed => false
                    },
                    { :name => "Find Keynote Speaker",
                      :project_name => 'High Tech Conference',
                      :due => "2014-07-09",
                      :completed => false
                    },
                    ]

task_catalog.each do |task_info|
  t = Task.new
  t.name = task_info[:name]
  t.due = task_info[:due]
  t.completed = task_info[:completed]

  project = Project.find_by(:name => task_info[:project_name])
  t.project_id = project.id
  t.save
end

puts "There are now #{Task.count} tasks in the catalog."

Membership.destroy_all
membership_list = [ { :user_id => User.first.id, :project_id => Project.first.id},
                                { :user_id => User.first.id, :project_id => Project.last.id},
                                { :user_id => User.offset(1).first.id, :project_id => Project.last.id},
                                { :user_id => User.offset(2).first.id, :project_id => Project.first.id},
                                { :user_id => User.last.id, :project_id => Project.first.id},
                                { :user_id => User.last.id, :project_id => Project.last.id}]

membership_list.each do |mem_info|
  m = Membership.new
  m.user_id = mem_info[:user_id]
  m.project_id = mem_info[:project_id]
  m.save
end

puts "There are now #{Membership.count} memberships in the catalog."
