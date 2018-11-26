classes/tables:
User: username, password_digest, email | has_many :dreams; has_many :themes, through, :dreams
Dream: name, date, user_id | belongs_to :user; has_many :dream_themes; has_many :themes, through: :dream_themes
Theme: name, description | has_many :dream_themes; has_many :dreams, through: :dream_themes; has_many :users, through: :dreams
DreamTheme: dream_id, theme_id | belongs_to :dream; belongs_to :theme

1. Create classes and associations
2. Create Migrations
 2.1 Create tables
 2.2 test associations in tux
3. Develop User authentication
4. CRUD routes

o Create Theme index
 o sort alpha and list dream names within each theme
o Flash validations


* BONUS *
1. Scrape dream dictionary for theme data and save to database when a theme is added to the database
2.

* Assessment Notes *
- incorporate if_loggedin helper
- take a closer look at nested conditionals
- nested hash in create dream form, will learn more in rails about handling this
