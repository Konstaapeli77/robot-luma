import random
import string

__version__ = '1.0.0'


class RandomEmail(object):
    ROBOT_LIBRARY_VERSION = __version__
    ROBOT_LIBRARY_SCOPE = 'GLOBAL'

    def random_email(self):
        letters = string.ascii_lowercase
        result_str = ''.join(random.choice(letters) for i in range(15))
        return  result_str + '@eioikeasahkopostiosoite.org'

    def random_email_prefix(self, link_text):
        index = link_text.find('@')
        if (index == -1):
          return link_text
        return link_text[:index]

    def escaped_at_character(self, link_text):
        index = link_text.find('@')
        return link_text[:index] + '&#64;' + link_text[(index+1):]

    def add_comment_mark(self, commented_str):
        result_str = '\\"' + commented_str + '\\"'
        return result_str