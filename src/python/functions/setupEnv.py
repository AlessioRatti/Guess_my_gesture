# -*- coding: utf-8 -*-
"""
Created on Tue Dec 10 15:19:19 2019

@author: aless
"""

import os


class Paths:
    # def gen_paths():  # define all the useful paths as strings
    def __init__(self):
        # global parentpath
        self.sonpath = os.path.realpath(__file__)
        self.parentpath = os.path.dirname(self.sonpath)
        self.grandppath = os.path.dirname(self.parentpath)
        self.greatgrandppath = os.path.dirname(self.grandppath)


def gen_paths():  # define all the useful paths as a struct Paths.onepath
    return Paths()


def gen_file_paths(path):
    # generate all the files names with the absolute path
    file_paths = []
    for dirpath, subdirs, files in os.walk(path):
        file_paths.extend(os.path.join(dirpath, x) for x in files if x.endswith(".txt"))
    # sorting correctly the goddamn lines
    file_paths.sort()
    return file_paths
