module FormHelper

  def cancel_path(record)
    if record.new_record?
      polymorphic_url(record.class)
    else
      polymorphic_url(record)
    end
  end

end
