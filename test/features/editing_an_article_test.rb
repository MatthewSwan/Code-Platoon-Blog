# Editing a post
#   Given that I'm logged in as "Josh Cheek"
#   And I have a post "abc" with a body of "def"
#   When I go to "/posts/470-abc/edit"
#   Then I see a form for the post
#   I edit the title to be "abcd"
#   I edit the body to be "defg"
#   I click submit
#   I am now on "/posts/470-abc"
#   And I see the post's title is "abcd", and its body is "defg"
#
# Not able to edit someone else's posts
#   Given that I'm logged in as "Josh Cheek"
#   and "Matthew Swan" has a post "Eff Josh lol"
#   When I go to "/posts/82-eff-josh-lol"
#   I see that I am not authorized (403)

