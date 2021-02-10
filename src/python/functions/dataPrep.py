# -*- coding: utf-8 -*-
"""
Created on Tue Dec 10 15:18:54 2019

@author: aless
"""

import pandas as pd

def gen_poses(file_paths):  # read all the files and append them to a single dataframe
    pose_list = []
    for file_path in file_paths:
        df_single = pd.read_csv(file_path, header=None)
        df_single = df_single.dropna(axis=1)
        pose_list.append(df_single)
        print(file_path)
    for i, sample in enumerate(pose_list):
        pose_list[i] = sample.to_numpy()
        # pose_list[i] = np.asarray(pose_list[i], dtype=np.float64)
    return pose_list


def gen_labels(labels_path):
    labels_df = pd.read_csv(labels_path, header=None)
    labels = []
    for gesture in labels_df.values:
        labels.append(str(gesture[0]))
    return labels
