class ExternalRepositoryReview < ApplicationRecord
  include RailsStateMachine::Model

  validates :identifier, :homepage_url, presence: true
  validates :identifier, uniqueness: true

  scope :default_order, -> { order([created_at: :desc], :id) }
  scope :pending, -> { where(state: 'pending') }

  state_machine do
    state :pending, initial: true
    state :added
    state :rejected

    event :add do
      transitions from: :pending, to: :added

      before_save do
        repository = Repository.new(owner: owner, name: name, user: Power.current.user)

        unless repository.save
          throw(:abort)
        end
      end
    end

    event :reject do
      transitions from: :pending, to: :rejected
    end
  end

  def owner
    identifier.split('/').first
  end

  def name
    identifier.split('/').last
  end

  def project_url
    "https://github.com/#{identifier}"
  end

end
