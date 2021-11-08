require "selenium-webdriver"
require "rspec"
require_relative "signup_page.rb"
require_relative "users_page.rb"

timestamp = Time.now.to_i
username = "Sohi #{timestamp}"
email = "email#{timestamp}@test.com"
password = "password"
expected_banner_text = "Welcome to the alpha blog Sohi #{timestamp}"




describe "Blog application" do 
    describe "signup to the blog application" do 
        it "confirm that a ver can successfully signup" do
            # driver = Selenium::WebDriver.for :remote, desired_capabilities: :firefox
            @driver = Selenium::WebDriver.for :firefox
            @driver.navigate.to "https://selenium-blog.herokuapp.com/signup"

            signup = SignupPage.new(@driver)

            signup.enter_username(username)
            signup.enter_email(email)
            signup.enter_password(password) 

            signup.submit_form()

            users = UsersPage.new(@driver)


            banner_text = users.get_banner_text()

            expect(banner_text).to eq(expected_banner_text)
            @driver.quit
        end
    end

end