require 'selenium-webdriver'
require 'byebug'

driver = Selenium::WebDriver.for:chrome

driver.get 'https://online.mis.pens.ac.id/'

driver.find_element(:xpath, "//a[@href='index.php?Login=1']").click

driver.find_element(:id, 'username').send_keys 'miftahunajat@it.student.pens.ac.id'

driver.find_element(:id, 'password').send_keys 'Uselesswater1'

driver.find_element(:xpath, "//input[@value='LOGIN']").click()


wait = Selenium::WebDriver::Wait.new(:timeout => 10) # seconds
wait.until { driver.find_element(:xpath, "//a[@href='mSetting.php']").displayed? }

driver.get 'https://online.mis.pens.ac.id/mEntry_Logbook_KP1.php'

wait.until { driver.find_element(:id, 'jam_mulai').displayed? }

driver.find_element(:id, 'jam_mulai').send_keys '09:00'

driver.find_element(:id, 'jam_selesai').send_keys '18:00'

driver.find_element(:id, 'kegiatan').send_keys 'Mengerjakan Documentasi API.'

driver.find_element(:id, 'sesuai_kuliah1').click

drop_down = driver.find_element(:id, 'matakuliah')

Selenium::WebDriver::Support::Select.new(drop_down).select_by(:value, '21937')

driver.find_element(:id, 'Setuju').click unless driver.find_element(:id, 'Setuju').attribute('checked')

driver.find_element(:xpath, "//input[@value='Simpan']").click()

driver.switch_to.alert.accept

wait.until { driver.find_element(:id, 'asda').displayed? }