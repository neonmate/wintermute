module FormHelper

  def cancel_path(record)
    if record.new_record?
      polymorphic_url(record.class)
    else
      polymorphic_url(record)
    end
  end

  def help_link(path)
    if current_user.present?
      modal_link_to 'help us', path
    else
      link_to 'sing in and help us', sign_in_path
    end
  end

end
