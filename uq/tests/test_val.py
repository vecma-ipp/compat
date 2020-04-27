import os
import numpy as np
import matplotlib.pylab as plt
from pandas import read_csv
from ascii_cpo import read
from scipy.interpolate import interp1d
from mfw.utils.statistics import Split_Normal, Assymetric_Normal
from easyvvuq.comparison.validate import Validate_Similarity

# Experimental data in csv format containing:
# rho_toroidal,Data,Lower,Upper
f = []
f.append(os.path.abspath("exp_data/36266_4000_Te.csv"))
f.append(os.path.abspath("exp_data/36297_4000_Te.csv"))
f.append(os.path.abspath("exp_data/36309_4000_Te.csv"))
f.append(os.path.abspath("exp_data/36440_4000_Te.csv"))

scale = 1000.

# Read and extract experimental data
DF = []
for i in range(4):
    DF.append(read_csv(f[i]))

# Get rho_tor_norm from cpo file
cpo_filename = os.path.abspath("../workflows/AUG_28906_6/ets_coreprof_in.cpo")
corep = read(cpo_filename, "coreprof")
rho = corep.rho_tor_norm
ngrid = len(rho)


# return interpolated [mid, lo, up]
def interp_data(df):
    # get data from exp
    rho_exp = np.array(df["rho_toroidal"])
    mid_exp = np.array(df["Data"])*scale
    lo_exp = np.array(df["Lower"])*scale
    up_exp = np.array(df["Upper"])*scale

    # Interpolate experimental data
    mid = interp1d(rho_exp, mid_exp, kind="cubic")
    lo = interp1d(rho_exp, lo_exp, kind="cubic")
    up = interp1d(rho_exp, up_exp, kind="cubic")

    return mid, lo, up

# interpolated stats
def exp_stats():
    mid_all = []
    up_all = []
    lo_all = []

    # 4 datasets
    for j in range(4):
        # exclude the eadge
        m = []
        l = []
        u = []
        mid, lo, up = interp_data(DF[j])
        for i in range(ngrid-1):
            m.append(mid(rho[i]))
            l.append(lo(rho[i]))
            u.append(up(rho[i]))

        mid_all.append(m)
        lo_all.append(l)
        up_all.append(u)

    return mid_all, lo_all, up_all

# buid PDF
def exp_dist(mid, lo, up):
    p = [[], [], [], []]
    c = [[], [], [], []]
    for i in range(ngrid-1):
        for j in range(4):
            mj = mid[j][i]
            lj = lo[j][i]
            uj = up[j][i]
            dj = Assymetric_Normal(mu=mj, sig1=mj-lj, sig2=uj-mj)
            xj = np.linspace(mj-4*(mj-lj), mj+4*(uj-mj), 500)
            p[j].append(dj.pdf(xj))
            c[j].append(4*(uj-lj)*dj.cdf(xj))

    return p, c

mid, lo, up = exp_stats()
p, c = exp_dist(mid, lo, up)

v1 = Validate_Similarity()
v2 = Validate_Similarity("W2")


#d = []
#for i in range(4):
#    for j in range(i, 4):
#        if i != j:
#            d.append(v.compare(p[i], p[j]))

ex = ["Experimental data", "36297", "36309", "36440", "Simulation data"]

def plot_dd(p, m, l, u, i, j):

    d = v1.compare(p[i], p[j])

    x = rho[:-1]
    plt.switch_backend('agg')
    fig = plt.figure(figsize=(16,9))
    ax1 = fig.add_subplot(111)
    ax1.plot(x, m[i], 'g-')
    ax1.plot(x, u[i], 'g-', alpha=0.2)
    ax1.plot(x, l[i], 'g-', alpha=0.2)
    ax1.fill_between(x, l[i], u[i], color="g", alpha=0.18, label=ex[i])

    ax1.plot(x, m[j], 'b-')
    ax1.plot(x, u[j], 'b-', alpha=0.2)
    ax1.plot(x, l[j], 'b-', alpha=0.2)
    ax1.fill_between(x, l[j], u[j], color="b", alpha=0.15, label=ex[j])

    ax1.set_xlabel(r"normalized $\rho_{tor }$", fontsize=18)
    ax1.set_ylabel("Te [eV]", fontsize=15)
    ax1.grid()
    ax1.legend(fontsize=18)

    ax2 = ax1.twinx()
    ax2.plot(x, d, 'r-', alpha=0.5)
    ax2.set_ylim([0., 1.])
    ax2.set_ylabel('JSD distance',fontsize=18, color='r')
    ax2.tick_params('y', colors='r')

    fig.savefig("exp_dist"+str(i)+str(j)+".png")
    plt.close(fig)

def plot_dd1(p, c, m, l, u, i, j):
    d1 = v1.compare(p[i], p[j])
    d2 = v2.compare(c[i], c[j])
    x = rho[:-1]
#    dn = []
#    for k in range(len(d)):
#            s = np.sqrt((l[i][k]+u[i][k])**2+(l[j][k]+u[j][k])**2)
#            diff = abs(m[i][k]-m[j][k])/s
#            dn.append(2*np.sqrt(2)* d[k]*diff)

    fig, axs = plt.subplots(2, 1, figsize=(16,9))

    axs[0].plot(x, m[i], 'b-')
    axs[0].plot(x, u[i], 'b-', alpha=0.2)
    axs[0].plot(x, l[i], 'b-', alpha=0.2)
    axs[0].fill_between(x, l[i], u[i], color="b", alpha=0.18, label=ex[i])

    axs[0].plot(x, m[j], 'C1-')
    axs[0].plot(x, u[j], 'C1-', alpha=0.2)
    axs[0].plot(x, l[j], 'C1-', alpha=0.2)
    axs[0].fill_between(x, l[j], u[j], color="C1", alpha=0.18, label=ex[j])

    #axs[0].set_xlabel(r"$\rho_{tor}$")
    axs[0].set_ylabel("Te [eV]", fontsize=18)
    axs[0].grid()
    axs[0].legend()

    axs[1].plot(x, d1, 'g-', label="JSD")
    #axs[1].plot(x, d2, 'g-', label="Wasserstein")

    axs[1].tick_params('y', colors='g')
    axs[1].set_ylabel("JDS distance", fontsize=16)
    axs[1].set_xlabel(r"normalized $\rho_{tor}$", fontsize=16)
    axs[1].legend()
    axs[1].grid()

    ax2 = axs[1].twinx()
    ax2.plot(x, d2, 'r-', label="Wasserstein-1")
    ax2.tick_params('y', colors='r')
    ax2.set_ylabel("W1 distance", fontsize=16)
    ax2.legend()

    fig.savefig("exp_dist"+str(i)+str(j)+".png")
    plt.close(fig)

#plot_dd(p, mid, lo, up, i=0, j=1)
#plot_dd(p, mid, lo, up, i=0, j=2)
#plot_dd(p, mid, lo, up, i=0, j=3)
#plot_dd(p, mid, lo, up, i=1, j=2)
#plot_dd(p, mid, lo, up, i=1, j=3)
#plot_dd(p, mid, lo, up, i=2, j=3)
