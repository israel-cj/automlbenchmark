# AutoML Benchmark shorter runs

The OpenML AutoML Benchmark provides a framework for evaluating and comparing open-source AutoML systems.

## About This Repository

This repository is a fork of the original [AMLB repository](https://github.com/openml/automlbenchmark). The packages and setup are the same as in the original repository.

## Replicating Results

To replicate the results in shorter runs of the AMLB, use the different time constraints `[5min8c_gp3, 10min8c_gp3, 30min8c_gp3, 1h8c_gp3]` over all the frameworks evaluated in the paper:

- `autosklearn`
- `autosklearn2`
- `flaml`
- `GAMA_benchmark`
- `H2OAutoML`
- `lightautoml`
- `mljarsupervised_benchmark`
- `NaiveAutoML`
- `TPOT`
- `FEDOT`
- `AutoGluon_benchmark`
- `AutoGluon_hq`
- `AutoGluon_hq_il001`

For example, to run the benchmark for `flaml` on two suites (271 classification and 269 regression), use the following commands:

```bash
python runbenchmark.py flaml:2024Q1 openml/s/271
python runbenchmark.py flaml:2024Q1 openml/s/269
```
## Early Stopping
For early stopping, the following frameworks/setups were evaluated. Use the same procedure as above but with the setup `E`:

- `AutoGluon_benchmark`
- `AutoGluon_hq`
- `AutoGluon_hq_il001`
- `AutoGluon_fi_ft`
- `flaml`
- `H2OAutoML`
- `TPOT`
- `FEDOT`

E.g.
```bash
python runbenchmark.py flaml:2024Q1E openml/s/271
python runbenchmark.py flaml:2024Q1E openml/s/269
```

## Results and Figures

To reproduce the figures, we recommend using an independent virtual environment with Python 3.9:

```bash
python -m venv venv
source venv/bin/activate
```
Install the necessary dependencies:
```bash
python -m pip install --upgrade pip wheel
python -m pip install -r requirements.txt
python -m pip install "Orange3==3.30.0" --no-deps
```

The results are already available in [this link](https://drive.google.com/file/d/1IH6ZqUETopL-5x8Qgm7wq6vJT_DVfVI3/view?usp=sharing), please put the two csv files in `figures_repository/data`. All the figures in the paper can be reproduced from the folder `figures_repository/notebooks_finale`. The only two compulsory notebooks to run first are:

```bash
raw_to_clean.ipynb
raw_to_clean_early.ipynb
```
These notebooks prepare the data for any other notebook.

