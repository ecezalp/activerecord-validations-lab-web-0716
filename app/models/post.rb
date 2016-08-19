class Post < ActiveRecord::Base

  validates :title, presence: true
  validates :content, length: {minimum: 10}
  validates :summary, length: {maximum: 100}
  validates :category, inclusion: { in: %w(Fiction fiction Nonfiction nonfiction)}
  validate :clickbait_validate

 private

 def clickbait_validate

  if title
    if !self.title.downcase.include?((("won't believe" || "secret") || "top /top[0-9]*/") || "guess")
      errors.add(:title, "m8, clickb8!")
    end
  end
 end

end

