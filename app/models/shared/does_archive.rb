module DoesArchive

  as_trait do
    scope :active, -> { where(archived_at: nil) }

    def archive
      update(archived_at: Time.now)
    end

    def archive!
      update!(archived_at: Time.now)
    end

    def archived?
      archived_at.present?
    end

    def restore
      update(archived_at: nil)
    end

    def restore!
      update!(archived_at: nil)
    end

    def active?
      archived_at.blank?
    end
  end

end
