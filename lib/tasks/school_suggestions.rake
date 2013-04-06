namespace :school_suggestions do
  desc "Generate school suggestions"
  task index: :environment do
    SchoolList.index_objects
  end
end