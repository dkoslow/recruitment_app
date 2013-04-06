namespace :company_suggestions do
  desc "Generate company suggestions"
  task index: :environment do
    CompanyList.index_objects
  end
end