from robot.api.deco import keyword
from robot.libraries.BuiltIn import BuiltIn
from Browser import Browser


class CustomLib:
    def __init__(self):
        self.browser = Browser()
        self.builtin = BuiltIn()

    @keyword
    def setup_test_environment(self):
        self.browser.new_browser()

    @keyword
    def start_test(self, url, viewport):
        self.browser.new_page(url)
        #self.browser.set_viewport_size(viewport)
        self.browser.take_screenshot()

    @keyword
    def end_test(self):
        self.browser.close_page()

    @keyword
    def wait_for_robot(self):
        self.browser.wait_for_elements_state(selector='//h2[@id="introduction"]')

    def my_fail(self):
        if not True:
            raise AssertionError("Test for error")