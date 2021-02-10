# -*- coding: utf-8 -*-
"""
Created on Tue Dec 10 15:20:53 2019

@author: aless
"""

import pickle


def savePkl(pkl_data, pkl_path):
    outfile = open(pkl_path, 'wb')
    pickle.dump(pkl_data, outfile)
    outfile.close()
    print('File saved as .pkl in the desired directory!')


def loadPkl(pkl_path):
    infile = open(pkl_path, 'rb')
    pkl_data = pickle.load(infile)
    infile.close()
    print('File .pkl loaded in the current workspace!')
    return pkl_data