require 'rails_helper'


# thnink about feature as describe
feature 'Sign up', js: true do
  before(:each) do
    visit new_user_registration_path
  end
  # think about scenario as it
  scenario 'successful signup' do
    password = 'password' # a way to clean up code by setting password as a varialbe
    fill_in('user[email]', with: 'test@test.com')
    fill_in('user[password]', with: password)
    fill_in('user[password_confirmation]', with: password)

    click_button 'Sign up'
    #expect to seee something that we cant see unless we are loged in
    # all respec tests have to have at least one expectation in them
    expect(page.has_content?(
    'Welcome! You have signed up successfully.'
    )).to eq(true)
  end

  scenario 'unsuccessful signup' do
    fill_in('user[email]', with: 'test@test.com')
    fill_in('user[password]', with: 'password')
    fill_in('user[password_confirmation]', with: 'pasword')
    click_button 'Sign up'
    expect(page.has_content?(
    "Password confirmation doesn't match Password"
    )).to eq(true)  end
end

feature 'Sign In' do
  before(:each) do
    visit new_user_session_path
    # todo: should use factory girl for this to clea up record creation
    @user = User.create(email: 'test@test.com', password: 'password')
  end

  scenario 'successful sign in', js: true do

    # fill in the log in form and click login button
    # validate that something is on the page that you cant see unless logged in
    fill_in('user[email]', with: @user.email )
    fill_in('user[password]', with: 'password' )
    click_button 'Log in'
    expect(page.has_content?(
    "Signed in successfully."
    )).to eq(true)
  end

  scenario 'unsuccessful sign in', js: true do
    # fill in the login form typo the password or user
    # expect that an login error happens
  end
end


feature "Logout" do
  scenario 'logout out of app', js: true do
    # note:
    # if you already have a view tests
    # dont wriet  test to do that over and over
    # that is why we are creating a user and logging them in here
    # we just need to test the logout link
    login_user

    # beer edit
    # create user login with him
    # go directly to the edit url of that beer
    # fil in the form to edit
    # expected beer to be edited
    # should already have the other view tests
    # tests just describe the actions that should be happened
    visit root_path
    binding.pry
  end
end
