import os
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, os.path.dirname(HERE))   # cpc.py, probe.py
sys.path.insert(0, HERE)                    # sim_secondary.py
