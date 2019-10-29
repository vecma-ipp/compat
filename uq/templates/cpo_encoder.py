# -*- coding: UTF-8 -*-
import os
import logging
import chaospy as cp
import pandas as pd
from easyvvuq import OutputType
from easyvvuq.encoders.base import BaseEncoder
from ascii_cpo import read, write
from utils import statistics


# Specific Encoder for CPO files
class CPOEncoder(BaseEncoder, encoder_name="cpo_encoder"):

    def __init__(self,
                 template_filename, target_filename,
                 common_dir, uncertain_params, cpo_name, link_xmlfiles=False):

        # Check that user has specified the objests to use as template
        if template_filename is None:
            msg = ("CPOEncoder must be given 'template_filename': a CPO file.")
            logging.error(msg)
            raise RuntimeError(msg)

        self.template_filename = template_filename
        self.target_filename = target_filename
        self.common_dir = common_dir
        self.uncertain_params = uncertain_params
        self.cpo_name = cpo_name
        self.link_xmlfiles = link_xmlfiles

        self.fixture_support = True

        # The CPO object
        cpo_filename = os.path.join(common_dir, template_filename)
        self.cpo_core = read(cpo_filename, cpo_name)

        # Mapping with cpo file
        # TODO move to switcher  tools routine
        self.mapper = {
            "Te_boundary" : self.cpo_core.te.boundary.value[0],
            "Ti_boundary" : self.cpo_core.ti.boundary.value[0][0],
            "Te_grad" : self.cpo_core.te.ddrho,
            "Ti_grad" : self.cpo_core.ti.ddrho
        }

    @staticmethod
    def _set_params_value(cpo_core, param, value):
        # TODO find a way to use one unified switcher
        # Verify consistance betwwen cpo_core and param
        if param=="Te_boundary":
            cpo_core.te.boundary.value[0] = value
        if param=="Ti_boundary":
            cpo_core.ti.boundary.value[0][0] = value
            # In case of two ions species
            if len(cpo_core.ti.boundary.value[0]) == 2:
                cpo_core.ti.boundary.value[0][1] = value

    # Returns dict (params) for Campaign and a list (vary) of distribitions for Sampler
    def draw_app_params(self):
        params = {}
        vary = {}

        for k, d in self.uncertain_params.items():
            # Get initial values
            val = self.mapper[k]
            typ = d["type"]

            # Build the probability distribution
            dist_name = d["distribution"]
            margin_error = d["margin_error"]
            dist = statistics.get_dist(dist_name, val, margin_error)

            # Update output dict
            params.update({k: {"type": typ, "default": val}})
            vary.update({k: dist})

        return params, vary

    # Create simulation input files
    def encode(self, params={}, target_dir='', fixtures=None):

        if fixtures is not None:
            local_params = self.substitute_fixtures_params(params, fixtures, target_dir)
        else:
            local_params = params

        if not target_dir:
            raise RuntimeError('No target directory specified to encoder')

        for k in self.uncertain_params.keys():
            v = local_params[k]
            self._set_params_value(self.cpo_core, k, v)

        # Do a symbolic link to other CPO and XML files
        os.system("ln -s " + self.common_dir + "*.cpo " + target_dir)
        if self.link_xmlfiles:
            os.system("ln -s " + self.common_dir + "*.xml " + target_dir)
            os.system("ln -s " + self.common_dir + "*.xsd " + target_dir)

        # Write target input CPO file
        target_file_path = os.path.join(target_dir, self.target_filename)
        if(os.path.isfile(target_file_path)):
            os.system("rm -rf " + target_file_path)

        write(self.cpo_core, target_file_path)

    def get_restart_dict(self):
        return {"template_filename": self.template_filename,
                "target_filename": self.target_filename,
                "common_dir": self.common_dir,
                "uncertain_params": self.uncertain_params,
                "cpo_name": self.cpo_name,
                "link_xmlfiles": self.link_xmlfiles}

    def element_version(self):
        return "0.1"
