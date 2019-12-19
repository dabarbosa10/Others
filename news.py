import numpy as np 
import pandas as pd
import matplotlib.pyplot as plt
%matplotlib inline

df = pd.read_json('news.json',lines=True)
df.head()
df.ix[100,'short_description']
df.shape
df['category'].unique()
df['authors'].unique()
df['link'].unique()
