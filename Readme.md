Use `jq` to parse UserInteraction logs
======================================

Install `jq` from https://stedolan.github.io/jq/

There is a small set of test data in `./data`.

Test it with:

```
./overview.sh ./data/day.json
```

To run the analysis against all the data:

1. Download the logs from `$TRUST/logs/userinteraction/userinteraction`
2. Extract all the logs to the `./logs` folder
3. Run:
```
./overview.sh ./logs/*
```
