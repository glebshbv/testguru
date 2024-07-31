# db/seeds.rb
#
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

categories = Category.create!([
  { title: 'Math' },
  { title: 'Science' },
  { title: 'History' }
])

tests = Test.create!([
  { title: 'Algebra Basics', level: 1, category_id: categories[0].id, author_id: users[0].id },
  { title: 'Calculus', level: 2, category_id: categories[0].id, author_id: users[1].id },
  { title: 'Physics', level: 3, category_id: categories[1].id, author_id: users[2].id },
  { title: 'Chemistry', level: 1, category_id: categories[1].id, author_id: users[0].id },
  { title: 'World War II', level: 2, category_id: categories[2].id, author_id: users[1].id }
])

questions = Question.create!([
  { body: 'What is 2+2?', test_id: tests[0].id },
  { body: 'What is the derivative of x^2?', test_id: tests[1].id },
  { body: 'What is the speed of light?', test_id: tests[2].id },
  { body: 'What is H2O?', test_id: tests[3].id },
  { body: 'When did World War II start?', test_id: tests[4].id }
])

Answer.create!([
  { body: '4', correct: true, question_id: questions[0].id },
  { body: '2x', correct: true, question_id: questions[1].id },
  { body: '299,792,458 m/s', correct: true, question_id: questions[2].id },
  { body: 'Water', correct: true, question_id: questions[3].id },
  { body: '1939', correct: true, question_id: questions[4].id }
])
