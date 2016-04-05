class ViewingArticlesTest < ActionDispatch::IntegrationTest
  # Viewing my articles
  #   Given that I already have 2 articles, named "thought1" and "thought2"
  #   I visit "/authors/josh-cheek"
  #   and I see the titles of both articles
  #   underneath each title is the first paragraph of that article with a link "Read More" which takes me to that article page.


  def test_i_can_view_other_peoples_articles
    # Given that "Josh Cheek" has an article named "lolol"
    # and "Matthew Swan" has an article named "wat"
    # And I am not logged in
    lolol = Article.new title: 'lolol', text: "lolol paragraph1 \n\n lolol paragraph2"
    wat   = Article.new title: 'wattt', text: "wat   paragraph1 \n\n wat paragraph2"
    josh  = User.create! name: 'Josh Cheek',   articles: [lolol]
    matt  = User.create! name: 'Matthew Swan', articles: [wat]

    # I go to "/"
    page.visit root_path

    # I see the article "wat" along with the first paragraph and a link to read more
    # The "Read More" link would send me to "/articles/62-wat"
    # I see that it was written by "Matthew Swan" and if I were to click the name, it would send me to "/authors/matthew-swan"
    assert_equal "wattt",           page.find('.article:first .title').text
    assert_equal "wat paragraph1",  page.find('.article:first .summary').text
    assert_equal article_path(wat), page.find('.article:first .read_more')['href']
    author_link = page.find('.article:first .author')
    assert_equal 'Matthew Swan', author_link.text
    assert_equal user_path(matt), author_link['href']

    # I see the article "lolol" along with the first paragraph and a link to read more
    # The "Read More" link would send me to "/articles/7427-lolol"
    # I see that it was written by "Josh Cheek" and if I were to click the name, it would send me to "/authors/josh-cheek"
    assert_equal "lolol",             page.find('.article:nth-child(2) .title').text
    assert_equal "lolol paragraph1",  page.find('.article:nth-child(2) .summary').text
    assert_equal article_path(lolol), page.find('.article:nth-child(2) .read_more')['href']
    author_link = page.find('.article:nth-child(2) .author')
    assert_equal 'Josh Cheek', author_link.text
    assert_equal user_path(josh), author_link['href']
  end
end
