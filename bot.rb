require 'selenium-webdriver'
require 'byebug'

def start
  @driver = Selenium::WebDriver.for :chrome
  @wait = Selenium::WebDriver::Wait.new(timeout: 10) # seconds

  do_job
end

def find_element_by_id(id)
  @driver.find_element(:id, id)
end

def do_job
  driver = @driver
  wait = @wait

  driver.get 'https://online.mis.pens.ac.id/'

  driver.find_element(:xpath, "//a[@href='index.php?Login=1']").click

  find_element_by_id('username').send_keys 'ennobell17@it.student.pens.ac.id'

  find_element_by_id('password').send_keys 'Cristiano17'

  driver.find_element(:xpath, "//input[@value='LOGIN']").click

  wait.until { driver.find_element(:xpath, "//a[@href='mSetting.php']").displayed? }

  driver.get 'https://online.mis.pens.ac.id/mEntry_Logbook_KP1.php'

  wait.until { driver.find_element(:id, 'jam_mulai').displayed? }

  find_element_by_id('jam_mulai').send_keys '09:00'

  find_element_by_id('jam_selesai').send_keys '18:00'

  find_element_by_id('kegiatan').send_keys 'Sprint Review'

  find_element_by_id('sesuai_kuliah1').click

  drop_down = find_element_by_id('matakuliah')

  Selenium::WebDriver::Support::Select.new(drop_down).select_by(:value, '21937')

  find_element_by_id('Setuju').click

  byebug
  driver.find_element(:xpath, "//input[@value='Simpan']").click

  driver.switch_to.alert.accept

  wait.until { find_element_by_id('asda').displayed? }
end

start
