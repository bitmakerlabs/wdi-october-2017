# Adding Tags Through Polymorphism

## Agenda

  1. Polymorphism


## Polymorphism

- A polymorphic association allows a model to belong_to more than one other model
- This comes up fairly frequently
  - e.g. Films and CastMembers should both have Images
  - e.g. Projects and Users should both have Reviews
- This saves us from having to define many similar classes
  - e.g. FilmImages and CastMemberImages are probably pretty much the same thing


```ruby
class ProjectReview
  belongs_to :project

class UserReview
  belongs_to :user
```

REPETITIVE!!!

```
class Review
  belongs_to :reviewable, polymorphic: true
end
```
in our database table:
reviewable_id
reviewable_type: 'Project' or 'User'

```
class Project
  has_many :reviews, as: :reviewable
end

class User
  has_many :reviews, as: :reviewable
end
```
