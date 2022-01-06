class Skill < ApplicationRecord
    enum level: {beginner: 0, intermediate: 1, advanced: 2}
    validates :name,
        presence: true,
        uniqueness: true,
        format: {with: /\A[a-z\-]*\z/, message: "'%{value}' must be in kebab-case"}
    scope :strong, -> { where(level: [:intermediate, :advanced]) }
end
