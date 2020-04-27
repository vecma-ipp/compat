import logging
import numpy as np
import chaospy as cp


def get_dist(name, value, err):
    """
    Return distribition:
     - Moments: mean = value, sdt = err*value.
     - Type: given by 'name' (supported: Normal and Uniform).
     - Dimension: univariate if value is scalar, multivariate if value is a list.

    Parameters
    ----------
    name : str
        The distribution name
    value : float, int or list
        The mean value(s) of the dist.
    err  : float
        The error marging, % of the mean that gives the sdtv.
        if name is Uniform, err must be < 0.57
        if name is Normal,

    Returns
    -------
    chaospy.Dist: the output distribution.
    """

    # TODO add the condition: shift if lower threshlod <= a critical value

    if name.lower() == "normal":
            if type(value) == list:
                d = []
                for v in value:
                    d.append(cp.Normal(v, err*v))
                dist = cp.J(*d)
            else:
                dist = cp.Normal(value, err*value)

    elif name.lower() == "uniform":

        if type(value) == list:
            d = []
            for v in value:
                lo = (1. - np.sqrt(3)*err)*v
                up = (1. + np.sqrt(3)*err)*v
                if v == 0.:
                    up = err

                d.append(cp.Uniform(lo, up))
            dist = cp.J(*d)
        else:
            lo = (1. - np.sqrt(3)*err)*value
            up = (1. + np.sqrt(3)*err)*value
            if value == 0.:
                up = err
            dist = cp.Uniform(lo, up)

    # TODO add other relevant distributions
    else:
        msg = "Unknown distribution name: " + dist_name
        logging.error(msg)
        raise Exception(msg)

    return dist

class Assymetric_Normal():
    """
    The two pieces normal distribution is a result from joining halves of
    two normal distributions with the same mean but two different variances.
    """
    def __init__(self, mu, sig1, sig2):
        self.mu = mu
        self.sig1 = sig1
        self.sig2 = sig2

        self.dist1 = cp.Normal(mu, sig1)
        self.dist2 = cp.Normal(mu, sig2)

    # Probability density function
    def pdf(self, x):

        x = np.asfarray(x)
        x = np.sort(x)

        x1 = x[x<=self.mu]
        y1 = self.dist1.pdf(x1)

        x2 = x[x>self.mu]
        y2 = self.dist2.pdf(x2)

        y = np.concatenate((y1, y2))
        return y

    # Cummulative distribution function
    def cdf(self, x):
        x = np.asfarray(x)
        x = np.sort(x)

        x1 = x[x<=self.mu]
        y1 = self.dist1.cdf(x1)

        x2 = x[x>self.mu]
        y2 = self.dist2.cdf(x2)

        y = np.concatenate((y1, y2))
        return y

# With mode
class Split_Normal():
    """
    The split-normal distribution is a result from joining at the mode
    the corresponding halves of two normal distributions with the same
    mean but different variances.
    """
    def __init__(self, mu, sig1, sig2):
        self.mu = mu
        self.sig1 = sig1
        self.sig2 = sig2

        # Mode and STD
        self.mode = mu - np.sqrt(2 / np.pi) * (sig2 - sig1)
        self.sigma = np.sqrt((1. -2. / np.pi) * (sig2 - sig1)**2 + sig1 * sig2)

        # Normalizing constant
        self.A =1.# np.sqrt(2. / np.pi) / (sig1 + sig2)

        # Halves distributions
        self.dist1 = cp.Normal(self.mode, sig1)
        self.dist2 = cp.Normal(self.mode, sig2)

    # Probability density function
    def pdf(self, x):
        x = np.asfarray(x)
        x = np.sort(x)

        x1 = x[x<=self.mode]
        y1 = self.A * self.dist1.pdf(x1)

        x2 = x[x>self.mode]
        y2 = self.A * self.dist2.pdf(x2)

        y = np.concatenate((y1, y2))
        return y

    # Cummulative distribution function
    def cdf(self, x):
        x = np.asfarray(x)
        x = np.sort(x)

        x1 = x[x<=self.mode]
        y1 = self.A * self.dist1.cdf(x1)

        x2 = x[x>self.mode]
        y2 = self.A * self.dist2.cdf(x2)

        y = np.concatenate((y1, y2))
        return y
