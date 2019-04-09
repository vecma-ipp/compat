import matplotlib.pylab as plt

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

# Statistical Moments
def plot_stats(x, stat, pctl, title, savefig=False):
    mean = stat["mean"]
    var  = stat["var"]
    p10 = pctl['p10']
    p90 = pctl['p90']

    fig = plt.figure(figsize=(12,9))

    ax1 = fig1.add_subplot(111)
    ax1.plot(x, mean, 'g-', alpha=0.75, label='Mean')
    ax1.plot(x, p10, 'b-', alpha=0.25)
    ax1.plot(x, p90, 'b-', alpha=0.25)
    ax1.fill_between(x, p10, p90, alpha=0.25, label= r'$90%$ prediction interval')
    ax1.set_xlabel(r'$\rho_{tor} \quad [m]$')
    ax1.set_ylabel('Mean', color='b')
    ax1.tick_params('y', colors='b')
    ax1.grid()
    ax1.legend()

    ax2 = ax1.twinx()
    ax2.plot(x, var, 'r-', alpha=0.5)
    ax2.set_ylabel('Variance', color='r')
    ax2.tick_params('y', colors='r')
    ax2 = format_exponent(ax2, axis='y')

    plt.title(title)

    if savefig:
        fig.savefig(title+'.png')
    else:
        plt.show()

# Sobols indicies
#if __sobols:
#    s1i  = [sobols['q'][pname].to_numpy() for pname in params]
#    fig2 = plt.figure(figsize=(12,9))
#    ax21 = fig2.add_subplot(111)
#    for i in range(n_params):
#        ax21.plot(rho, s1i[i], label=params[i])
#    ax21.set_xlabel(r'$\rho_{tor} \quad [m]$')
#    ax21.set_ylabel('Sobol indices')
#    ax21.legend()
#    ax21.grid()
#    plt.title('First order Sobol indices')
#
## Correlation matrix
#if __corr:
#    fig3 = plt.figure()
#    ax3  = fig3.add_subplot(111)
#    ax3.imshow(corr, cmap=plt.cm.jet)
#    ax3.colorbar()
#    ax3.title('Corrolation matrix)')

#def plot_dist(i, rho):
#    m = mean[i]
#    sd = std[i]
#    r=rho[i]
#    p0_samples = np.linspace(m-3*std, m+3*std, 200)
#    plt.plot(p0_samples, distp[i].pdf(p0_samples), 'b-')
#    plt.axvline(x=m, color= 'r', linestyle='-')
#    plt.axvline(x=m-sd, color= 'r', linestyle='--')
#    plt.axvline(x=m+sd, color= 'r', linestyle='--')
#    #plt.axvline(x=m+3*sd, color= 'g', linestyle='--')
#    #plt.axvline(x=m-3*sd, color= 'g', linestyle='--')
#    plt.title(r'Output distribution: pressure in $\rho = $'+str(r))
#    plt.xlabel('p')
#    plt.ylabel('p_dist')
#    plt.grid()
#    plt.show()
