namespace :db do
  desc "Fill databases"
  task populate: :environment do
    CompanyList.populate 100 do |company|
      company.name = Faker::Company.name
      company.popularity = 1..100
    end

    SchoolList.populate 25 do |school|
      school.name = "University of #{Faker::Name.last_name}"
      school.popularity = 1..100
    end

    SchoolList.populate 25 do |school|
      school.name = "University of #{Faker::Name.last_name}"
      school.popularity = 1..100
    end

    SchoolList.populate 25 do |school|
      school.name = "#{Faker::Name.last_name} College"
      school.popularity = 1..100
    end

    SchoolList.populate 25 do |school|
      school.name = "#{Faker::Name.last_name} University"
      school.popularity = 1..100
    end
  end
end

