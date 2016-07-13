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
    post = Post.new(title: "Isaiah", body: "laborum.", post_picture: "gaga")
    refute post.valid?
    assert post.errors.messages[:body].include? "is too short (minimum is 100 characters)"
  end

  test "title length max 100 char" do
    post = Post.new(title: "asdf d sdlfjk a;osdihf;oaisdjfio a'jsdf;adfasdfm asdfasdfasdfasdfasdfasdfasdfasdfasdfsdf sd sdfasdfas asdf asd fa sdfa sd  fd f asdf as dfa  s sa", body: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", post_picture: "gaga")
    refute post.valid?
    puts post.errors.messages
    assert post.errors.messages[:title].include? "is too long (maximum is 100 characters)"
  end



end
