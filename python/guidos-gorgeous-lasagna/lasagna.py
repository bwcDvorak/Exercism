"""Functions used in preparing Guido's gorgeous lasagna.

Learn about Guido, the creator of the Python language: https://en.wikipedia.org/wiki/Guido_van_Rossum
"""

EXPECTED_BAKE_TIME = 40
PREPARATION_TIME = 2


def bake_time_remaining(elapsed_bake_time=0):
    """Calculate the bake time remaining.

    :param elapsed_bake_time: int - baking time already elapsed.
    :return: int - remaining bake time derived from 'EXPECTED_BAKE_TIME'.

    Function that takes the actual minutes the lasagna has been in the oven as
    an argument and returns how many minutes the lasagna still needs to bake
    based on the `EXPECTED_BAKE_TIME`.
    """
    return EXPECTED_BAKE_TIME - elapsed_bake_time


def preparation_time_in_minutes(layer_count=0):
    """Calculate the time to construct a layer_count deep lasagna.

    :param layer_count: int - how many layers.
    :return: int - total prep time derived from 'PREPARATION_TIME'.

    Function that takes the number of layers as an argument and returns
    how many minutes needed to construct based on the `EXPECTED_BAKE_TIME`.
    """
    return PREPARATION_TIME * layer_count


def elapsed_time_in_minutes(number_of_layers=0, elapsed_bake_time=0):
    """Calculate the total elapsed time.

    :param number_of_layers: int - how many layers.
    :return: int - sum of prep time and bake time
    """
    return preparation_time_in_minutes(number_of_layers) + elapsed_bake_time
    