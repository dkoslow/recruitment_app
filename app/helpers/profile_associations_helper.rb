module ProfileAssociationsHelper
  
  def select_associated_profiles(associated_records)
    records = []
    associated_records.each do |record|
      if record.profile_type == "#{self.name}"
        records << record.profile
      end
    end
    return records
  end
end