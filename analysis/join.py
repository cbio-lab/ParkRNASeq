import numpy as np
import pandas as pd


def cat(path, names):
    df_list = [pd.read_csv(path + name + ".counts", header=None, index_col=0, sep="\t") for name in names]
    print([i.shape for i in df_list])
    data = pd.concat([item.loc[:, 3] for item in df_list], axis=1, keys=names)
    data = data.T
    print(data)
    data.to_csv("samples.counts", sep="\t")
    return data
    

def filter(data):
    """
    data['total'] = data.sum(axis=1)
    data = data.div(data.total, axis=0)
    data['genes'] = data.filter(regex=("ENSG")).sum(axis=1)
    print(data)
    """
    data = data.filter(regex=("ENSG"))
    data = data.loc[:, data.any()]
    print(data)
    data.to_csv("samples_filtered.counts", sep="\t")


meta = pd.read_csv("metadata.tsv", header=0, index_col=None, sep="\t")
#print(meta)
names = meta.ID.values
#print(names)


#data = cat("htseq_out/", names)
data = pd.read_csv("samples.counts", sep="\t", header=0, index_col=0)

filter(data)