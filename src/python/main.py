# -*- coding: utf-8 -*-
"""
Created on Tue Dec 10 15:15:12 2019

@author: aless
"""

# %% ----------  IMPORTING  ----------
# environment
import time
import sys
# my methods modules
from functions import setupEnv
from functions import dataPrep
from functions import mgmtPkl

# GENERATE ENVIRONMENT VARIABLES
paths = setupEnv.gen_paths()
db_path = paths.greatgrandppath+'\\final_db\\X\\'
labels_path = paths.greatgrandppath+'\\final_db\\Y\\labels.txt'
file_paths = setupEnv.gen_file_paths(db_path)
print('check paths')

# GENERATE THE POSES (X)
start_time = time.time()  # get launch time
pose = dataPrep.gen_poses(file_paths)
print("--- %s seconds ---" % (time.time() - start_time))
print(sys.getsizeof(pose))
print('check stats')

# GENERATE THE LABELS (Y)
labels = dataPrep.gen_labels(labels_path)
print('check labels')

# Create TrainTest as a dictionary of poses and labels (X & Y)
TrainTest = {
    'pose': pose,
    'label': labels
}
print('Dictionary built!')

# Save TrainTest as a compressed file (TrainTest.pkl)
TrainTest_path = paths.greatgrandppath+'\\export\\TrainTest.pkl'
mgmtPkl.savePkl(TrainTest, TrainTest_path)

# %% RE-IMPORT TrainTest.pkl from ~/export/TrainTest.pkl
from functions import setupEnv
from functions import mgmtPkl
paths = setupEnv.gen_paths()
TrainTest_path = paths.greatgrandppath+'\\export\\TrainTest.pkl'
TrainTest = mgmtPkl.loadPkl(TrainTest_path)
