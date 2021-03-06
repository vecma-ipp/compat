from . import ual_low_level_wrapper as ull
from collections import OrderedDict

class KeepInOrder(object):
	def __new__(cls, *args, **kwargs):
		instance = object.__new__(cls)
		instance.__odict__ = OrderedDict()
		return instance

	def __setattr__(self, key, value):
		if key != '__odict__':
			self.__odict__[key] = value
		object.__setattr__(self, key, value)

	def keys(self):
		return self.__odict__.keys()

	def items(self):
		return self.__odict__.items()


INTERPOLATION   = 3
CLOSEST_SAMPLE  = 1
PREVIOUS_SAMPLE = 2
EMPTY_INT       = -999999999
EMPTY_FLOAT     = -9.0E40
EMPTY_DOUBLE    = -9.0E40
EMPTY_COMPLEX    = complex(EMPTY_DOUBLE, EMPTY_DOUBLE)
# new defines for struct_array management
NON_TIMED       = 0
TIMED           = 1
TIMED_CLEAR     = 2
# printing level defines, can be changed at runtime
PRINT_DEBUG     = 0
VERBOSE_DEBUG   = 0
DEVEL_DEBUG     = 0

def check_status(status):
	if PRINT_DEBUG:
		if status:
			print (ull.euitm_last_errmsg())

def verb():
	return VERBOSE_DEBUG

def dev():
	return DEVEL_DEBUG
