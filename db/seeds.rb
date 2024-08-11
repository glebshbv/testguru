# db/seeds.rb

Result.delete_all
Answer.delete_all
Question.delete_all
Test.delete_all
Category.delete_all
User.delete_all

users = User.create!([
  { name: 'Gleb', email: 'gleb@example.com' },
  { name: 'Dan', email: 'dan@example.com' },
  { name: 'Peter', email: 'peter@example.com' }
])
puts "Users created"

author_users = User.create!([
  { name: 'AuthorGleb', email: 'authorgleb@example.com' },
  { name: 'AuthorDan', email: 'authordan@example.com' },
])
puts "Authors Created"

categories = Category.create!([
  { title: 'Math' },
  { title: 'Science' },
  { title: 'History' }
])
puts "Categories created"

tests = Test.create!([
  { title: 'Algebra Basics', level: 1, category: categories[0], author: author_users[0] },
  { title: 'Calculus', level: 2, category: categories[0], author: author_users[1] },
  { title: 'Physics', level: 3, category: categories[1], author: author_users[0] },
  { title: 'Chemistry', level: 1, category: categories[1], author: author_users[1] },
  { title: 'World War II', level: 2, category: categories[2], author: author_users[0] }
])
puts "Tests created"

questions = Question.create!([
  { body: 'What is 2+2?', test: tests[0] },
  { body: 'What is the derivative of x^2?', test: tests[1] },
  { body: 'What is the speed of light?', test: tests[2] },
  { body: 'What is H2O?', test: tests[3] },
  { body: 'When did World War II start?', test: tests[4] }
])
puts "Questions created"

answers = Answer.create!([
  { body: '4', correct: true, question: questions[0] },
  { body: '2x', correct: true, question: questions[1] },
  { body: '299,792,458 m/s', correct: true, question: questions[2] },
  { body: 'Water', correct: true, question: questions[3] },
  { body: '1939', correct: true, question: questions[4] }
])
puts "Answers created!"

results = Result.create!([
  { user: users[0], test: tests[0] },
  { user: users[1], test: tests[1] },
  { user: users[2], test: tests[2] },
  { user: users[0], test: tests[3] },
  { user: users[0], test: tests[4] },
])
puts "Results created"

puts "All created!!"
