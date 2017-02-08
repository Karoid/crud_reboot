```ruby
#app/models/user.rb

class User < ActiveRecord::Base
    has_many :comments
    has_many :posts
    has_many :likes
    has_many :user_groups

    before_save :make_name_capital

    validates :name, presence: true, length: {maximum: 10}
    validates :age , presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 20, less_than: 30}
    validates :mail, presence: true, uniqueness: true ,format: {with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i }

    def make_name_capital
        self.name.capitalize!
    end
end
```
--------------------------------
```ruby
#app/models/group.rb

class Group < ActiveRecord::Base
    has_many :user_groups

    validates :name,presence: true, uniqueness: true, length: {maximum:20}
end
```
--------------------------------
```ruby
#app/models/post.rb

class Post < ActiveRecord::Base
    has_many :comments
    has_many :likes
    belongs_to :user

    before_save :swear_filter

    validates :title,  presence: true, length: {maximum:30,minimum:2}
    validates :content,presence: true
    validates :user_id,presence: true

    def swear_filter
        self.content.gsub!(/(fuck)|(shit)|(hell)/, "****")
    end
end
```

--------------------------------
```ruby
#app/models/comment.rb

class Comment < ActiveRecord::Base
    belongs_to :user
    belongs_to :post

    before_save :swear_filter

    validates :content,presence: true, length: {maximum:200}
    validates :user_id,presence: true
    validates :post_id,presence: true

    def swear_filter
        self.content.gsub!(/(fuck)|(shit)|(hell)/, "****")
    end
end
```
--------------------------------
```ruby
#app/models/like.rb

class Like < ActiveRecord::Base
    belongs_to :user
    belongs_to :post
end
```
