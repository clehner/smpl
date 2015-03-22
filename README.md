# smpl(1)

**smpl** is a command-line client for Simple bank accounts that uses
simple.com's unofficial API.

Use **smpl** to view your account balance, card status, transaction history,
and linked accounts.

## Installation

- Make sure you have `curl(1)`.
- Clone the repo and install smpl.
```
git clone https://github.com/clehner/smpl.git
cd smpl
make install
```

## Usage
```
Usage: smpl <command> [options]
Commands:
    help            Get help about commands
    card            Get card info
    balance         Get balance
    linked-accounts Get linked accounts
    transactions    Get transactions
    clean           Empty the cache
Options:
    -v --verbose    Be more verbose
    -n --no-cache   Skip cache
    -r --raw        Return raw JSON
```

## License
MIT
