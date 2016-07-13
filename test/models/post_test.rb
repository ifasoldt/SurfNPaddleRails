require 'test_helper'

class PostTest < ActiveSupport::TestCase
  test "post belongs to author" do
    post1 = Post.create
    post1.author = Author.create(name: "Isaiah", picture: "headshot")
    assert post1.author_id = Author.all[0].id
    assert post1.author.name = "Isaiah"
    assert post1.author.picture = "headshot"
  end

  test "author has many posts" do
  author1 = Author.create(name: "Isaiah", picture: "headshot")
  post1 = Post.create
  post2 = Post.create
  post1.author = author1
  post2.author = author1
  assert post1.author_id = Author.all[0].id
  assert post2.author_id = Author.all[0].id
  assert post1.author_id = post2.author_id
  assert post1.author.name = post2.author.name
  assert post1.author.picture = post2.author.picture
  end

  test "new post needs presence of title, body, post_picture" do
    post = Post.new
    refute post.valid?
    assert_equal [:title, :body, :post_picture], post.errors.keys
    assert post.errors.messages[:body].include? "can't be blank"
    assert_equal post.errors.messages[:title], post.errors.messages[:post_picture]
  end

  test "numericality of author_id" do
    post = Post.new(title: "Isaiah", body: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", post_picture: "gaga", author_id: "hello")
    refute post.valid?
    assert_equal ["is not a number"], post.errors.messages[:author_id]
  end

  test "integers only for author_id" do
    post = Post.new(title: "Isaiah", body: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", post_picture: "gaga", author_id: 2.4)
    refute post.valid?
    assert_equal ["must be an integer"], post.errors.messages[:author_id]
  end

  test "body length minimum 100 char" do
    post = Post.new(body: "afsdf")
    assert_equal ["dfs"], post.errors.messages[:body]
  end

  test "title length max 100 char" do
    post = Post.new(title: "asdfas df asdf asd f sdf asd fa sdf asd fa dsfjkasdkfankdsf asd faknsdfnansdfaskf sdk fa dsf s dfnadsfnaksdfkkakls  as df asd f asdf asd fa sdf asd fadsf")
    assert_equal ["dfs"], post.errors.messages[:title]
  end



end
