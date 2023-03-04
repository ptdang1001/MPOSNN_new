import pandas as pd
from sys import argv
import numpy as np
import sys


data_dir ="/N/slate/pdang/myProjectsDataRes/20211201FLUXOptimization/data/"
file_name = argv[1]

data= pd.read_csv(data_dir+file_name, index_col=0)
n_genes,n_samples=data.shape
print("n_genes:{0}, n_samples:{1}".format(n_genes,n_samples))
n_col_non0 = (data!=0).astype(int).sum(axis=0)

if n_samples>3000 and n_samples<5000:
    idx = np.argsort(n_col_non0)[::-3000]
    print(idx)
    sys.exit(1)
    data_1 = data.iloc[:,idx].copy()
    data_1.to_csv(data_dir+file_name.split('.')[0]+"_samples3k.csv.gz",compression='gzip',index=True, header=True)


if n_samples > 5000:
    idx = np.argsort(n_col_non0)[::-5000]
    data_2 = data.iloc[:,idx].copy()
    data_2.to_csv(data_dir+file_name.split('.')[0]+"_samples5k.csv.gz",compression='gzip',index=True, header=True)





