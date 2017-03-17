require 'rspec'
require 'selenium-webdriver'

describe 'Check menu' do
  before(:each) do
      @driver = Selenium::WebDriver.for(:chrome)
      @wait = Selenium::WebDriver::Wait.new(:timeout => 10)
    end

  it 'should click menu items' do
    @driver.navigate.to 'http://localhost/litecart/public_html/admin'
    @driver.find_element(:name, 'username').send_keys 'admin'
    @driver.find_element(:name, 'password').send_keys 'admin'
    @driver.find_element(:name, 'login').click
    @wait.until { @driver.title == 'My Store'}


  menu = @driver.find_element(:id, "box-apps-menu")
  items = @driver.find_elements(:class, "name")
  items.each do |element|
    puts "#{element}"
    element.click
    @wait.until { @driver.find_element(:tag_name, 'h1') } 
    puts "#{items}"
  end

end

  after(:each) do
      @driver.quit
    end
end

