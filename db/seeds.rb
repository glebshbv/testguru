# db/seeds.rb
#
Answer.delete_all
Question.delete_all
Test.delete_all
Category.delete_all
User.delete_all

users = User.create!([
  { name: 'Gleb', email: 'gleb@example.com', user_type: 10 },
  { name: 'Dan', email: 'dan@example.com', user_type: 10 },
  { name: 'Peter', email: 'peter@example.com', user_type: 10 }
])
puts "Users created"

author_users = User.create!([
  { name: 'AuthorGleb', email: 'authorgleb@example.com', user_type: 20 },
  { name: 'AuthorDan', email: 'authordan@example.com', user_type: 20 },
])
puts "Authors Created"

categories = Category.create!([
  { title: 'Math' },
  { title: 'Science' },
  { title: 'History' }
])
puts "Categories created"
tests = Test.create!([
  { title: 'Algebra Basics', level: 1, category_id: categories[0].id, author_id: author_users[0].id },
  { title: 'Calculus', level: 2, category_id: categories[0].id, author_id: author_users[1].id },
  { title: 'Physics', level: 3, category_id: categories[1].id, author_id: author_users[0].id },
  { title: 'Chemistry', level: 1, category_id: categories[1].id, author_id: author_users[1].id },
  { title: 'World War II', level: 2, category_id: categories[2].id, author_id: author_users[0].id }
])
puts "Tests created"

users[0].taken_tests << tests[0] << tests[1] << tests[2] << tests[3] << tests[4]
users[1].taken_tests << tests[1] << tests[3]
users[2].taken_tests << tests[0] << tests[2] << tests[4]

puts "Tests Assiciations created"

questions = Question.create!([
  { body: 'What is 2+2?', test_id: tests[0].id },
  { body: 'What is the derivative of x^2?', test_id: tests[1].id },
  { body: 'What is the speed of light?', test_id: tests[2].id },
  { body: 'What is H2O?', test_id: tests[3].id },
  { body: 'When did World War II start?', test_id: tests[4].id }
])
puts "Questions created"

Answer.create!([
  { body: '4', correct: true, question_id: questions[0].id },
  { body: '2x', correct: true, question_id: questions[1].id },
  { body: '299,792,458 m/s', correct: true, question_id: questions[2].id },
  { body: 'Water', correct: true, question_id: questions[3].id },
  { body: '1939', correct: true, question_id: questions[4].id }
])

puts "Answers created!"
puts "All created!!"
