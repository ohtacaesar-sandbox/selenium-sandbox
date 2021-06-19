from selenium_sandbox import __version__
from selenium import webdriver
from selenium.webdriver.chrome.options import Options


def test_version():
  assert __version__ == '0.1.0'


def test_webdriver():
  options = Options()
  options.add_argument("--headless")
  options.add_argument("--no-sandbox")

  browser = webdriver.Chrome(options=options)
  browser.get("https://yahoo.co.jp")
  browser.save_screenshot("yahoo.png")
