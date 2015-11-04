# @todo clear to seed all file
Dir[File.join(Rails.root, 'db', 'seeds', '14_shozai.rb')].sort.each { |seed| load seed }
Dir[File.join(Rails.root, 'db', 'seeds', '15_kikan.rb')].sort.each { |seed| load seed }
Dir[File.join(Rails.root, 'db', 'seeds', '16_eki.rb')].sort.each { |seed| load seed }
# Dir[File.join(Rails.root, 'db', 'seeds', '*.rb')].sort.each { |seed| load seed }