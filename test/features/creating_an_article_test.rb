class CreatingAtriclesTest < ActionDispatch::IntegrationTest
# Creating a post
#   Given that I'm logged in as "Matthew"
  def test_i_can_create_a_new_article
    #matthew = User.create! name: 'Matthew Swan' # FIXME: should be logged in
    # lolol = Article.new title: 'lolol', text: "lolol paragraph1 \n\n lolol paragraph2"
    # josh  = User.create! name: 'Josh Cheek',   articles: [lolol]

    # I go to "/" and click "New Post"
    page.visit root_path
    page.click_link('New Post')

    # Now I'm on "/articles/new"
    assert_equal new_article_path, page.current_path

    # I enter a title of "My latest thoughts"
    page.fill_in 'Title', with: 'My latest thoughts'

    # I enter a body of  "Some like it hot, some like it cold, some like it in the pot 9 days old"
    page.fill_in 'Text', with: 'Some like it hot, some like it cold, some like it in the pot 9 days old'

    # I click "Submit"
    page.click_button 'Create Article'

    # I am now on "/posts/124-my-latest-thoughts"
    article = Article.last
    assert_equal article_path(article), page.current_path

    # And I see the title is "My latest thoughts"
    #require "pry"
    #binding.pry
    assert_match /my latest thoughts/i, page.find('.title').text

    # And I see the body is "Some like it hot, some like it cold, some like it in the pot 9 days old"
    assert_match /Some like it hot/i, page.find('.text').text

    # I go to "/" and see that my post is listed at the top of the list of posts
    page.visit root_path
    assert_equal 'My latest thoughts', page.find('.article:first .title').text
    assert_equal 'Some like it hot, so...', page.find('.article:first .summary').text
  end
end

