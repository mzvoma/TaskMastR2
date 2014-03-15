User.destroy_all
user_group = [ { :first_name => "Muchadei",
                  :last_name => "Zvoma",
                  :password => "rugby",
                  :email => "mzvoma@gmail.com",
                },
                { :first_name => "Kudzai",
                  :last_name => "Zvoma",
                  :password => "rugby",
                  :email => "kzvoma@gmail.com",
                },
                { :first_name => "Jolene",
                  :last_name => "Harris",
                  :password => "rugby",
                  :email => "jharris@gmail.com",
                },
                { :first_name => "Molly",
                  :last_name => "Kenah",
                  :password => "rugby",
                  :email => "mkenah@gmail.com",
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
                      :due => "2014-03-02"
                    },
                    { :name => "Get quarters from JewelOsco",
                      :project_name => 'Groceries',
                      :due => "2014-03-02"
                    },
                    { :name => "Buy Cereal",
                      :project_name => 'Groceries',
                      :due => "2014-03-02"
                    },
                    { :name => "CRUD for Users",
                      :project_name => 'KIEI925',
                      :due => "2014-04-09"
                    },
                    { :name => "Add taskmaster columns to Task model",
                      :project_name => 'KIEI925',
                      :due => "2014-04-09"
                    },
                    { :name => "Dream Job Discussion",
                      :project_name => 'Job Search',
                      :due => "2014-04-24"
                    },
                    { :name => "Find Keynote Speaker",
                      :project_name => 'High Tech Conference',
                      :due => "2014-07-09"
                    },
                    ]

task_catalog.each do |task_info|
  t = Task.new
  t.name = task_info[:name]
  t.due = task_info[:due]

  project = Project.find_by(:name => task_info[:project_name])
  t.project_id = project.id
  t.save
end

puts "There are now #{Task.count} tasks in the catalog."
