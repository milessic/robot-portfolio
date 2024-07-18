from time import sleep
from robot.api import logger
from robot.api.deco import keyword
from Browser import Browser
from Browser.utils.data_types import SupportedBrowsers, SelectAttribute 
from robot.libraries.BuiltIn import BuiltIn
from enum import Enum

class InputType(Enum):
    r"Enum that determines possible Input Types"
    NUMBER= "Number"
    TELEPHONE = "Telephone (tel)"
    EMAIL = "Email"
    URL = "URL"
    SEARCH = "Search"
    DATETIME = "Datetime (Deprecated)"
    DATETIME_LOCAL = "Datetime-local"
    DATE = "Date"
    TIME = "Time"
    MONTH = "Month"
    WEEK = "Week"
    COLOR = "Color"
    RANGE = "Range"
    PASSWORD = "Password"

class ElementIsNotVisible(Exception):
    def __init__(self, *args):
        args = (f"Provided locator {args[0]} was not visible!",)
        super().__init__(*args)

class Locators:
    input_div = """//ul[@class="input-item-grid"]//li"""
    add_input = ".icon-add"
    input_field = """//ul[@class="input-item-grid"]//li//input[@class="input-item__display-input"]"""
    input_type_select = """//select[@name="inputType"]"""
    input_type_label = """//pre"""

class MyBrowser(Browser):
    r"""MyBrowser is a Browser extension library that can be used in Robotframework
    It is ment to use on https://inputtypes.com/ 
    """
    def __init__(self, 
                 headless:bool = True,
                 browser:SupportedBrowsers = SupportedBrowsers.chromium,
                 take_teardown_screenshot:bool = False
                 ):
        super().__init__()
        self.url = "https://inputtypes.com/"
        self.inputs = [self.get_input_locator(0)]
        self.BuiltIn = BuiltIn()
        self.HEADLESS = headless
        self.BROWSER = browser
        self.take_teardown_screenshot = take_teardown_screenshot

    def __del__(self):
        if self.take_teardown_screenshot:
            self.take_screenshot()

    @keyword
    def change_input_type(self, field_index:int, input_type:InputType):
        t_locator = f"({Locators.input_type_select})[{field_index + 1}]"
        self.select_options_by(t_locator, SelectAttribute.label, input_type.value)
        self.verify_input_type_is(field_index, input_type)

    @keyword
    def verify_input_type_is(self, field_index:int, input_type:InputType):
        locator = f"({Locators.input_type_label})[{field_index + 1}]"
        new_type = self.get_text(locator).removesuffix('">').removeprefix("<input type=\"")
        if not (new_type in input_type.value.lower()):
            raise AssertionError(f"New type was not {input_type.value} but {new_type}!")

    @keyword
    def type_in_input(self, text:str, field_index:int):
        try:
            self.type_text(self.inputs[field_index], text)
        except IndexError:
            raise IndexError(f"IndexError: Input with index {field_index} is not known!")


    @keyword
    def open_input_types_page(self, headless:bool| None=None, browser:SupportedBrowsers | None= None):
        if headless is None:
            headless = self.HEADLESS
        else:
            self.HEADLESS = headless
        if browser is None:
            browser = self.BROWSER
        else:
            self.BROWSER = browser
        self.new_browser(browser=browser, headless=headless)
        self.new_page(self.url)
        self.wait_for_elements_state(Locators.add_input)

    def get_input_locator(self, index):
        return f"({Locators.input_field})[{index + 1}]"

    @keyword
    def add_new_input(self):
        self.click(Locators.add_input)
        self.inputs.append(self.get_input_locator(len(self.inputs)))
        sleep(.3)


    @keyword
    def element_is_visible(self, locator: str) -> None:
        r"""
        | =Arguments= | =Description= |
        | ``locator`` | ``Browser`` compatible locator |

        Raises ElementIsNotVisible if element is not visible, does nothing if it is visibvle.
        """
        if "visible" not in self.get_element_states(locator):
            raise ElementIsNotVisible(locator)

    @keyword
    def click_and_type_text(self, locator: str, text: str):
        r"""
        | =Arguments= | =Description= |
        | ``locator`` | ``Browser`` compatible locator |
        | ``text`` | text to type in given ``locator`` |

        |Clicks in the given element and types text"""
        self.click(locator)
        self.type_text(locator, text)

    @keyword
    def wait_for_any_of_elements(self, *locators, timeout:int = 15) -> str:
        r"""
        | =Arguments= | =Description= |
        | ``*locators`` | ``Browser`` compatible locators |
        | ``timeout``` | maximum timein seconds to search for the option |
        Iterates through the ``locators`` list and returns the one that was found.

        Returns ``TimeoutError`` if none of these were found in time period determined by ``timeout``"""
        iterations = int(timeout * 4)
        sleep_time = timeout / 4
        for i in range(iterations):
            for locator in locators:
                try:
                    self.element_is_visible(locator)
                    return locator
                except ElementIsNotVisible:
                    pass
            sleep(sleep_time)
        logger.info(f"Searched locators: {locators}")
        raise TimeoutError(f"TimeoutError: Could not find any of provided locators within {timeout} seconds! List of the searched locators in the logs")

    @keyword
    def verify_field_text_is(self, text: str, field_index:int):
        locator = self.get_input_locator(field_index)
        actual_text = self.get_text(locator)
        if actual_text != text:
            raise ValueError(f"Text was '{actual_text}' not '{text}'")



