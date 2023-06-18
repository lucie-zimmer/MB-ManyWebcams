
To recreate the `data_validation_useragent.csv` file from a collection of raw data files:

You need an installation of [Python 3](https://www.python.org/downloads/), this readme assumes Python 3.7.

It is highly recommended to create a virtual environment .
To do so, run

```sh
python3.7 -m venv venv
```

To activate the virtual environment before running the script, run

```sh
source venv/bin/activate
```

Before running the program, run the following command inside the virtual environment to install the necessary dependencies:

```sh
python3.7 -m pip install -r requirements.txt
``` 

To extract the validation data and device information from the raw data, create a `raw_data` directory and place the raw data .json files there. Then, run
```sh
python3.7 extract.py
``` 