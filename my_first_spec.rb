require 'rspec'
require 'selenium-webdriver'

describe 'Login page' do
  before(:each) do
      @driver = Selenium::WebDriver.for(:chrome)
      @wait = Selenium::WebDriver::Wait.new(:timeout => 10)
    end

  it 'should enter login' do
    @driver.navigate.to 'http://localhost/litecart/public_html/en/'
    @driver.find_element(:name, 'email').send_keys 'admin'
    @driver.find_element(:name, 'password').send_keys 'admin'
    @driver.find_element(:name, 'login').click
  end

  after(:each) do
      @driver.quit
    end
end