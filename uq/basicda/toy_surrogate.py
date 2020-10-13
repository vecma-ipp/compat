import pandas as pd
import numpy as np
import math
import matplotlib.pylab as plt
#import datetime
import time

from sklearn.gaussian_process import GaussianProcessRegressor
from sklearn.gaussian_process.kernels import DotProduct, WhiteKernel, Matern, RBF, WhiteKernel, ConstantKernel
from sklearn.neural_network import MLPRegressor

from da_utils import *

import sys
import os

#TODO: make a new package + install / or get relative paths consistent
sys.path.append(os.path.abspath("../../standalone/src/custom_codes/gem0"))
import importlib.util
spec = importlib.util.spec_from_file_location("gem0_singleton", os.path.abspath("../../standalone/src/custom_codes/gem0/gem0_singleton.py"))
gem0_singleton = importlib.util.module_from_spec(spec)
spec.loader.exec_module(gem0_singleton)
from gem0_singleton import GEM0Singleton

def get_new_sample(x, utility):
    return x[utility.argmax()]

def get_new_candidates(x, utility): # TODO: get an array of candidates, for each "variance anti-node"
    cands = []
    nodes_inds = utility < 1e-6
    for i in range(len(nodes_inds)-1):
        cands.append(utility[nodes_inds[i], nodes_inds[i+1]].argmax())
    return cands

def stop_train_criterium_rsd(y_pred, sigma, eps=0.005):
    rsd_min = (sigma/abs(y_pred)).min()
    print('rsd : {}'.format(rsd_min))
    return rsd_min < eps

def stop_train_criterium_rmse(y_pred, y, eps=0.05): # TODO: get the reasonable rmse threshold for each given case
    rmse = np.sqrt(((y - y_pred) ** 2).sum() / len(y))
    print('rmse : {}'.format(rmse))
    return rmse < eps, rmse

def GPR_analysis_toy(x_data, x_domain, y_par=[0.1, 9.9, 20], x_par=[0, 10, 64], f=lambda x: x*np.sin(x), eps=1.0, scale=1e7):

    # case: with noise - NO
    #X = np.atleast_2d(np.linspace(y_par[0], y_par[1], y_par[2])).T

    x_observ = np.atleast_2d(x_data[:, 0]).T
    y_observ = f(x_observ).ravel() #TODO reuse the old function evaluations

    y_observ = y_observ/scale #scale naive-est

    # add noise - NO
    # dy = 0.5 + eps * np.random.random(y.shape)
    #noise = np.random.normal(0, dy)
    #y += noise

    # GP model - kernels
    # TODO: compose a suitable kernel/ methods to defince kernel
    #kernel = ConstantKernel(1.0, (1e-3, 1e3)) * RBF(10, (1e-2, 1e2))
    kernel = ConstantKernel() + Matern() # + WhiteKernel(1.0)
    #kernel = ConstantKernel(1e7, (1e-8, 1e+10)) + Matern(length_scale=1e1, length_scale_bounds=(1e-8, 1e+10)) # for GEM in Te/Ti unscaled

    #gp = GaussianProcessRegressor(kernel=kernel, alpha=dy**2, n_restarts_optimizer=9)
    gp = GaussianProcessRegressor(kernel=kernel, n_restarts_optimizer=9) # no noise

    start_ts = time.time()
    gp.fit(x_observ, y_observ)
    print("time to train GP model: " + str(time.time() - start_ts) + " seconds")

    # predictions + MSE
    y_pred, sigma = gp.predict(x_domain, return_std=True)

    y_observ = y_observ*scale  #scale naive-est
    y_pred = y_pred*scale
    sigma = sigma*scale

    #print(sigma)
    return x_observ, y_observ, y_pred, sigma

def GPR_analysis_2d(x_data, x_domain, x_par=[[0.,1.,8],[0.,1.,8]], f=exponential_model, scale=1.):

    x_observ = x_data
    #y = np.array([f(coord, [1.0, 1.0, 1.0]) for coord in X]).reshape(-1,1)

    #print(x_observ)
    #print(x_observ.shape)

    y_observ = f(x_observ)
    y_observ = y_observ / scale

    x1 = np.linspace(*x_par[0])
    x2 = np.linspace(*x_par[1])
    x = np.transpose([np.tile(x1, len(x2)), np.repeat(x1, len(x2))])

    #kernel = ConstantKernel() + Matern + WhiteKernel(1e-4) # TODO white kernel has issues with singularities? e.g. gets log(0)?
    kernel = ConstantKernel() + Matern()
    gp = GaussianProcessRegressor(kernel=kernel, n_restarts_optimizer=9)

    #print(x_observ)
    #print(y_observ)

    start_ts = time.time()
    gp.fit(x_observ, y_observ)
    print("time to train GP model: " + str(time.time() - start_ts) + " seconds")

    y_pred, sigma = gp.predict(x, return_std=True) 

    #plot_prediction_variance(X, y, x, y_pred, sigma, func)

    return x_observ, y_observ * scale, y_pred * scale, sigma * scale

def GPR_analysis(dim=2, func=exponential_model): #TODO arbitrary dimension, print resuluts in a clear way
    xdomain_par =[ 0., 1., 8]**dim # TODO move into initalisation list
    xdata = np.linspace(xdomain_par) # TODO move inot initialisation list

    X = xdata
    y = np.array([func(coord, xdomain_par) for coord in X]).reshape(-1,1)

    #x0 = np.linspace(domain_par[0], domain_par[1], domain_par[2])
    #x1 = np.linspace(domain_par[3], domain_par[4], domain_par[5])
    #x = np.transpose([np.tile(x0, len(x1)), np.repeat(x0, len(x1))])

    kernel = C() + Matern() + WhiteKernel()
    gp = GaussianProcessRegressor(kernel=kernel, n_restarts_optimizer=9)

    start_ts = time.time()
    gp.fit(X, y)
    print("time to train GP model: " + str(time.time() - start_ts) + " seconds")

    y_pred, sigma = gp.predict(x, return_std=True) 

    return y_pred, sigma

def FFNN_Regression_toy(y=0, f=0, n=20, eps=1.0):

    # function to fit
    if f==0:
        f = lambda x:  x * np.sin(x)

    # case: noise
    if y==0:
        X = np.atleast_2d(np.linspace(0.1, 9.9, n)).T
        y = f(X).ravel()
        dy = 0.5 + eps * np.random.random(y.shape)
        noise = np.random.normal(0, dy)
        y += noise

    # input space mesh, the prediction and
    x = np.atleast_2d(np.linspace(0, 10, 1000)).T


    # Analysis: network set-up, training, exploitation
    ffnr = MLPRegressor(random_state=1, max_iter=500)
    ffnr.fit(X, y)
    y_pred = ffnr.predict(x)

    # Plot function,prediction and 95% confidence interval
    plt.figure()
    plt.plot(x, f(x), 'r:', label=r'$f(x) = x\,\sin(x)$')
    plt.errorbar(X.ravel(), y, dy, fmt='r.', markersize=10, label='Observations')
    plt.plot(x, y_pred, 'b-', label='Prediction')
    # plt.fill(np.concatenate([x, x[::-1]]),
    #         np.concatenate([y_pred - 1.9600 * sigma,
    #                         (y_pred + 1.9600 * sigma)[::-1]]),
    #         alpha=.5, fc='b', ec='None', label='95% confidence interval')
    plt.xlabel('$x$')
    plt.ylabel('$f(x)$')
    plt.ylim(-10, 20)
    plt.legend(loc='upper left')
    plt.show(block=True)

def surrogate_loop(pardim):
    np.random.seed(int(time.time()))
    errors = []

    gem0obj = GEM0Singleton()

    def gem0_call_teflteval_array(x):
        res = []
        for el in x: 
            res.append([gem0obj.gem0_call({'te.value': el[0]})[0]])
        return np.array(res)

    def gem0_call_teflteval_log_array(x):
        res = []
        for el in x: 
            res.append([math.log(gem0obj.gem0_call({'te.value': el[0]})[0])])
        return np.array(res)

    def gem0_call_tefltevltegrad_array(x):
        """
        calls the gem0 code for desired te.valus and te.ddrho
        :param x: x[0] is desired tevalue, x[1] is desired tegrad
        """
        res = []
        for el in x:
            res.append(gem0obj.gem0_call({'te.value': el[0], 'te.ddrho': el[1]})[0])
        return res

    def gem0_call_tefltevltivl_array(x):
        """
        calls the gem0 code for desired te.valus and te.ddrho
        :param x: x[0] is desired tevalue, x[1] is desired tegrad
        """
        res = []
        for el in x:
            res.append(gem0obj.gem0_call({'te.value': el[0], 'ti.value': el[1]})[0])
        return res

    new_points = []
    n_init = 1

    if pardim == 1:
        #function = lambda x: x * np.cos(1.0 * x)
        #function = lambda x: (np.e**(-1.0 * x)) * np.cos(2.0 * np.pi * x)
        #function = lambda x: np.e**(+1.0*x)
        #x_param = [0., 1.5, 32] for cos 
        function = lambda x: gem0_call_teflteval_array(x)

        #x_param = [-1000., -4000, 16] # for gem in te-grad
        x_param = [400., 2000, 32] # for gem in te-val #TODO change the gradient sampling!
        x_data = np.zeros((n_init, 2))

        x_domain = np.atleast_2d(np.linspace(*x_param)).T
        y_test = function(x_domain) # TODO: some of the things e.g. x_domain are never changed - should be returned all the time
        
        y_scaling = lambda y: (y - y_test.min()) / (y.max() - y.min())
        x_scaling = lambda x: (x - x_domain.min()) / (x_domain.max() - x_domain.min())
        simple_whitening = lambda y: y_test.min() + (x - x.min())*(y.max() - y.min())/(x.max() - x.min()) # TODO check if intependent calls are comiled out

        # data[:, 0] = np.linspace(*x_param[:-1], n_init)
        x_data[:, 0] = np.random.rand(n_init)*(x_param[1] - x_param[0]) + x_param[0] #TODO either choose among grid points or make grid irregular

        for i in range(15):
            x_observ, y_observ, y_pred, sigma = GPR_analysis_toy(x_data, x_domain, y_par=x_param, x_par=x_param, f=function, eps=0.0)
            x_n = get_new_sample(x_domain, sigma)
            plot_prediction_variance(x_observ, y_observ, x_domain, y_test, y_pred, sigma, function, [x_n], new_points, funcname='gem0, flTe in Te')

            stop_crit, err = stop_train_criterium_rmse(y_pred, y_test.T.reshape(-1), 1e6) # for normalized problems chooes rmse threshold ~0.05
            errors.append(err)

            new_points = [x_n]
            x_data = np.concatenate((x_data, np.array([[x_n[0], 0.0]])), axis=0) #TODO adapt grid around new candidates
            #data = np.append(data, x_n.reshape(1,-1), axis=0)
            if stop_crit:
                print("Reached stopping criterium!")
                break

    elif pardim == 2:
        #function = lambda x: (np.e**(-1. * x[:,0] - 1. * x[:,1])) * np.cos(np.pi * (x[:,0]*x[:,0] + x[:,1]*x[:,1]))  
        #x_param = [[0., 1.5, 16], [0., 1.5, 16]]]
        #y_scale = 1.

        #function = lambda x: np.array(gem0_call_tefltevltivl_array(x)) # TODO double check numpy dimensions
        function = lambda x: np.array(gem0_call_tefltevltegrad_array(x))
        x_param = [[400., 2000, 16], [-1500., 4500., 16]] # sqaure in domain in {Te}x{gradTe}
        y_scale = 1e7

        x1 = np.linspace(*x_param[0])
        x2 = np.linspace(*x_param[1])
        #data = np.dstack((X, Y))[0]
        x_domain = np.transpose([np.tile(x1, len(x2)), np.repeat(x2, len(x1))]) #TODO very bulky and ineffective?
        y_test = function(x_domain)

        # chose one of the grid point as initial point at random
        x_data = np.zeros((n_init,2))
        #x_data[0, :] = [np.random.randint(len(x1)), np.random.randint(len(x2))]
        x_data[...] = [[np.random.rand(n_init)*(x_param[0][1] - x_param[0][0]) + x_param[0][0],
                       np.random.rand(n_init)*(x_param[1][1] - x_param[1][0]) + x_param[1][0]]]

        for i in range(24):
            x_observ, y_observ, y_pred, sigma = GPR_analysis_2d(x_data, x_domain, x_par=x_param, f=function, scale=y_scale)
            x_n = get_new_sample(x_domain, sigma)

            stop_crit, err = stop_train_criterium_rmse(y_pred, y_test, 0.05)
            errors.append(err)

            new_points = (x_n, function(np.array([x_n])))
            plot_prediction_variance_2d(x_observ, y_observ, x_domain, y_test, y_pred, sigma, new_points, funcname='dumped cosine')

            x_data = np.append(x_data, x_n.reshape(1, -1), axis=0)
            if stop_crit:
                print("Reached stopping criterium!")
                break
    
    plot_error(errors, 'RMSE')

def surrogate_utility(x_train_data, y_train_data, x_roi_data, original_model):
    utility = []
    kernel = RBF()
    gpr = GaussianProcessRegressor(kernel=kernel, n_restarts_optimizer=4)

    for x in x_roi_data:
        x_new_train_data = x_train_data.append(x)
        y_new_train_data = y_train_data.append(original_model(x))
        gpr = gpr.fit(x_new_train_data, y_new_train_data)
        x_new_test_data = np.delete(x_roi_data, np.argwhere(x_roi_data == x))
        y_new_test_data = np.array([original_model(x) for x in x_new_test_data])
        y_new_pred_data, new_var = gpr.pred(x_new_test_data)
        utility.append(new_var)

    return -utility.sum()

#np.random.seed(2)  # check other random seeds
plt.ion()

### FFNR model and test:
# FNN_Regression_toy()

### surrogate loop:
#surrogate_loop(2)
surrogate_loop(2)