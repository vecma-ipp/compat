import matplotlib.pylab as plt
import numpy as np


# Scaling coordianates
def format_exponent(ax, axis='y'):
    # Change the ticklabel format to scientific format
    ax.ticklabel_format(axis=axis, style='sci', scilimits=(-2, 2))

    # Get the appropriate axis
    if axis == 'y':
        ax_axis = ax.yaxis
        x_pos = 0.0
        y_pos = 1.0
        horizontalalignment='left'
        verticalalignment='bottom'
    else:
        ax_axis = ax.xaxis
        x_pos = 1.0
        y_pos = -0.05
        horizontalalignment='right'
        verticalalignment='top'


# Statistical Moments (+- deviation)
def plot_stats(x, stat, xlabel, ylabel, ftitle, fname):
    mean = np.array(stat["mean"])
    var  = stat["var"]
    std = np.array(stat['std'])

    plt.switch_backend('agg')
    fig = plt.figure(figsize=(12,9))

    ax1 = fig.add_subplot(111)
    ax1.plot(x, mean, 'g-', alpha=0.75, label='Mean')
    ax1.plot(x, mean-std, 'b-', alpha=0.25)
    ax1.plot(x, mean+std, 'b-', alpha=0.25)
    ax1.fill_between(x, mean-std, mean+std, alpha=0.25, label=r'Mean $\pm$ deviation')
    ax1.set_xlabel(xlabel)
    ax1.set_ylabel(ylabel, color='b')
    ax1.tick_params('y', colors='b')
    ax1.grid()
    ax1.legend()

    ax2 = ax1.twinx()
    ax2.plot(x, var, 'r-', alpha=0.5)
    ax2.set_ylabel('Variance', color='r')
    ax2.tick_params('y', colors='r')
    ax2 = format_exponent(ax2, axis='y')

    plt.title(ftitle)
    fig.savefig(fname)
    plt.close(fig)


# Statistical Moments (90% percentils)
def plot_stats_pctl(x, stat, pctl, xlabel, ylabel, ftitle, fname):
    mean = stat["mean"]
    var  = stat["var"]
    p10 = pctl['p10']
    p90 = pctl['p90']

    plt.switch_backend('agg')
    fig = plt.figure(figsize=(12,9))

    ax1 = fig.add_subplot(111)
    ax1.plot(x, mean, 'g-', alpha=0.75, label='Mean')
    ax1.plot(x, p10, 'b-', alpha=0.25)
    ax1.plot(x, p90, 'b-', alpha=0.25)
    ax1.fill_between(x, p10, p90, alpha=0.25, label='90% prediction interval')
    ax1.set_xlabel(xlabel)
    ax1.set_ylabel(ylabel, color='b')
    ax1.tick_params('y', colors='b')
    ax1.grid()
    ax1.legend()

    ax2 = ax1.twinx()
    ax2.plot(x, var, 'r-', alpha=0.5)
    ax2.set_ylabel('Variance', color='r')
    ax2.tick_params('y', colors='r')
    ax2 = format_exponent(ax2, axis='y')

    plt.title(ftitle)
    fig.savefig(fname)
    plt.close(fig)


def plot_sobols(x, sobols, params, ftitle, fname):
    plt.switch_backend('agg')
    npar = len(params)

    plt.switch_backend('agg')
    fig = plt.figure(figsize=(12,9))
    ax = fig.add_subplot(111)

    for i in range(npar):
        s = sobols[params[i]]
        ax.plot(x, s, label=params[i])

    ax.set_xlabel(r'$\rho_{tor} ~ [m]$')
    ax.set_ylabel(r'$1^{st} ~ Sobol$')

    ax.set_title(ftitle)
    plt.legend()
    fig.savefig(fname)
    plt.close(fig)


def plot_sobols_3(x, sobols, params, ftitle, fname):
    plt.switch_backend('agg')

    s1 = sobols[params[0]]
    s2 = sobols[params[1]]
    s3 = sobols[params[2]]

    plt.switch_backend('agg')
    fig = plt.figure(figsize=(12,9))

    ax = fig.add_subplot(111)

    ax.plot(x, s1, label='WTOT')
    ax.plot(x, s2, label=r'RHEAT ($\mu$)')
    ax.plot(x, s3, label=r'FWHEAT ($\sigma$)')
    ax.set_xlabel(r'$\rho_{tor} ~ [m]$')
    ax.set_ylabel(r'$1^{st} ~ Sobol$')

    ax.set_title(ftitle)
    plt.legend()
    fig.savefig(fname)
    plt.close(fig)


def plot_sobols_4(x, sobols, params, typ):
    plt.switch_backend('agg')

    s1 = sobols[params[0]]
    s2 = sobols[params[1]]
    s3 = sobols[params[2]]
    s4 = sobols[params[3]]

    fig, axs = plt.subplots(nrows=2, ncols=2, sharex=True)

    ax = axs[0,0]
    ax.plot(x, s1)
    ax.set_title('D1')

    #ax.locator_params(nbins=4)
    ax = axs[0,1]
    ax.plot(x, s2)
    ax.set_title('D2')

    ax = axs[1,0]
    ax.plot(x, s3)
    ax.set_title('D3')

    ax = axs[1,1]
    ax.plot(x, s4)
    ax.set_title('D4')

    fig.suptitle(typ+' - First-Order Sobol indices')
    fig.savefig(typ+'sobols.png')
    plt.close(fig)


# QoI distribution, in the index grid i
def plot_dist(dist, stat):
    plt.switch_backend('agg')
    m = np.array(stat["mean"])
    sd = np.array(stat['std'])

    fig, axs = plt.subplots(nrows=2, ncols=2, sharex=True, figsize=(12,9))

    #fig = plt.figure(figsize=(12,9))
    #ax1 = fig.add_subplot(111)
    j = 0
    for i in range(4):
        s = np.linspace(m[j]-3*sd[j], m[j]+3*sd[j], 100)
        d = dist[j].pdf(s)

        ax = axs[i//2, i%2]
        ax.plot(s, d, 'b-')
        ax.axvline(x=m[j], color= 'C1', linestyle='-')
        ax.axvline(x=m[j]-sd[j], color= 'C1', linestyle='--')
        ax.axvline(x=m[j]+sd[j], color= 'C1', linestyle='--')
        ax.set_title(r'dist in: $C_'+str(j)+'$')
        ax.grid()
        j = i+2

    fig.suptitle('Output distiburions')
    fig.savefig('dist_out.png')
    plt.close(fig)

#def plot_dist01(dist, stat):
#    plt.switch_backend('agg')
#    m = np.array(stat["mean"])
#    sd = np.array(stat['std'])
#
#    fig = plt.figure(figsize=(12,9))
#    ax = fig.add_subplot(111)
#
#    s0 = np.linspace(m[0]-3*sd[0], m[0]+3*sd[0], 100)
#    d0 = dist[0].pdf(s0)
#    ax.plot(s0, d0, label=r'$C_0$')
#
#    s1 = np.linspace(m[1]-3*sd[1], m[1]+3*sd[1], 100)
#    d1 = dist[1].pdf(s1)
#    ax.plot(s1, d1, label=r'$C_1$')
#
#    ax.set_title(r'dist in: $C_0$ and $C_1$')
#    ax.grid()
#
#    ax.legend()
#
#    fig.savefig('dist_out01.png')
#    plt.close(fig)
