classes/tables:
User: name | has_many :dreams; has_many :themes, through, :dreams
Dream: title, date, user_id | belongs_to :user; has_many :dream_themes; has_many :themes, through: :dream_themes
Theme: name, description | has_many :dream_themes; has_many :dreams, through: :dream_themes; has_many :users, through: users
DreamTheme: dream_id, theme_id | belongs_to :dreams; belongs_to :themes

* BONUS *
1. Scrape dream dictionary for theme data and save to database when a theme is added to the database
2.
